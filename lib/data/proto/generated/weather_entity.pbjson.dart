// This is a generated file - do not edit.
//
// Generated from weather_entity.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use measurementSystemProtoDescriptor instead')
const MeasurementSystemProto$json = {
  '1': 'MeasurementSystemProto',
  '2': [
    {'1': 'MEASUREMENT_SYSTEM_UNSPECIFIED', '2': 0},
    {'1': 'MEASUREMENT_SYSTEM_METRIC', '2': 1},
    {'1': 'MEASUREMENT_SYSTEM_IMPERIAL', '2': 2},
  ],
};

/// Descriptor for `MeasurementSystemProto`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List measurementSystemProtoDescriptor = $convert.base64Decode(
    'ChZNZWFzdXJlbWVudFN5c3RlbVByb3RvEiIKHk1FQVNVUkVNRU5UX1NZU1RFTV9VTlNQRUNJRk'
    'lFRBAAEh0KGU1FQVNVUkVNRU5UX1NZU1RFTV9NRVRSSUMQARIfChtNRUFTVVJFTUVOVF9TWVNU'
    'RU1fSU1QRVJJQUwQAg==');

@$core.Deprecated('Use weatherEntityDescriptor instead')
const WeatherEntity$json = {
  '1': 'WeatherEntity',
  '2': [
    {'1': 'schema_version', '3': 1, '4': 1, '5': 5, '10': 'schemaVersion'},
    {
      '1': 'observed_at_epoch_seconds',
      '3': 2,
      '4': 1,
      '5': 3,
      '10': 'observedAtEpochSeconds'
    },
    {
      '1': 'cached_at_epoch_seconds',
      '3': 3,
      '4': 1,
      '5': 3,
      '10': 'cachedAtEpochSeconds'
    },
    {'1': 'temperature', '3': 4, '4': 1, '5': 1, '10': 'temperature'},
    {
      '1': 'apparent_temperature',
      '3': 5,
      '4': 1,
      '5': 1,
      '10': 'apparentTemperature'
    },
    {'1': 'precipitation', '3': 6, '4': 1, '5': 1, '10': 'precipitation'},
    {'1': 'rain', '3': 7, '4': 1, '5': 1, '10': 'rain'},
    {'1': 'wind_speed', '3': 8, '4': 1, '5': 1, '10': 'windSpeed'},
    {
      '1': 'relative_humidity',
      '3': 9,
      '4': 1,
      '5': 5,
      '10': 'relativeHumidity'
    },
    {'1': 'weather_code', '3': 10, '4': 1, '5': 5, '10': 'weatherCode'},
    {
      '1': 'measurement_system',
      '3': 11,
      '4': 1,
      '5': 14,
      '6': '.weather_app.MeasurementSystemProto',
      '10': 'measurementSystem'
    },
    {
      '1': 'requested_latitude',
      '3': 12,
      '4': 1,
      '5': 1,
      '10': 'requestedLatitude'
    },
    {
      '1': 'requested_longitude',
      '3': 13,
      '4': 1,
      '5': 1,
      '10': 'requestedLongitude'
    },
    {'1': 'grid_latitude', '3': 14, '4': 1, '5': 1, '10': 'gridLatitude'},
    {'1': 'grid_longitude', '3': 15, '4': 1, '5': 1, '10': 'gridLongitude'},
    {'1': 'timezone', '3': 16, '4': 1, '5': 9, '10': 'timezone'},
  ],
};

/// Descriptor for `WeatherEntity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List weatherEntityDescriptor = $convert.base64Decode(
    'Cg1XZWF0aGVyRW50aXR5EiUKDnNjaGVtYV92ZXJzaW9uGAEgASgFUg1zY2hlbWFWZXJzaW9uEj'
    'kKGW9ic2VydmVkX2F0X2Vwb2NoX3NlY29uZHMYAiABKANSFm9ic2VydmVkQXRFcG9jaFNlY29u'
    'ZHMSNQoXY2FjaGVkX2F0X2Vwb2NoX3NlY29uZHMYAyABKANSFGNhY2hlZEF0RXBvY2hTZWNvbm'
    'RzEiAKC3RlbXBlcmF0dXJlGAQgASgBUgt0ZW1wZXJhdHVyZRIxChRhcHBhcmVudF90ZW1wZXJh'
    'dHVyZRgFIAEoAVITYXBwYXJlbnRUZW1wZXJhdHVyZRIkCg1wcmVjaXBpdGF0aW9uGAYgASgBUg'
    '1wcmVjaXBpdGF0aW9uEhIKBHJhaW4YByABKAFSBHJhaW4SHQoKd2luZF9zcGVlZBgIIAEoAVIJ'
    'd2luZFNwZWVkEisKEXJlbGF0aXZlX2h1bWlkaXR5GAkgASgFUhByZWxhdGl2ZUh1bWlkaXR5Ei'
    'EKDHdlYXRoZXJfY29kZRgKIAEoBVILd2VhdGhlckNvZGUSUgoSbWVhc3VyZW1lbnRfc3lzdGVt'
    'GAsgASgOMiMud2VhdGhlcl9hcHAuTWVhc3VyZW1lbnRTeXN0ZW1Qcm90b1IRbWVhc3VyZW1lbn'
    'RTeXN0ZW0SLQoScmVxdWVzdGVkX2xhdGl0dWRlGAwgASgBUhFyZXF1ZXN0ZWRMYXRpdHVkZRIv'
    'ChNyZXF1ZXN0ZWRfbG9uZ2l0dWRlGA0gASgBUhJyZXF1ZXN0ZWRMb25naXR1ZGUSIwoNZ3JpZF'
    '9sYXRpdHVkZRgOIAEoAVIMZ3JpZExhdGl0dWRlEiUKDmdyaWRfbG9uZ2l0dWRlGA8gASgBUg1n'
    'cmlkTG9uZ2l0dWRlEhoKCHRpbWV6b25lGBAgASgJUgh0aW1lem9uZQ==');
