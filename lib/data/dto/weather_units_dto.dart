import 'package:weather_app/data/dto/dto_reader.dart';

final class WeatherUnitsDto {
  const WeatherUnitsDto({
    required this.time,
    required this.interval,
    required this.temperature,
    required this.apparentTemperature,
    required this.precipitation,
    required this.rain,
    required this.windSpeed,
    required this.relativeHumidity,
    required this.weatherCode,
  });

  factory WeatherUnitsDto.fromJson(Map<String, dynamic> json) {
    return WeatherUnitsDto(
      time: readString(json, 'time'),
      interval: readString(json, 'interval'),
      temperature: readString(json, 'temperature_2m'),
      apparentTemperature: readString(json, 'apparent_temperature'),
      precipitation: readString(json, 'precipitation'),
      rain: readString(json, 'rain'),
      windSpeed: readString(json, 'wind_speed_10m'),
      relativeHumidity: readString(json, 'relative_humidity_2m'),
      weatherCode: readString(json, 'weather_code'),
    );
  }

  final String time;
  final String interval;
  final String temperature;
  final String apparentTemperature;
  final String precipitation;
  final String rain;
  final String windSpeed;
  final String relativeHumidity;
  final String weatherCode;
}
