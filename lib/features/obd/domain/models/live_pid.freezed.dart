// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_pid.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LivePid _$LivePidFromJson(Map<String, dynamic> json) {
  return _LivePid.fromJson(json);
}

/// @nodoc
mixin _$LivePid {
  String get pid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  bool get isSupported => throw _privateConstructorUsedError;

  /// Serializes this LivePid to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LivePid
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LivePidCopyWith<LivePid> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LivePidCopyWith<$Res> {
  factory $LivePidCopyWith(LivePid value, $Res Function(LivePid) then) =
      _$LivePidCopyWithImpl<$Res, LivePid>;
  @useResult
  $Res call({
    String pid,
    String name,
    double value,
    String unit,
    DateTime timestamp,
    bool isSupported,
  });
}

/// @nodoc
class _$LivePidCopyWithImpl<$Res, $Val extends LivePid>
    implements $LivePidCopyWith<$Res> {
  _$LivePidCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LivePid
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pid = null,
    Object? name = null,
    Object? value = null,
    Object? unit = null,
    Object? timestamp = null,
    Object? isSupported = null,
  }) {
    return _then(
      _value.copyWith(
            pid:
                null == pid
                    ? _value.pid
                    : pid // ignore: cast_nullable_to_non_nullable
                        as String,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            value:
                null == value
                    ? _value.value
                    : value // ignore: cast_nullable_to_non_nullable
                        as double,
            unit:
                null == unit
                    ? _value.unit
                    : unit // ignore: cast_nullable_to_non_nullable
                        as String,
            timestamp:
                null == timestamp
                    ? _value.timestamp
                    : timestamp // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            isSupported:
                null == isSupported
                    ? _value.isSupported
                    : isSupported // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LivePidImplCopyWith<$Res> implements $LivePidCopyWith<$Res> {
  factory _$$LivePidImplCopyWith(
    _$LivePidImpl value,
    $Res Function(_$LivePidImpl) then,
  ) = __$$LivePidImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String pid,
    String name,
    double value,
    String unit,
    DateTime timestamp,
    bool isSupported,
  });
}

/// @nodoc
class __$$LivePidImplCopyWithImpl<$Res>
    extends _$LivePidCopyWithImpl<$Res, _$LivePidImpl>
    implements _$$LivePidImplCopyWith<$Res> {
  __$$LivePidImplCopyWithImpl(
    _$LivePidImpl _value,
    $Res Function(_$LivePidImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LivePid
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pid = null,
    Object? name = null,
    Object? value = null,
    Object? unit = null,
    Object? timestamp = null,
    Object? isSupported = null,
  }) {
    return _then(
      _$LivePidImpl(
        pid:
            null == pid
                ? _value.pid
                : pid // ignore: cast_nullable_to_non_nullable
                    as String,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        value:
            null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                    as double,
        unit:
            null == unit
                ? _value.unit
                : unit // ignore: cast_nullable_to_non_nullable
                    as String,
        timestamp:
            null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        isSupported:
            null == isSupported
                ? _value.isSupported
                : isSupported // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LivePidImpl implements _LivePid {
  const _$LivePidImpl({
    required this.pid,
    required this.name,
    required this.value,
    required this.unit,
    required this.timestamp,
    required this.isSupported,
  });

  factory _$LivePidImpl.fromJson(Map<String, dynamic> json) =>
      _$$LivePidImplFromJson(json);

  @override
  final String pid;
  @override
  final String name;
  @override
  final double value;
  @override
  final String unit;
  @override
  final DateTime timestamp;
  @override
  final bool isSupported;

  @override
  String toString() {
    return 'LivePid(pid: $pid, name: $name, value: $value, unit: $unit, timestamp: $timestamp, isSupported: $isSupported)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LivePidImpl &&
            (identical(other.pid, pid) || other.pid == pid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.isSupported, isSupported) ||
                other.isSupported == isSupported));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, pid, name, value, unit, timestamp, isSupported);

  /// Create a copy of LivePid
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LivePidImplCopyWith<_$LivePidImpl> get copyWith =>
      __$$LivePidImplCopyWithImpl<_$LivePidImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LivePidImplToJson(this);
  }
}

abstract class _LivePid implements LivePid {
  const factory _LivePid({
    required final String pid,
    required final String name,
    required final double value,
    required final String unit,
    required final DateTime timestamp,
    required final bool isSupported,
  }) = _$LivePidImpl;

  factory _LivePid.fromJson(Map<String, dynamic> json) = _$LivePidImpl.fromJson;

  @override
  String get pid;
  @override
  String get name;
  @override
  double get value;
  @override
  String get unit;
  @override
  DateTime get timestamp;
  @override
  bool get isSupported;

  /// Create a copy of LivePid
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LivePidImplCopyWith<_$LivePidImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
