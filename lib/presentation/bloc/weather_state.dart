part of 'weather_bloc.dart';

enum WeatherStatus { initial, loading, refreshing, success, failure }

final class WeatherState extends Equatable {
  const WeatherState.initial()
    : status = WeatherStatus.initial,
      weather = const WeatherUiModel.placeholder(
        measurementSystem: MeasurementSystem.metric,
      ),
      failure = null;

  const WeatherState.loading(this.weather)
    : status = WeatherStatus.loading,
      failure = null;

  const WeatherState.refreshing(this.weather)
    : status = WeatherStatus.refreshing,
      failure = null;

  const WeatherState.success(this.weather)
    : status = WeatherStatus.success,
      failure = null;

  const WeatherState.failure({required this.weather, required this.failure})
    : status = WeatherStatus.failure;

  final WeatherStatus status;
  final WeatherUiModel weather;
  final AppFailure? failure;

  @override
  List<Object?> get props => [status, weather, failure];
}
