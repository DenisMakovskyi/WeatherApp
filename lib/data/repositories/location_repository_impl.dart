import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

import 'package:weather_app/data/data_sources/platform/location_data_source.dart';
import 'package:weather_app/data/mappers/location_mapper.dart';
import 'package:weather_app/domain/entities/location.dart';
import 'package:weather_app/domain/failures/location_failure.dart';
import 'package:weather_app/domain/repositories/location_repository.dart';
import 'package:weather_app/domain/result.dart';

@LazySingleton(as: LocationRepository)
final class LocationRepositoryImpl implements LocationRepository {
  const LocationRepositoryImpl(this._dataSource);

  final LocationDataSource _dataSource;

  @override
  Future<Result<Location>> getLocation() async {
    try {
      final isServiceEnabled = await _dataSource.isServiceEnabled();

      if (!isServiceEnabled) {
        return const Failure(
          LocationFailure(LocationFailureReason.servicesDisabled),
        );
      }

      var permission = await _dataSource.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await _dataSource.requestPermission();
      }

      if (permission == LocationPermission.denied) {
        return const Failure(
          LocationFailure(LocationFailureReason.permissionDenied),
        );
      }

      if (permission == LocationPermission.deniedForever) {
        return const Failure(
          LocationFailure(LocationFailureReason.permissionDeniedForever),
        );
      }

      if (permission == LocationPermission.unableToDetermine) {
        return const Failure(
          LocationFailure(LocationFailureReason.permissionDenied),
        );
      }

      final accuracy = await _dataSource.requestPreciseAccuracy();

      if (accuracy != LocationAccuracyStatus.precise) {
        return const Failure(
          LocationFailure(LocationFailureReason.preciseLocationUnavailable),
        );
      }

      final position = await _dataSource.getCurrentPosition();
      final location = positionToModel(position);

      return Success(location);
    } on TimeoutException {
      return const Failure(
        LocationFailure(LocationFailureReason.positionUnavailable),
      );
    } on LocationServiceDisabledException {
      return const Failure(
        LocationFailure(LocationFailureReason.servicesDisabled),
      );
    } on PermissionDeniedException {
      return const Failure(
        LocationFailure(LocationFailureReason.permissionDenied),
      );
    } on Object {
      return const Failure(LocationFailure(LocationFailureReason.unknown));
    }
  }

  @override
  Future<Result<bool>> openAppSettings() async {
    try {
      final isOpened = await _dataSource.openAppSettings();

      return Success(isOpened);
    } on Object {
      return const Failure(LocationFailure(LocationFailureReason.unknown));
    }
  }

  @override
  Future<Result<bool>> openLocationSettings() async {
    try {
      final isOpened = await _dataSource.openLocationSettings();

      return Success(isOpened);
    } on Object {
      return const Failure(LocationFailure(LocationFailureReason.unknown));
    }
  }
}
