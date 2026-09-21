import 'package:weather_app/domain/entities/location.dart';
import 'package:weather_app/domain/result.dart';

abstract interface class LocationRepository {
  Future<Result<Location>> getLocation();

  Future<Result<bool>> openAppSettings();

  Future<Result<bool>> openLocationSettings();
}
