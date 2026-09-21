import 'dart:ui';

import 'package:weather_app/domain/entities/measurement_system.dart';

final class MeasurementSystemResolver {
  const MeasurementSystemResolver();

  static const _imperialCountryCodes = {'GB', 'LR', 'MM', 'US'};

  MeasurementSystem resolve(Locale locale) {
    final countryCode = locale.countryCode?.toUpperCase();

    if (_imperialCountryCodes.contains(countryCode)) {
      return MeasurementSystem.imperial;
    }

    return MeasurementSystem.metric;
  }
}
