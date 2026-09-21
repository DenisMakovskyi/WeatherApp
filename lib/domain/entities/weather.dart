import 'package:equatable/equatable.dart';

import 'package:weather_app/domain/entities/location.dart';
import 'package:weather_app/domain/entities/measurement_system.dart';

final class Weather extends Equatable {
  const Weather({
    required this.observedAt,
    required this.cachedAt,
    required this.temperature,
    required this.apparentTemperature,
    required this.precipitation,
    required this.rain,
    required this.windSpeed,
    required this.relativeHumidity,
    required this.weatherCode,
    required this.measurementSystem,
    required this.requestedLocation,
    required this.gridLocation,
    required this.timezone,
  });

  final DateTime observedAt;
  final DateTime cachedAt;
  final double temperature;
  final double apparentTemperature;
  final double precipitation;
  final double rain;
  final double windSpeed;
  final int relativeHumidity;
  final int weatherCode;
  final MeasurementSystem measurementSystem;
  final Location requestedLocation;
  final Location gridLocation;
  final String timezone;

  @override
  List<Object> get props => [
    observedAt,
    cachedAt,
    temperature,
    apparentTemperature,
    precipitation,
    rain,
    windSpeed,
    relativeHumidity,
    weatherCode,
    measurementSystem,
    requestedLocation,
    gridLocation,
    timezone,
  ];
}
