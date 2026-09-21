import 'package:equatable/equatable.dart';

import 'package:weather_app/domain/entities/measurement_system.dart';

enum WeatherConditionUi {
  unknown,
  clear,
  mainlyClear,
  partlyCloudy,
  overcast,
  fog,
  drizzle,
  freezingDrizzle,
  rain,
  freezingRain,
  snow,
  snowGrains,
  rainShowers,
  snowShowers,
  thunderstorm,
  thunderstormWithHail,
}

final class WeatherUiModel extends Equatable {
  const WeatherUiModel({
    required this.observedAt,
    required this.cachedAt,
    required this.temperature,
    required this.apparentTemperature,
    required this.precipitation,
    required this.rain,
    required this.windSpeed,
    required this.relativeHumidity,
    required this.condition,
    required this.measurementSystem,
  });

  const WeatherUiModel.placeholder({required this.measurementSystem})
    : observedAt = null,
      cachedAt = null,
      temperature = null,
      apparentTemperature = null,
      precipitation = null,
      rain = null,
      windSpeed = null,
      relativeHumidity = null,
      condition = WeatherConditionUi.unknown;

  final DateTime? observedAt;
  final DateTime? cachedAt;
  final double? temperature;
  final double? apparentTemperature;
  final double? precipitation;
  final double? rain;
  final double? windSpeed;
  final int? relativeHumidity;
  final WeatherConditionUi condition;
  final MeasurementSystem measurementSystem;

  bool get hasData => observedAt != null;

  String get temperatureUnit {
    return switch (measurementSystem) {
      MeasurementSystem.metric => '°C',
      MeasurementSystem.imperial => '°F',
    };
  }

  String get precipitationUnit {
    return switch (measurementSystem) {
      MeasurementSystem.metric => 'mm',
      MeasurementSystem.imperial => 'in',
    };
  }

  String get windSpeedUnit {
    return switch (measurementSystem) {
      MeasurementSystem.metric => 'km/h',
      MeasurementSystem.imperial => 'mph',
    };
  }

  String get relativeHumidityUnit => '%';

  @override
  List<Object?> get props => [
    observedAt,
    cachedAt,
    temperature,
    apparentTemperature,
    precipitation,
    rain,
    windSpeed,
    relativeHumidity,
    condition,
    measurementSystem,
  ];
}

extension WeatherConditionUiLabel on WeatherConditionUi {
  String get label {
    return switch (this) {
      WeatherConditionUi.unknown => 'Unknown',
      WeatherConditionUi.clear => 'Clear sky',
      WeatherConditionUi.mainlyClear => 'Mainly clear',
      WeatherConditionUi.partlyCloudy => 'Partly cloudy',
      WeatherConditionUi.overcast => 'Overcast',
      WeatherConditionUi.fog => 'Fog',
      WeatherConditionUi.drizzle => 'Drizzle',
      WeatherConditionUi.freezingDrizzle => 'Freezing drizzle',
      WeatherConditionUi.rain => 'Rain',
      WeatherConditionUi.freezingRain => 'Freezing rain',
      WeatherConditionUi.snow => 'Snow',
      WeatherConditionUi.snowGrains => 'Snow grains',
      WeatherConditionUi.rainShowers => 'Rain showers',
      WeatherConditionUi.snowShowers => 'Snow showers',
      WeatherConditionUi.thunderstorm => 'Thunderstorm',
      WeatherConditionUi.thunderstormWithHail => 'Thunderstorm with hail',
    };
  }
}
