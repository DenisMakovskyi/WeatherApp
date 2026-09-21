import 'package:fixnum/fixnum.dart';

import 'package:weather_app/data/dto/weather_response.dart';
import 'package:weather_app/data/proto/generated/weather_entity.pb.dart';
import 'package:weather_app/domain/entities/location.dart';
import 'package:weather_app/domain/entities/measurement_system.dart';
import 'package:weather_app/domain/entities/weather.dart';

const _weatherEntitySchemaVersion = 1;

Weather dtoToModel({
  required WeatherResponse dto,
  required DateTime cachedAt,
  required Location requestedLocation,
  required MeasurementSystem measurementSystem,
}) {
  final current = dto.current;
  final gridLocation = Location(
    latitude: dto.latitude,
    longitude: dto.longitude,
  );

  return Weather(
    observedAt: _parseObservedAt(current.time),
    cachedAt: cachedAt.toUtc(),
    temperature: current.temperature,
    apparentTemperature: current.apparentTemperature,
    precipitation: current.precipitation,
    rain: current.rain,
    windSpeed: current.windSpeed,
    relativeHumidity: current.relativeHumidity,
    weatherCode: current.weatherCode,
    measurementSystem: measurementSystem,
    requestedLocation: requestedLocation,
    gridLocation: gridLocation,
    timezone: dto.timezone,
  );
}

Weather entityToModel(WeatherEntity entity) {
  if (entity.schemaVersion != _weatherEntitySchemaVersion) {
    throw const FormatException('Unsupported weather entity schema.');
  }

  final measurementSystem = _measurementSystemFromEntity(
    entity.measurementSystem,
  );
  final requestedLocation = Location(
    latitude: entity.requestedLatitude,
    longitude: entity.requestedLongitude,
  );
  final gridLocation = Location(
    latitude: entity.gridLatitude,
    longitude: entity.gridLongitude,
  );

  return Weather(
    observedAt: DateTime.fromMillisecondsSinceEpoch(
      entity.observedAtEpochSeconds.toInt() * 1000,
      isUtc: true,
    ),
    cachedAt: DateTime.fromMillisecondsSinceEpoch(
      entity.cachedAtEpochSeconds.toInt() * 1000,
      isUtc: true,
    ),
    temperature: entity.temperature,
    apparentTemperature: entity.apparentTemperature,
    precipitation: entity.precipitation,
    rain: entity.rain,
    windSpeed: entity.windSpeed,
    relativeHumidity: entity.relativeHumidity,
    weatherCode: entity.weatherCode,
    measurementSystem: measurementSystem,
    requestedLocation: requestedLocation,
    gridLocation: gridLocation,
    timezone: entity.timezone,
  );
}

WeatherEntity modelToEntity(Weather model) {
  return WeatherEntity(
    schemaVersion: _weatherEntitySchemaVersion,
    observedAtEpochSeconds: Int64(
      model.observedAt.millisecondsSinceEpoch ~/ 1000,
    ),
    cachedAtEpochSeconds: Int64(model.cachedAt.millisecondsSinceEpoch ~/ 1000),
    temperature: model.temperature,
    apparentTemperature: model.apparentTemperature,
    precipitation: model.precipitation,
    rain: model.rain,
    windSpeed: model.windSpeed,
    relativeHumidity: model.relativeHumidity,
    weatherCode: model.weatherCode,
    measurementSystem: _measurementSystemToEntity(model.measurementSystem),
    requestedLatitude: model.requestedLocation.latitude,
    requestedLongitude: model.requestedLocation.longitude,
    gridLatitude: model.gridLocation.latitude,
    gridLongitude: model.gridLocation.longitude,
    timezone: model.timezone,
  );
}

DateTime _parseObservedAt(String value) {
  final normalized = value.endsWith('Z') ? value : '${value}Z';

  return DateTime.parse(normalized).toUtc();
}

MeasurementSystem _measurementSystemFromEntity(MeasurementSystemProto value) {
  return switch (value) {
    MeasurementSystemProto.MEASUREMENT_SYSTEM_METRIC =>
      MeasurementSystem.metric,
    MeasurementSystemProto.MEASUREMENT_SYSTEM_IMPERIAL =>
      MeasurementSystem.imperial,
    _ => throw const FormatException('Unknown measurement system.'),
  };
}

MeasurementSystemProto _measurementSystemToEntity(MeasurementSystem value) {
  return switch (value) {
    MeasurementSystem.metric =>
      MeasurementSystemProto.MEASUREMENT_SYSTEM_METRIC,
    MeasurementSystem.imperial =>
      MeasurementSystemProto.MEASUREMENT_SYSTEM_IMPERIAL,
  };
}
