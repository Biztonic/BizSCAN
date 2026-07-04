// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

HealthReport _$HealthReportFromJson(Map<String, dynamic> json) {
  return _HealthReport.fromJson(json);
}

/// @nodoc
mixin _$HealthReport {
  String get reportId => throw _privateConstructorUsedError;
  String get scanId => throw _privateConstructorUsedError;
  int get overallScore => throw _privateConstructorUsedError;
  int get engineScore => throw _privateConstructorUsedError;
  int get batteryScore => throw _privateConstructorUsedError;
  int get coolingScore => throw _privateConstructorUsedError;
  int get fuelScore => throw _privateConstructorUsedError;
  int get emissionScore => throw _privateConstructorUsedError;
  List<String> get recommendations => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this HealthReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HealthReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HealthReportCopyWith<HealthReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthReportCopyWith<$Res> {
  factory $HealthReportCopyWith(
    HealthReport value,
    $Res Function(HealthReport) then,
  ) = _$HealthReportCopyWithImpl<$Res, HealthReport>;
  @useResult
  $Res call({
    String reportId,
    String scanId,
    int overallScore,
    int engineScore,
    int batteryScore,
    int coolingScore,
    int fuelScore,
    int emissionScore,
    List<String> recommendations,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$HealthReportCopyWithImpl<$Res, $Val extends HealthReport>
    implements $HealthReportCopyWith<$Res> {
  _$HealthReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HealthReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportId = null,
    Object? scanId = null,
    Object? overallScore = null,
    Object? engineScore = null,
    Object? batteryScore = null,
    Object? coolingScore = null,
    Object? fuelScore = null,
    Object? emissionScore = null,
    Object? recommendations = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            reportId:
                null == reportId
                    ? _value.reportId
                    : reportId // ignore: cast_nullable_to_non_nullable
                        as String,
            scanId:
                null == scanId
                    ? _value.scanId
                    : scanId // ignore: cast_nullable_to_non_nullable
                        as String,
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
            coolingScore:
                null == coolingScore
                    ? _value.coolingScore
                    : coolingScore // ignore: cast_nullable_to_non_nullable
                        as int,
            fuelScore:
                null == fuelScore
                    ? _value.fuelScore
                    : fuelScore // ignore: cast_nullable_to_non_nullable
                        as int,
            emissionScore:
                null == emissionScore
                    ? _value.emissionScore
                    : emissionScore // ignore: cast_nullable_to_non_nullable
                        as int,
            recommendations:
                null == recommendations
                    ? _value.recommendations
                    : recommendations // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            createdAt:
                null == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            updatedAt:
                null == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HealthReportImplCopyWith<$Res>
    implements $HealthReportCopyWith<$Res> {
  factory _$$HealthReportImplCopyWith(
    _$HealthReportImpl value,
    $Res Function(_$HealthReportImpl) then,
  ) = __$$HealthReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String reportId,
    String scanId,
    int overallScore,
    int engineScore,
    int batteryScore,
    int coolingScore,
    int fuelScore,
    int emissionScore,
    List<String> recommendations,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$HealthReportImplCopyWithImpl<$Res>
    extends _$HealthReportCopyWithImpl<$Res, _$HealthReportImpl>
    implements _$$HealthReportImplCopyWith<$Res> {
  __$$HealthReportImplCopyWithImpl(
    _$HealthReportImpl _value,
    $Res Function(_$HealthReportImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HealthReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportId = null,
    Object? scanId = null,
    Object? overallScore = null,
    Object? engineScore = null,
    Object? batteryScore = null,
    Object? coolingScore = null,
    Object? fuelScore = null,
    Object? emissionScore = null,
    Object? recommendations = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$HealthReportImpl(
        reportId:
            null == reportId
                ? _value.reportId
                : reportId // ignore: cast_nullable_to_non_nullable
                    as String,
        scanId:
            null == scanId
                ? _value.scanId
                : scanId // ignore: cast_nullable_to_non_nullable
                    as String,
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
        coolingScore:
            null == coolingScore
                ? _value.coolingScore
                : coolingScore // ignore: cast_nullable_to_non_nullable
                    as int,
        fuelScore:
            null == fuelScore
                ? _value.fuelScore
                : fuelScore // ignore: cast_nullable_to_non_nullable
                    as int,
        emissionScore:
            null == emissionScore
                ? _value.emissionScore
                : emissionScore // ignore: cast_nullable_to_non_nullable
                    as int,
        recommendations:
            null == recommendations
                ? _value._recommendations
                : recommendations // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        createdAt:
            null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        updatedAt:
            null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HealthReportImpl implements _HealthReport {
  const _$HealthReportImpl({
    required this.reportId,
    required this.scanId,
    required this.overallScore,
    required this.engineScore,
    required this.batteryScore,
    required this.coolingScore,
    required this.fuelScore,
    required this.emissionScore,
    required final List<String> recommendations,
    required this.createdAt,
    required this.updatedAt,
  }) : _recommendations = recommendations;

  factory _$HealthReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$HealthReportImplFromJson(json);

  @override
  final String reportId;
  @override
  final String scanId;
  @override
  final int overallScore;
  @override
  final int engineScore;
  @override
  final int batteryScore;
  @override
  final int coolingScore;
  @override
  final int fuelScore;
  @override
  final int emissionScore;
  final List<String> _recommendations;
  @override
  List<String> get recommendations {
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendations);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'HealthReport(reportId: $reportId, scanId: $scanId, overallScore: $overallScore, engineScore: $engineScore, batteryScore: $batteryScore, coolingScore: $coolingScore, fuelScore: $fuelScore, emissionScore: $emissionScore, recommendations: $recommendations, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthReportImpl &&
            (identical(other.reportId, reportId) ||
                other.reportId == reportId) &&
            (identical(other.scanId, scanId) || other.scanId == scanId) &&
            (identical(other.overallScore, overallScore) ||
                other.overallScore == overallScore) &&
            (identical(other.engineScore, engineScore) ||
                other.engineScore == engineScore) &&
            (identical(other.batteryScore, batteryScore) ||
                other.batteryScore == batteryScore) &&
            (identical(other.coolingScore, coolingScore) ||
                other.coolingScore == coolingScore) &&
            (identical(other.fuelScore, fuelScore) ||
                other.fuelScore == fuelScore) &&
            (identical(other.emissionScore, emissionScore) ||
                other.emissionScore == emissionScore) &&
            const DeepCollectionEquality().equals(
              other._recommendations,
              _recommendations,
            ) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    reportId,
    scanId,
    overallScore,
    engineScore,
    batteryScore,
    coolingScore,
    fuelScore,
    emissionScore,
    const DeepCollectionEquality().hash(_recommendations),
    createdAt,
    updatedAt,
  );

  /// Create a copy of HealthReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthReportImplCopyWith<_$HealthReportImpl> get copyWith =>
      __$$HealthReportImplCopyWithImpl<_$HealthReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HealthReportImplToJson(this);
  }
}

abstract class _HealthReport implements HealthReport {
  const factory _HealthReport({
    required final String reportId,
    required final String scanId,
    required final int overallScore,
    required final int engineScore,
    required final int batteryScore,
    required final int coolingScore,
    required final int fuelScore,
    required final int emissionScore,
    required final List<String> recommendations,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$HealthReportImpl;

  factory _HealthReport.fromJson(Map<String, dynamic> json) =
      _$HealthReportImpl.fromJson;

  @override
  String get reportId;
  @override
  String get scanId;
  @override
  int get overallScore;
  @override
  int get engineScore;
  @override
  int get batteryScore;
  @override
  int get coolingScore;
  @override
  int get fuelScore;
  @override
  int get emissionScore;
  @override
  List<String> get recommendations;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of HealthReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthReportImplCopyWith<_$HealthReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
