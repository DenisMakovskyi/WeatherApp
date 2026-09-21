import 'package:weather_app/data/dto/dto_reader.dart';
import 'package:weather_app/data/dto/weather_dto.dart';
import 'package:weather_app/data/dto/weather_units_dto.dart';

final class WeatherResponse {
  const WeatherResponse({
    required this.latitude,
    required this.longitude,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.current,
    required this.currentUnits,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return WeatherResponse(
      latitude: readDouble(json, 'latitude'),
      longitude: readDouble(json, 'longitude'),
      utcOffsetSeconds: readInt(json, 'utc_offset_seconds'),
      timezone: readString(json, 'timezone'),
      timezoneAbbreviation: readString(json, 'timezone_abbreviation'),
      current: WeatherDto.fromJson(readMap(json, 'current')),
      currentUnits: WeatherUnitsDto.fromJson(readMap(json, 'current_units')),
    );
  }

  final double latitude;
  final double longitude;
  final int utcOffsetSeconds;
  final String timezone;
  final String timezoneAbbreviation;
  final WeatherDto current;
  final WeatherUnitsDto currentUnits;
}
