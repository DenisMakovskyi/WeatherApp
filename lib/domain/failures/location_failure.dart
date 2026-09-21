import 'package:weather_app/domain/failures/app_failure.dart';

enum LocationFailureReason {
  servicesDisabled,
  permissionDenied,
  permissionDeniedForever,
  preciseLocationUnavailable,
  positionUnavailable,
  unknown,
}

final class LocationFailure extends AppFailure {
  const LocationFailure(this.reason);

  final LocationFailureReason reason;

  @override
  List<Object> get props => [reason];
}
