// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_health_score.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VehicleHealthScore _$VehicleHealthScoreFromJson(Map<String, dynamic> json) {
  return _VehicleHealthScore.fromJson(json);
}

/// @nodoc
mixin _$VehicleHealthScore {
  int get overallScore => throw _privateConstructorUsedError; // 0 - 100
  int get engineScore => throw _privateConstructorUsedError;
  int get batteryScore => throw _privateConstructorUsedError;
  int get emissionsScore => throw _privateConstructorUsedError;
  int get coolingScore => throw _privateConstructorUsedError;
  int get fuelSystemScore => throw _privateConstructorUsedError;
  int get transmissionScore => throw _privateConstructorUsedError;
  int get electricalScore => throw _privateConstructorUsedError;
  int get driveabilityScore => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError; // 0.0 to 1.0
  DateTime get calculatedAt => throw _privateConstructorUsedError;

  /// Serializes this VehicleHealthScore to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleHealthScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleHealthScoreCopyWith<VehicleHealthScore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleHealthScoreCopyWith<$Res> {
  factory $VehicleHealthScoreCopyWith(
    VehicleHealthScore value,
    $Res Function(VehicleHealthScore) then,
  ) = _$VehicleHealthScoreCopyWithImpl<$Res, VehicleHealthScore>;
  @useResult
  $Res call({
    int overallScore,
    int engineScore,
    int batteryScore,
    int emissionsScore,
    int coolingScore,
    int fuelSystemScore,
    int transmissionScore,
    int electricalScore,
    int driveabilityScore,
    double confidence,
    DateTime calculatedAt,
  });
}

/// @nodoc
class _$VehicleHealthScoreCopyWithImpl<$Res, $Val extends VehicleHealthScore>
    implements $VehicleHealthScoreCopyWith<$Res> {
  _$VehicleHealthScoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleHealthScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overallScore = null,
    Object? engineScore = null,
    Object? batteryScore = null,
    Object? emissionsScore = null,
    Object? coolingScore = null,
    Object? fuelSystemScore = null,
    Object? transmissionScore = null,
    Object? electricalScore = null,
    Object? driveabilityScore = null,
    Object? confidence = null,
    Object? calculatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            overallScore:
                null == overallScore
                    ? _value.overallScore
                    : overallScore // ignore: cast_nullable_to_non_nullable
                        as int,
            engineScore:
                null == engineScore
                    ? _value.engineScore
                    : engineScore // ignore: cast_nullable_to_non_nullable
                        as int,
            batteryScore:
                null == batteryScore
                    ? _value.batteryScore
                    : batteryScore // ignore: cast_nullable_to_non_nullable
                        as int,
            emissionsScore:
                null == emissionsScore
                    ? _value.emissionsScore
                    : emissionsScore // ignore: cast_nullable_to_non_nullable
                        as int,
            coolingScore:
                null == coolingScore
                    ? _value.coolingScore
                    : coolingScore // ignore: cast_nullable_to_non_nullable
                        as int,
            fuelSystemScore:
                null == fuelSystemScore
                    ? _value.fuelSystemScore
                    : fuelSystemScore // ignore: cast_nullable_to_non_nullable
                        as int,
            transmissionScore:
                null == transmissionScore
                    ? _value.transmissionScore
                    : transmissionScore // ignore: cast_nullable_to_non_nullable
                        as int,
            electricalScore:
                null == electricalScore
                    ? _value.electricalScore
                    : electricalScore // ignore: cast_nullable_to_non_nullable
                        as int,
            driveabilityScore:
                null == driveabilityScore
                    ? _value.driveabilityScore
                    : driveabilityScore // ignore: cast_nullable_to_non_nullable
                        as int,
            confidence:
                null == confidence
                    ? _value.confidence
                    : confidence // ignore: cast_nullable_to_non_nullable
                        as double,
            calculatedAt:
                null == calculatedAt
                    ? _value.calculatedAt
                    : calculatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VehicleHealthScoreImplCopyWith<$Res>
    implements $VehicleHealthScoreCopyWith<$Res> {
  factory _$$VehicleHealthScoreImplCopyWith(
    _$VehicleHealthScoreImpl value,
    $Res Function(_$VehicleHealthScoreImpl) then,
  ) = __$$VehicleHealthScoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int overallScore,
    int engineScore,
    int batteryScore,
    int emissionsScore,
    int coolingScore,
    int fuelSystemScore,
    int transmissionScore,
    int electricalScore,
    int driveabilityScore,
    double confidence,
    DateTime calculatedAt,
  });
}

