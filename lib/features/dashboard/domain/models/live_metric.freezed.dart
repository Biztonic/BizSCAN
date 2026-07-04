// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_metric.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LiveMetric _$LiveMetricFromJson(Map<String, dynamic> json) {
  return _LiveMetric.fromJson(json);
}

/// @nodoc
mixin _$LiveMetric {
  String get metricName => throw _privateConstructorUsedError;
  double get currentValue => throw _privateConstructorUsedError;
  double get previousValue => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  String get trend =>
      throw _privateConstructorUsedError; // 'up', 'down', 'stable'
  String get status =>
      throw _privateConstructorUsedError; // 'normal', 'warning', 'critical'
  DateTime get timestamp => throw _privateConstructorUsedError;
  bool get isStale => throw _privateConstructorUsedError;

  /// Serializes this LiveMetric to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LiveMetric
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LiveMetricCopyWith<LiveMetric> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveMetricCopyWith<$Res> {
  factory $LiveMetricCopyWith(
    LiveMetric value,
    $Res Function(LiveMetric) then,
  ) = _$LiveMetricCopyWithImpl<$Res, LiveMetric>;
  @useResult
  $Res call({
    String metricName,
    double currentValue,
    double previousValue,
    String unit,
    String trend,
    String status,
    DateTime timestamp,
    bool isStale,
  });
}

/// @nodoc
class _$LiveMetricCopyWithImpl<$Res, $Val extends LiveMetric>
    implements $LiveMetricCopyWith<$Res> {
  _$LiveMetricCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LiveMetric
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metricName = null,
    Object? currentValue = null,
    Object? previousValue = null,
    Object? unit = null,
    Object? trend = null,
    Object? status = null,
    Object? timestamp = null,
    Object? isStale = null,
  }) {
    return _then(
      _value.copyWith(
            metricName:
                null == metricName
                    ? _value.metricName
                    : metricName // ignore: cast_nullable_to_non_nullable
                        as String,
            currentValue:
                null == currentValue
                    ? _value.currentValue
                    : currentValue // ignore: cast_nullable_to_non_nullable
                        as double,
            previousValue:
                null == previousValue
                    ? _value.previousValue
                    : previousValue // ignore: cast_nullable_to_non_nullable
                        as double,
            unit:
                null == unit
                    ? _value.unit
                    : unit // ignore: cast_nullable_to_non_nullable
                        as String,
            trend:
                null == trend
                    ? _value.trend
                    : trend // ignore: cast_nullable_to_non_nullable
                        as String,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String,
            timestamp:
                null == timestamp
                    ? _value.timestamp
                    : timestamp // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            isStale:
                null == isStale
                    ? _value.isStale
                    : isStale // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LiveMetricImplCopyWith<$Res>
    implements $LiveMetricCopyWith<$Res> {
  factory _$$LiveMetricImplCopyWith(
    _$LiveMetricImpl value,
    $Res Function(_$LiveMetricImpl) then,
  ) = __$$LiveMetricImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String metricName,
    double currentValue,
    double previousValue,
    String unit,
    String trend,
    String status,
    DateTime timestamp,
    bool isStale,
  });
}

/// @nodoc
class __$$LiveMetricImplCopyWithImpl<$Res>
    extends _$LiveMetricCopyWithImpl<$Res, _$LiveMetricImpl>
    implements _$$LiveMetricImplCopyWith<$Res> {
  __$$LiveMetricImplCopyWithImpl(
    _$LiveMetricImpl _value,
    $Res Function(_$LiveMetricImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LiveMetric
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metricName = null,
    Object? currentValue = null,
    Object? previousValue = null,
    Object? unit = null,
    Object? trend = null,
    Object? status = null,
    Object? timestamp = null,
    Object? isStale = null,
  }) {
    return _then(
      _$LiveMetricImpl(
        metricName:
            null == metricName
                ? _value.metricName
                : metricName // ignore: cast_nullable_to_non_nullable
                    as String,
        currentValue:
            null == currentValue
                ? _value.currentValue
                : currentValue // ignore: cast_nullable_to_non_nullable
                    as double,
        previousValue:
            null == previousValue
                ? _value.previousValue
                : previousValue // ignore: cast_nullable_to_non_nullable
                    as double,
        unit:
            null == unit
                ? _value.unit
                : unit // ignore: cast_nullable_to_non_nullable
                    as String,
        trend:
            null == trend
                ? _value.trend
                : trend // ignore: cast_nullable_to_non_nullable
                    as String,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String,
        timestamp:
            null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        isStale:
            null == isStale
                ? _value.isStale
                : isStale // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveMetricImpl implements _LiveMetric {
  const _$LiveMetricImpl({
    required this.metricName,
    required this.currentValue,
    this.previousValue = 0.0,
    required this.unit,
    this.trend = 'stable',
    this.status = 'normal',
    required this.timestamp,
    this.isStale = false,
  });

  factory _$LiveMetricImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveMetricImplFromJson(json);

  @override
  final String metricName;
  @override
  final double currentValue;
  @override
  @JsonKey()
  final double previousValue;
  @override
  final String unit;
  @override
  @JsonKey()
  final String trend;
  // 'up', 'down', 'stable'
  @override
  @JsonKey()
  final String status;
  // 'normal', 'warning', 'critical'
  @override
  final DateTime timestamp;
  @override
  @JsonKey()
  final bool isStale;

  @override
  String toString() {
    return 'LiveMetric(metricName: $metricName, currentValue: $currentValue, previousValue: $previousValue, unit: $unit, trend: $trend, status: $status, timestamp: $timestamp, isStale: $isStale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveMetricImpl &&
            (identical(other.metricName, metricName) ||
                other.metricName == metricName) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.previousValue, previousValue) ||
                other.previousValue == previousValue) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.trend, trend) || other.trend == trend) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.isStale, isStale) || other.isStale == isStale));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    metricName,
    currentValue,
    previousValue,
    unit,
    trend,
    status,
    timestamp,
    isStale,
  );

  /// Create a copy of LiveMetric
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveMetricImplCopyWith<_$LiveMetricImpl> get copyWith =>
      __$$LiveMetricImplCopyWithImpl<_$LiveMetricImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveMetricImplToJson(this);
  }
}

abstract class _LiveMetric implements LiveMetric {
  const factory _LiveMetric({
    required final String metricName,
    required final double currentValue,
    final double previousValue,
    required final String unit,
    final String trend,
    final String status,
    required final DateTime timestamp,
    final bool isStale,
  }) = _$LiveMetricImpl;

  factory _LiveMetric.fromJson(Map<String, dynamic> json) =
      _$LiveMetricImpl.fromJson;

  @override
  String get metricName;
  @override
  double get currentValue;
  @override
  double get previousValue;
  @override
  String get unit;
  @override
  String get trend; // 'up', 'down', 'stable'
  @override
  String get status; // 'normal', 'warning', 'critical'
  @override
  DateTime get timestamp;
  @override
  bool get isStale;

  /// Create a copy of LiveMetric
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiveMetricImplCopyWith<_$LiveMetricImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
