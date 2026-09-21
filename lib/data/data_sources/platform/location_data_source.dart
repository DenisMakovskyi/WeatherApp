import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
final class LocationDataSource {
  const LocationDataSource();

  static const _purposeKey = 'WeatherLocation';
  static const _settings = LocationSettings(
    accuracy: LocationAccuracy.best,
    timeLimit: Duration(seconds: 15),
  );

  Future<bool> isServiceEnabled() {
    return Geolocator.isLocationServiceEnabled();
  }

  Future<LocationPermission> checkPermission() {
    return Geolocator.checkPermission();
  }

  Future<LocationPermission> requestPermission() {
    return Geolocator.requestPermission();
  }

  Future<LocationAccuracyStatus> getLocationAccuracy() {
    return Geolocator.getLocationAccuracy();
  }

  Future<LocationAccuracyStatus> requestPreciseAccuracy() async {
    final accuracy = await getLocationAccuracy();

    if (accuracy == LocationAccuracyStatus.precise) {
      return accuracy;
    }

    if (!Platform.isIOS) {
      return accuracy;
    }

    return Geolocator.requestTemporaryFullAccuracy(purposeKey: _purposeKey);
  }

  Future<Position> getCurrentPosition() {
    return Geolocator.getCurrentPosition(locationSettings: _settings);
  }

  Future<bool> openAppSettings() {
    return Geolocator.openAppSettings();
  }

  Future<bool> openLocationSettings() {
    return Geolocator.openLocationSettings();
  }
}
