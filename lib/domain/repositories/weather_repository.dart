import 'package:weather_app/domain/entities/location.dart';
import 'package:weather_app/domain/entities/measurement_system.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/domain/result.dart';

abstract interface class WeatherRepository {
  Future<Result<Weather?>> getCachedWeather({
    required Location location,
    required MeasurementSystem measurementSystem,
  });

  Future<Result<Weather>> refreshWeather({
    required Location location,
    required MeasurementSystem measurementSystem,
  });
}
