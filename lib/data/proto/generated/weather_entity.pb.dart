// This is a generated file - do not edit.
//
// Generated from weather_entity.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'weather_entity.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'weather_entity.pbenum.dart';

class WeatherEntity extends $pb.GeneratedMessage {
  factory WeatherEntity({
    $core.int? schemaVersion,
    $fixnum.Int64? observedAtEpochSeconds,
    $fixnum.Int64? cachedAtEpochSeconds,
    $core.double? temperature,
    $core.double? apparentTemperature,
    $core.double? precipitation,
    $core.double? rain,
    $core.double? windSpeed,
    $core.int? relativeHumidity,
    $core.int? weatherCode,
    MeasurementSystemProto? measurementSystem,
    $core.double? requestedLatitude,
    $core.double? requestedLongitude,
    $core.double? gridLatitude,
    $core.double? gridLongitude,
    $core.String? timezone,
  }) {
    final result = WeatherEntity._();
    if (schemaVersion != null) result.schemaVersion = schemaVersion;
    if (observedAtEpochSeconds != null)
      result.observedAtEpochSeconds = observedAtEpochSeconds;
    if (cachedAtEpochSeconds != null)
      result.cachedAtEpochSeconds = cachedAtEpochSeconds;
    if (temperature != null) result.temperature = temperature;
    if (apparentTemperature != null)
      result.apparentTemperature = apparentTemperature;
    if (precipitation != null) result.precipitation = precipitation;
    if (rain != null) result.rain = rain;
    if (windSpeed != null) result.windSpeed = windSpeed;
    if (relativeHumidity != null) result.relativeHumidity = relativeHumidity;
    if (weatherCode != null) result.weatherCode = weatherCode;
    if (measurementSystem != null) result.measurementSystem = measurementSystem;
    if (requestedLatitude != null) result.requestedLatitude = requestedLatitude;
    if (requestedLongitude != null)
      result.requestedLongitude = requestedLongitude;
    if (gridLatitude != null) result.gridLatitude = gridLatitude;
    if (gridLongitude != null) result.gridLongitude = gridLongitude;
    if (timezone != null) result.timezone = timezone;
    return result;
  }

  WeatherEntity._();

