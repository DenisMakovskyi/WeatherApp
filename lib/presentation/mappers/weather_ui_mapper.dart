import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/presentation/models/weather_ui_model.dart';

final class WeatherUiMapper {
  const WeatherUiMapper();

  WeatherUiModel map(Weather weather) {
    return WeatherUiModel(
      observedAt: weather.observedAt,
      cachedAt: weather.cachedAt,
      temperature: weather.temperature,
      apparentTemperature: weather.apparentTemperature,
      precipitation: weather.precipitation,
      rain: weather.rain,
      windSpeed: weather.windSpeed,
      relativeHumidity: weather.relativeHumidity,
      condition: _conditionFromCode(weather.weatherCode),
      measurementSystem: weather.measurementSystem,
    );
  }

  WeatherConditionUi _conditionFromCode(int code) {
    return switch (code) {
      0 => WeatherConditionUi.clear,
      1 => WeatherConditionUi.mainlyClear,
      2 => WeatherConditionUi.partlyCloudy,
      3 => WeatherConditionUi.overcast,
      45 || 48 => WeatherConditionUi.fog,
      51 || 53 || 55 => WeatherConditionUi.drizzle,
      56 || 57 => WeatherConditionUi.freezingDrizzle,
      61 || 63 || 65 => WeatherConditionUi.rain,
      66 || 67 => WeatherConditionUi.freezingRain,
      71 || 73 || 75 => WeatherConditionUi.snow,
      77 => WeatherConditionUi.snowGrains,
      80 || 81 || 82 => WeatherConditionUi.rainShowers,
      85 || 86 => WeatherConditionUi.snowShowers,
      95 => WeatherConditionUi.thunderstorm,
      96 || 99 => WeatherConditionUi.thunderstormWithHail,
      _ => WeatherConditionUi.unknown,
    };
  }
}
