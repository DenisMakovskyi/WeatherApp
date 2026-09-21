import 'package:weather_app/domain/failures/app_failure.dart';

enum WeatherFailureReason {
  networkUnavailable,
  requestTimeout,
  apiRejected,
  invalidResponse,
  cacheReadFailed,
  cacheWriteFailed,
  unknown,
}

final class WeatherFailure extends AppFailure {
  const WeatherFailure(this.reason);

  final WeatherFailureReason reason;

  @override
  List<Object> get props => [reason];
}
