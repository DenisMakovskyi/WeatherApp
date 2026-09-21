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

import 'package:protobuf/protobuf.dart' as $pb;

class MeasurementSystemProto extends $pb.ProtobufEnum {
  static const MeasurementSystemProto MEASUREMENT_SYSTEM_UNSPECIFIED =
      MeasurementSystemProto._(
          0, _omitEnumNames ? '' : 'MEASUREMENT_SYSTEM_UNSPECIFIED');
  static const MeasurementSystemProto MEASUREMENT_SYSTEM_METRIC =
      MeasurementSystemProto._(
          1, _omitEnumNames ? '' : 'MEASUREMENT_SYSTEM_METRIC');
  static const MeasurementSystemProto MEASUREMENT_SYSTEM_IMPERIAL =
      MeasurementSystemProto._(
          2, _omitEnumNames ? '' : 'MEASUREMENT_SYSTEM_IMPERIAL');

  static const $core.List<MeasurementSystemProto> values =
      <MeasurementSystemProto>[
    MEASUREMENT_SYSTEM_UNSPECIFIED,
    MEASUREMENT_SYSTEM_METRIC,
    MEASUREMENT_SYSTEM_IMPERIAL,
  ];

  static final $core.List<MeasurementSystemProto?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static MeasurementSystemProto? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const MeasurementSystemProto._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
