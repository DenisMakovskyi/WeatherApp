import 'package:geolocator/geolocator.dart';

import 'package:weather_app/domain/entities/location.dart';

Location positionToModel(Position position) {
  return Location(latitude: position.latitude, longitude: position.longitude);
}
