import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

import 'package:weather_app/application/services/measurement_system_resolver.dart';
import 'package:weather_app/domain/repositories/location_repository.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/domain/use_cases/weather_use_case.dart';
import 'package:weather_app/presentation/mappers/weather_ui_mapper.dart';

@module
abstract class AppModule {
  @lazySingleton
  Client get client => Client();

  @lazySingleton
  MeasurementSystemResolver get measurementSystemResolver {
    return const MeasurementSystemResolver();
  }

  @lazySingleton
  WeatherUiMapper get weatherUiMapper {
    return const WeatherUiMapper();
  }

  @lazySingleton
  WeatherUseCase weatherUseCase(
    LocationRepository locationRepository,
    WeatherRepository weatherRepository,
  ) {
    return WeatherUseCase(locationRepository, weatherRepository);
  }
}
