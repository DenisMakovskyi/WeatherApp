import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

import 'package:weather_app/data/dto/weather_response.dart';
import 'package:weather_app/data/exceptions/open_meteo_exception.dart';
import 'package:weather_app/domain/entities/location.dart';
import 'package:weather_app/domain/entities/measurement_system.dart';

@lazySingleton
final class WeatherRemoteDataSource {
  const WeatherRemoteDataSource(this._client);

  static const _host = 'api.open-meteo.com';
  static const _path = '/v1/forecast';
  static const _timeout = Duration(seconds: 15);
  static const _currentFields = <String>[
    'temperature_2m',
    'apparent_temperature',
    'precipitation',
    'rain',
    'wind_speed_10m',
    'relative_humidity_2m',
    'weather_code',
  ];

  final Client _client;

  Future<WeatherResponse> getCurrentWeather({
    required Location location,
    required MeasurementSystem measurementSystem,
  }) async {
    final uri = Uri.https(
      _host,
      _path,
      _queryParameters(
        location: location,
        measurementSystem: measurementSystem,
      ),
    );

    final response = await _client
        .get(uri, headers: const {'Accept': 'application/json'})
        .timeout(_timeout);

    final body = _decodeBody(response.body);

    if (response.statusCode != 200) {
      throw OpenMeteoException(
        code: response.statusCode,
        reason: _readErrorReason(body),
      );
    }

    return WeatherResponse.fromJson(body);
  }

  Map<String, String> _queryParameters({
    required Location location,
    required MeasurementSystem measurementSystem,
  }) {
    final isMetric = measurementSystem == MeasurementSystem.metric;

    return {
      'latitude': location.latitude.toString(),
      'longitude': location.longitude.toString(),
      'current': _currentFields.join(','),
      'temperature_unit': isMetric ? 'celsius' : 'fahrenheit',
      'wind_speed_unit': isMetric ? 'kmh' : 'mph',
      'precipitation_unit': isMetric ? 'mm' : 'inch',
      'timezone': 'GMT',
    };
  }

  Map<String, dynamic> _decodeBody(String source) {
    final Object? value = jsonDecode(source);

    if (value is Map<String, dynamic>) {
      return value;
    }

    throw const FormatException('Expected an object response.');
  }

  String _readErrorReason(Map<String, dynamic> body) {
    final reason = body['reason'];

    if (reason is String && reason.isNotEmpty) {
      return reason;
    }

    return 'Open-Meteo rejected the request.';
  }
}
