import 'dart:math';

import 'package:equatable/equatable.dart';

final class Location extends Equatable {
  const Location({required this.latitude, required this.longitude});

  final double latitude;
  final double longitude;

  double distanceTo(Location other) {
    const earthRadiusMeters = 6371000.0;

    final latitudeStart = _toRadians(latitude);
    final latitudeEnd = _toRadians(other.latitude);
    final latitudeDelta = _toRadians(other.latitude - latitude);
    final longitudeDelta = _toRadians(other.longitude - longitude);

    final latitudeHaversine = sin(latitudeDelta / 2) * sin(latitudeDelta / 2);
    final longitudeHaversine =
        sin(longitudeDelta / 2) * sin(longitudeDelta / 2);
    final haversine =
        latitudeHaversine +
        cos(latitudeStart) * cos(latitudeEnd) * longitudeHaversine;

    return earthRadiusMeters * 2 * atan2(sqrt(haversine), sqrt(1 - haversine));
  }

  @override
  List<Object> get props => [latitude, longitude];
}

double _toRadians(double degrees) {
  return degrees * pi / 180;
}