  factory WeatherEntity.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      WeatherEntity()..mergeFromBuffer(data, registry);
  factory WeatherEntity.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      WeatherEntity()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WeatherEntity',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weather_app'),
      createEmptyInstance: WeatherEntity.$_createMessage)
    ..aI(1, _omitFieldNames ? '' : 'schemaVersion')
    ..aInt64(2, _omitFieldNames ? '' : 'observedAtEpochSeconds')
    ..aInt64(3, _omitFieldNames ? '' : 'cachedAtEpochSeconds')
    ..aD(4, _omitFieldNames ? '' : 'temperature')
    ..aD(5, _omitFieldNames ? '' : 'apparentTemperature')
    ..aD(6, _omitFieldNames ? '' : 'precipitation')
    ..aD(7, _omitFieldNames ? '' : 'rain')
    ..aD(8, _omitFieldNames ? '' : 'windSpeed')
    ..aI(9, _omitFieldNames ? '' : 'relativeHumidity')
    ..aI(10, _omitFieldNames ? '' : 'weatherCode')
    ..aE<MeasurementSystemProto>(11, _omitFieldNames ? '' : 'measurementSystem',
        enumValues: MeasurementSystemProto.values)
    ..aD(12, _omitFieldNames ? '' : 'requestedLatitude')
    ..aD(13, _omitFieldNames ? '' : 'requestedLongitude')
    ..aD(14, _omitFieldNames ? '' : 'gridLatitude')
    ..aD(15, _omitFieldNames ? '' : 'gridLongitude')
    ..aOS(16, _omitFieldNames ? '' : 'timezone')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WeatherEntity clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WeatherEntity copyWith(void Function(WeatherEntity) updates) =>
      super.copyWith((message) => updates(message as WeatherEntity))
          as WeatherEntity;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use WeatherEntity() / WeatherEntity.new instead')
  static WeatherEntity create() => WeatherEntity._();
  static $pb.GeneratedMessage $_createMessage() => WeatherEntity._();
  @$core.override
  WeatherEntity createEmptyInstance() => WeatherEntity._();
  @$core.pragma('dart2js:noInline')
  static WeatherEntity getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WeatherEntity>(
          WeatherEntity.$_createMessage);
  static WeatherEntity? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get schemaVersion => $_getIZ(0);
  @$pb.TagNumber(1)
  set schemaVersion($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSchemaVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearSchemaVersion() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get observedAtEpochSeconds => $_getI64(1);
  @$pb.TagNumber(2)
  set observedAtEpochSeconds($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasObservedAtEpochSeconds() => $_has(1);
  @$pb.TagNumber(2)
  void clearObservedAtEpochSeconds() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get cachedAtEpochSeconds => $_getI64(2);
  @$pb.TagNumber(3)
  set cachedAtEpochSeconds($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCachedAtEpochSeconds() => $_has(2);
  @$pb.TagNumber(3)
  void clearCachedAtEpochSeconds() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get temperature => $_getN(3);
  @$pb.TagNumber(4)
  set temperature($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTemperature() => $_has(3);
  @$pb.TagNumber(4)
  void clearTemperature() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get apparentTemperature => $_getN(4);
  @$pb.TagNumber(5)
  set apparentTemperature($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasApparentTemperature() => $_has(4);
  @$pb.TagNumber(5)
  void clearApparentTemperature() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get precipitation => $_getN(5);
  @$pb.TagNumber(6)
  set precipitation($core.double value) => $_setDouble(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPrecipitation() => $_has(5);
  @$pb.TagNumber(6)
  void clearPrecipitation() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.double get rain => $_getN(6);
  @$pb.TagNumber(7)
  set rain($core.double value) => $_setDouble(6, value);
  @$pb.TagNumber(7)
  $core.bool hasRain() => $_has(6);
  @$pb.TagNumber(7)
  void clearRain() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.double get windSpeed => $_getN(7);
  @$pb.TagNumber(8)
  set windSpeed($core.double value) => $_setDouble(7, value);
  @$pb.TagNumber(8)
  $core.bool hasWindSpeed() => $_has(7);
  @$pb.TagNumber(8)
  void clearWindSpeed() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get relativeHumidity => $_getIZ(8);
  @$pb.TagNumber(9)
  set relativeHumidity($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasRelativeHumidity() => $_has(8);
  @$pb.TagNumber(9)
  void clearRelativeHumidity() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get weatherCode => $_getIZ(9);
  @$pb.TagNumber(10)
  set weatherCode($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasWeatherCode() => $_has(9);
  @$pb.TagNumber(10)
  void clearWeatherCode() => $_clearField(10);

  @$pb.TagNumber(11)
  MeasurementSystemProto get measurementSystem => $_getN(10);
  @$pb.TagNumber(11)
  set measurementSystem(MeasurementSystemProto value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasMeasurementSystem() => $_has(10);
  @$pb.TagNumber(11)
  void clearMeasurementSystem() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.double get requestedLatitude => $_getN(11);
  @$pb.TagNumber(12)
  set requestedLatitude($core.double value) => $_setDouble(11, value);
  @$pb.TagNumber(12)
  $core.bool hasRequestedLatitude() => $_has(11);
  @$pb.TagNumber(12)
  void clearRequestedLatitude() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.double get requestedLongitude => $_getN(12);
  @$pb.TagNumber(13)
  set requestedLongitude($core.double value) => $_setDouble(12, value);
  @$pb.TagNumber(13)
  $core.bool hasRequestedLongitude() => $_has(12);
  @$pb.TagNumber(13)
  void clearRequestedLongitude() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.double get gridLatitude => $_getN(13);
  @$pb.TagNumber(14)
  set gridLatitude($core.double value) => $_setDouble(13, value);
  @$pb.TagNumber(14)
  $core.bool hasGridLatitude() => $_has(13);
  @$pb.TagNumber(14)
  void clearGridLatitude() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.double get gridLongitude => $_getN(14);
  @$pb.TagNumber(15)
  set gridLongitude($core.double value) => $_setDouble(14, value);
  @$pb.TagNumber(15)
  $core.bool hasGridLongitude() => $_has(14);
  @$pb.TagNumber(15)
  void clearGridLongitude() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.String get timezone => $_getSZ(15);
  @$pb.TagNumber(16)
  set timezone($core.String value) => $_setString(15, value);
  @$pb.TagNumber(16)
  $core.bool hasTimezone() => $_has(15);
  @$pb.TagNumber(16)
  void clearTimezone() => $_clearField(16);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
