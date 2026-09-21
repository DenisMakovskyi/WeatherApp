import 'dart:async';
import 'dart:io';

import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

import 'package:weather_app/data/data_sources/local/weather_local_data_source.dart';
import 'package:weather_app/data/data_sources/remote/weather_remote_data_source.dart';
import 'package:weather_app/data/exceptions/open_meteo_exception.dart';
import 'package:weather_app/data/mappers/weather_mapper.dart';
import 'package:weather_app/domain/entities/location.dart';
import 'package:weather_app/domain/entities/measurement_system.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/domain/failures/weather_failure.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/domain/result.dart';

@LazySingleton(as: WeatherRepository)
final class WeatherRepositoryImpl implements WeatherRepository {
  const WeatherRepositoryImpl(this._localDataSource, this._remoteDataSource);

  static const _maxCacheDistanceMeters = 10000.0;

  final WeatherLocalDataSource _localDataSource;
  final WeatherRemoteDataSource _remoteDataSource;

  @override
  Future<Result<Weather?>> getCachedWeather({
    required Location location,
    required MeasurementSystem measurementSystem,
  }) async {
    try {
      final entity = await _localDataSource.read();

      if (entity == null) {
        return const Success(null);
      }

      final weather = entityToModel(entity);
      final distance = weather.requestedLocation.distanceTo(location);

      if (weather.measurementSystem != measurementSystem) {
        return const Success(null);
      }

      if (distance > _maxCacheDistanceMeters) {
        return const Success(null);
      }

      return Success(weather);
    } on Object {
      return const Failure(
        WeatherFailure(WeatherFailureReason.cacheReadFailed),
      );
    }
  }

  @override
  Future<Result<Weather>> refreshWeather({
    required Location location,
    required MeasurementSystem measurementSystem,
  }) async {
    late final Weather weather;

    try {
      final dto = await _remoteDataSource.getCurrentWeather(
        location: location,
        measurementSystem: measurementSystem,
      );

      weather = dtoToModel(
        dto: dto,
        cachedAt: DateTime.now(),
        requestedLocation: location,
        measurementSystem: measurementSystem,
      );
    } on TimeoutException {
      return const Failure(WeatherFailure(WeatherFailureReason.requestTimeout));
    } on SocketException {
      return const Failure(
        WeatherFailure(WeatherFailureReason.networkUnavailable),
      );
    } on ClientException {
      return const Failure(
        WeatherFailure(WeatherFailureReason.networkUnavailable),
      );
    } on OpenMeteoException {
      return const Failure(WeatherFailure(WeatherFailureReason.apiRejected));
    } on FormatException {
      return const Failure(
        WeatherFailure(WeatherFailureReason.invalidResponse),
      );
    } on Object {
      return const Failure(WeatherFailure(WeatherFailureReason.unknown));
    }

    try {
      await _localDataSource.write(modelToEntity(weather));
    } on Object {
      return const Failure(
        WeatherFailure(WeatherFailureReason.cacheWriteFailed),
      );
    }

    try {
      final entity = await _localDataSource.read();

      if (entity == null) {
        return const Failure(
          WeatherFailure(WeatherFailureReason.cacheReadFailed),
        );
      }

      return Success(entityToModel(entity));
    } on Object {
      return const Failure(
        WeatherFailure(WeatherFailureReason.cacheReadFailed),
      );
    }
  }
}
