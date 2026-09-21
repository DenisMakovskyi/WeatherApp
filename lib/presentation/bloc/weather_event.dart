part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();
}

sealed class WeatherLoadRequested extends WeatherEvent {
  const WeatherLoadRequested();
}

final class WeatherStarted extends WeatherLoadRequested {
  const WeatherStarted(this.locale);

  final Locale locale;

  @override
  List<Object> get props => [locale];
}

final class WeatherRetryRequested extends WeatherLoadRequested {
  const WeatherRetryRequested();

  @override
  List<Object> get props => [];
}

final class WeatherAppSettingsRequested extends WeatherEvent {
  const WeatherAppSettingsRequested();

  @override
  List<Object> get props => [];
}

final class WeatherLocationSettingsRequested extends WeatherEvent {
  const WeatherLocationSettingsRequested();

  @override
  List<Object> get props => [];
}
