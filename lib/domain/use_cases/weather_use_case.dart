import 'package:equatable/equatable.dart';

import 'package:weather_app/domain/entities/measurement_system.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/domain/failures/app_failure.dart';
import 'package:weather_app/domain/repositories/location_repository.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/domain/result.dart';

sealed class WeatherLoadUpdate extends Equatable {
  const WeatherLoadUpdate();
}

final class CachedWeatherLoaded extends WeatherLoadUpdate {
  const CachedWeatherLoaded(this.weather);

  final Weather weather;

  @override
  List<Object> get props => [weather];
}

final class CurrentWeatherLoaded extends WeatherLoadUpdate {
  const CurrentWeatherLoaded(this.weather);

  final Weather weather;

  @override
  List<Object> get props => [weather];
}

final class WeatherLoadFailed extends WeatherLoadUpdate {
  const WeatherLoadFailed(this.failure);

  final AppFailure failure;

  @override
  List<Object> get props => [failure];
}

final class WeatherUseCase {
  const WeatherUseCase(this._locationRepository, this._weatherRepository);

  final LocationRepository _locationRepository;
  final WeatherRepository _weatherRepository;

  Stream<WeatherLoadUpdate> call({
    required MeasurementSystem measurementSystem,
  }) async* {
    final locationResult = await _locationRepository.getLocation();

    switch (locationResult) {
      case Failure(:final failure):
        yield WeatherLoadFailed(failure);
        return;
      case Success(:final value):
        final cacheResult = await _weatherRepository.getCachedWeather(
          location: value,
          measurementSystem: measurementSystem,
        );

        if (cacheResult case Success(:final value?)) {
          yield CachedWeatherLoaded(value);
        }

        final refreshResult = await _weatherRepository.refreshWeather(
          location: value,
          measurementSystem: measurementSystem,
        );

        switch (refreshResult) {
          case Failure(:final failure):
            yield WeatherLoadFailed(failure);
          case Success(:final value):
            yield CurrentWeatherLoaded(value);
        }
    }
  }
}
