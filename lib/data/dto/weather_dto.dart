import 'package:weather_app/data/dto/dto_reader.dart';

final class WeatherDto {
  const WeatherDto({
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

  factory WeatherDto.fromJson(Map<String, dynamic> json) {
    return WeatherDto(
      time: readString(json, 'time'),
      interval: readInt(json, 'interval'),
      temperature: readDouble(json, 'temperature_2m'),
      apparentTemperature: readDouble(json, 'apparent_temperature'),
      precipitation: readDouble(json, 'precipitation'),
      rain: readDouble(json, 'rain'),
      windSpeed: readDouble(json, 'wind_speed_10m'),
      relativeHumidity: readInt(json, 'relative_humidity_2m'),
      weatherCode: readInt(json, 'weather_code'),
    );
  }

  final String time;
  final int interval;
  final double temperature;
  final double apparentTemperature;
  final double precipitation;
  final double rain;
  final double windSpeed;
  final int relativeHumidity;
  final int weatherCode;
}