/// @nodoc
class __$$VehicleHealthScoreImplCopyWithImpl<$Res>
    extends _$VehicleHealthScoreCopyWithImpl<$Res, _$VehicleHealthScoreImpl>
    implements _$$VehicleHealthScoreImplCopyWith<$Res> {
  __$$VehicleHealthScoreImplCopyWithImpl(
    _$VehicleHealthScoreImpl _value,
    $Res Function(_$VehicleHealthScoreImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VehicleHealthScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overallScore = null,
    Object? engineScore = null,
    Object? batteryScore = null,
    Object? emissionsScore = null,
    Object? coolingScore = null,
    Object? fuelSystemScore = null,
    Object? transmissionScore = null,
    Object? electricalScore = null,
    Object? driveabilityScore = null,
    Object? confidence = null,
    Object? calculatedAt = null,
  }) {
    return _then(
      _$VehicleHealthScoreImpl(
        overallScore:
            null == overallScore
                ? _value.overallScore
                : overallScore // ignore: cast_nullable_to_non_nullable
                    as int,
        engineScore:
            null == engineScore
                ? _value.engineScore
                : engineScore // ignore: cast_nullable_to_non_nullable
                    as int,
        batteryScore:
            null == batteryScore
                ? _value.batteryScore
                : batteryScore // ignore: cast_nullable_to_non_nullable
                    as int,
        emissionsScore:
            null == emissionsScore
                ? _value.emissionsScore
                : emissionsScore // ignore: cast_nullable_to_non_nullable
                    as int,
        coolingScore:
            null == coolingScore
                ? _value.coolingScore
                : coolingScore // ignore: cast_nullable_to_non_nullable
                    as int,
        fuelSystemScore:
            null == fuelSystemScore
                ? _value.fuelSystemScore
                : fuelSystemScore // ignore: cast_nullable_to_non_nullable
                    as int,
        transmissionScore:
            null == transmissionScore
                ? _value.transmissionScore
                : transmissionScore // ignore: cast_nullable_to_non_nullable
                    as int,
        electricalScore:
            null == electricalScore
                ? _value.electricalScore
                : electricalScore // ignore: cast_nullable_to_non_nullable
                    as int,
        driveabilityScore:
            null == driveabilityScore
                ? _value.driveabilityScore
                : driveabilityScore // ignore: cast_nullable_to_non_nullable
                    as int,
        confidence:
            null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                    as double,
        calculatedAt:
            null == calculatedAt
                ? _value.calculatedAt
                : calculatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleHealthScoreImpl implements _VehicleHealthScore {
  const _$VehicleHealthScoreImpl({
    this.overallScore = 100,
    this.engineScore = 100,
    this.batteryScore = 100,
    this.emissionsScore = 100,
    this.coolingScore = 100,
    this.fuelSystemScore = 100,
    this.transmissionScore = 100,
    this.electricalScore = 100,
    this.driveabilityScore = 100,
    this.confidence = 1.0,
    required this.calculatedAt,
  });

  factory _$VehicleHealthScoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleHealthScoreImplFromJson(json);

  @override
  @JsonKey()
  final int overallScore;
  // 0 - 100
  @override
  @JsonKey()
  final int engineScore;
  @override
  @JsonKey()
  final int batteryScore;
  @override
  @JsonKey()
  final int emissionsScore;
  @override
  @JsonKey()
  final int coolingScore;
  @override
  @JsonKey()
  final int fuelSystemScore;
  @override
  @JsonKey()
  final int transmissionScore;
  @override
  @JsonKey()
  final int electricalScore;
  @override
  @JsonKey()
  final int driveabilityScore;
  @override
  @JsonKey()
  final double confidence;
  // 0.0 to 1.0
  @override
  final DateTime calculatedAt;

  @override
  String toString() {
    return 'VehicleHealthScore(overallScore: $overallScore, engineScore: $engineScore, batteryScore: $batteryScore, emissionsScore: $emissionsScore, coolingScore: $coolingScore, fuelSystemScore: $fuelSystemScore, transmissionScore: $transmissionScore, electricalScore: $electricalScore, driveabilityScore: $driveabilityScore, confidence: $confidence, calculatedAt: $calculatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleHealthScoreImpl &&
            (identical(other.overallScore, overallScore) ||
                other.overallScore == overallScore) &&
            (identical(other.engineScore, engineScore) ||
                other.engineScore == engineScore) &&
            (identical(other.batteryScore, batteryScore) ||
                other.batteryScore == batteryScore) &&
            (identical(other.emissionsScore, emissionsScore) ||
                other.emissionsScore == emissionsScore) &&
            (identical(other.coolingScore, coolingScore) ||
                other.coolingScore == coolingScore) &&
            (identical(other.fuelSystemScore, fuelSystemScore) ||
                other.fuelSystemScore == fuelSystemScore) &&
            (identical(other.transmissionScore, transmissionScore) ||
                other.transmissionScore == transmissionScore) &&
            (identical(other.electricalScore, electricalScore) ||
                other.electricalScore == electricalScore) &&
            (identical(other.driveabilityScore, driveabilityScore) ||
                other.driveabilityScore == driveabilityScore) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.calculatedAt, calculatedAt) ||
                other.calculatedAt == calculatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    overallScore,
    engineScore,
    batteryScore,
    emissionsScore,
    coolingScore,
    fuelSystemScore,
    transmissionScore,
    electricalScore,
    driveabilityScore,
    confidence,
    calculatedAt,
  );

  /// Create a copy of VehicleHealthScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleHealthScoreImplCopyWith<_$VehicleHealthScoreImpl> get copyWith =>
      __$$VehicleHealthScoreImplCopyWithImpl<_$VehicleHealthScoreImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleHealthScoreImplToJson(this);
  }
}

abstract class _VehicleHealthScore implements VehicleHealthScore {
  const factory _VehicleHealthScore({
    final int overallScore,
    final int engineScore,
    final int batteryScore,
    final int emissionsScore,
    final int coolingScore,
    final int fuelSystemScore,
    final int transmissionScore,
    final int electricalScore,
    final int driveabilityScore,
    final double confidence,
    required final DateTime calculatedAt,
  }) = _$VehicleHealthScoreImpl;

  factory _VehicleHealthScore.fromJson(Map<String, dynamic> json) =
      _$VehicleHealthScoreImpl.fromJson;

  @override
  int get overallScore; // 0 - 100
  @override
  int get engineScore;
  @override
  int get batteryScore;
  @override
  int get emissionsScore;
  @override
  int get coolingScore;
  @override
  int get fuelSystemScore;
  @override
  int get transmissionScore;
  @override
  int get electricalScore;
  @override
  int get driveabilityScore;
  @override
  double get confidence; // 0.0 to 1.0
  @override
  DateTime get calculatedAt;

  /// Create a copy of VehicleHealthScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleHealthScoreImplCopyWith<_$VehicleHealthScoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
