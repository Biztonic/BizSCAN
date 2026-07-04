// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'obd_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ObdSession _$ObdSessionFromJson(Map<String, dynamic> json) {
  return _ObdSession.fromJson(json);
}

/// @nodoc
mixin _$ObdSession {
  String get sessionId => throw _privateConstructorUsedError;
  String get transportType =>
      throw _privateConstructorUsedError; // e.g. "bluetooth", "wifi", "usb", "emulator"
  String get deviceName => throw _privateConstructorUsedError;
  String get protocol => throw _privateConstructorUsedError;
  DateTime get connectedAt => throw _privateConstructorUsedError;
  DateTime? get disconnectedAt => throw _privateConstructorUsedError;
  String? get firmwareVersion => throw _privateConstructorUsedError;
  String? get adapterVersion => throw _privateConstructorUsedError;
  int get latency => throw _privateConstructorUsedError; // in milliseconds
  String get connectionQuality => throw _privateConstructorUsedError;

  /// Serializes this ObdSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ObdSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ObdSessionCopyWith<ObdSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ObdSessionCopyWith<$Res> {
  factory $ObdSessionCopyWith(
    ObdSession value,
    $Res Function(ObdSession) then,
  ) = _$ObdSessionCopyWithImpl<$Res, ObdSession>;
  @useResult
  $Res call({
    String sessionId,
    String transportType,
    String deviceName,
    String protocol,
    DateTime connectedAt,
    DateTime? disconnectedAt,
    String? firmwareVersion,
    String? adapterVersion,
    int latency,
    String connectionQuality,
  });
}

/// @nodoc
class _$ObdSessionCopyWithImpl<$Res, $Val extends ObdSession>
    implements $ObdSessionCopyWith<$Res> {
  _$ObdSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ObdSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? transportType = null,
    Object? deviceName = null,
    Object? protocol = null,
    Object? connectedAt = null,
    Object? disconnectedAt = freezed,
    Object? firmwareVersion = freezed,
    Object? adapterVersion = freezed,
    Object? latency = null,
    Object? connectionQuality = null,
  }) {
    return _then(
      _value.copyWith(
            sessionId:
                null == sessionId
                    ? _value.sessionId
                    : sessionId // ignore: cast_nullable_to_non_nullable
                        as String,
            transportType:
                null == transportType
                    ? _value.transportType
                    : transportType // ignore: cast_nullable_to_non_nullable
                        as String,
            deviceName:
                null == deviceName
                    ? _value.deviceName
                    : deviceName // ignore: cast_nullable_to_non_nullable
                        as String,
            protocol:
                null == protocol
                    ? _value.protocol
                    : protocol // ignore: cast_nullable_to_non_nullable
                        as String,
            connectedAt:
                null == connectedAt
                    ? _value.connectedAt
                    : connectedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            disconnectedAt:
                freezed == disconnectedAt
                    ? _value.disconnectedAt
                    : disconnectedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            firmwareVersion:
                freezed == firmwareVersion
                    ? _value.firmwareVersion
                    : firmwareVersion // ignore: cast_nullable_to_non_nullable
                        as String?,
            adapterVersion:
                freezed == adapterVersion
                    ? _value.adapterVersion
                    : adapterVersion // ignore: cast_nullable_to_non_nullable
                        as String?,
            latency:
                null == latency
                    ? _value.latency
                    : latency // ignore: cast_nullable_to_non_nullable
                        as int,
            connectionQuality:
                null == connectionQuality
                    ? _value.connectionQuality
                    : connectionQuality // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ObdSessionImplCopyWith<$Res>
    implements $ObdSessionCopyWith<$Res> {
  factory _$$ObdSessionImplCopyWith(
    _$ObdSessionImpl value,
    $Res Function(_$ObdSessionImpl) then,
  ) = __$$ObdSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String sessionId,
    String transportType,
    String deviceName,
    String protocol,
    DateTime connectedAt,
    DateTime? disconnectedAt,
    String? firmwareVersion,
    String? adapterVersion,
    int latency,
    String connectionQuality,
  });
}

/// @nodoc
class __$$ObdSessionImplCopyWithImpl<$Res>
    extends _$ObdSessionCopyWithImpl<$Res, _$ObdSessionImpl>
    implements _$$ObdSessionImplCopyWith<$Res> {
  __$$ObdSessionImplCopyWithImpl(
    _$ObdSessionImpl _value,
    $Res Function(_$ObdSessionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ObdSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? transportType = null,
    Object? deviceName = null,
    Object? protocol = null,
    Object? connectedAt = null,
    Object? disconnectedAt = freezed,
    Object? firmwareVersion = freezed,
    Object? adapterVersion = freezed,
    Object? latency = null,
    Object? connectionQuality = null,
  }) {
    return _then(
      _$ObdSessionImpl(
        sessionId:
            null == sessionId
                ? _value.sessionId
                : sessionId // ignore: cast_nullable_to_non_nullable
                    as String,
        transportType:
            null == transportType
                ? _value.transportType
                : transportType // ignore: cast_nullable_to_non_nullable
                    as String,
        deviceName:
            null == deviceName
                ? _value.deviceName
                : deviceName // ignore: cast_nullable_to_non_nullable
                    as String,
        protocol:
            null == protocol
                ? _value.protocol
                : protocol // ignore: cast_nullable_to_non_nullable
                    as String,
        connectedAt:
            null == connectedAt
                ? _value.connectedAt
                : connectedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        disconnectedAt:
            freezed == disconnectedAt
                ? _value.disconnectedAt
                : disconnectedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        firmwareVersion:
            freezed == firmwareVersion
                ? _value.firmwareVersion
                : firmwareVersion // ignore: cast_nullable_to_non_nullable
                    as String?,
        adapterVersion:
            freezed == adapterVersion
                ? _value.adapterVersion
                : adapterVersion // ignore: cast_nullable_to_non_nullable
                    as String?,
        latency:
            null == latency
                ? _value.latency
                : latency // ignore: cast_nullable_to_non_nullable
                    as int,
        connectionQuality:
            null == connectionQuality
                ? _value.connectionQuality
                : connectionQuality // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ObdSessionImpl implements _ObdSession {
  const _$ObdSessionImpl({
    required this.sessionId,
    required this.transportType,
    required this.deviceName,
    required this.protocol,
    required this.connectedAt,
    this.disconnectedAt,
    this.firmwareVersion,
    this.adapterVersion,
    required this.latency,
    required this.connectionQuality,
  });

  factory _$ObdSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ObdSessionImplFromJson(json);

  @override
  final String sessionId;
  @override
  final String transportType;
  // e.g. "bluetooth", "wifi", "usb", "emulator"
  @override
  final String deviceName;
  @override
  final String protocol;
  @override
  final DateTime connectedAt;
  @override
  final DateTime? disconnectedAt;
  @override
  final String? firmwareVersion;
  @override
  final String? adapterVersion;
  @override
  final int latency;
  // in milliseconds
  @override
  final String connectionQuality;

  @override
  String toString() {
    return 'ObdSession(sessionId: $sessionId, transportType: $transportType, deviceName: $deviceName, protocol: $protocol, connectedAt: $connectedAt, disconnectedAt: $disconnectedAt, firmwareVersion: $firmwareVersion, adapterVersion: $adapterVersion, latency: $latency, connectionQuality: $connectionQuality)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ObdSessionImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.transportType, transportType) ||
                other.transportType == transportType) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.protocol, protocol) ||
                other.protocol == protocol) &&
            (identical(other.connectedAt, connectedAt) ||
                other.connectedAt == connectedAt) &&
            (identical(other.disconnectedAt, disconnectedAt) ||
                other.disconnectedAt == disconnectedAt) &&
            (identical(other.firmwareVersion, firmwareVersion) ||
                other.firmwareVersion == firmwareVersion) &&
            (identical(other.adapterVersion, adapterVersion) ||
                other.adapterVersion == adapterVersion) &&
            (identical(other.latency, latency) || other.latency == latency) &&
            (identical(other.connectionQuality, connectionQuality) ||
                other.connectionQuality == connectionQuality));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    sessionId,
    transportType,
    deviceName,
    protocol,
    connectedAt,
    disconnectedAt,
    firmwareVersion,
    adapterVersion,
    latency,
    connectionQuality,
  );

  /// Create a copy of ObdSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ObdSessionImplCopyWith<_$ObdSessionImpl> get copyWith =>
      __$$ObdSessionImplCopyWithImpl<_$ObdSessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ObdSessionImplToJson(this);
  }
}

abstract class _ObdSession implements ObdSession {
  const factory _ObdSession({
    required final String sessionId,
    required final String transportType,
    required final String deviceName,
    required final String protocol,
    required final DateTime connectedAt,
    final DateTime? disconnectedAt,
    final String? firmwareVersion,
    final String? adapterVersion,
    required final int latency,
    required final String connectionQuality,
  }) = _$ObdSessionImpl;

  factory _ObdSession.fromJson(Map<String, dynamic> json) =
      _$ObdSessionImpl.fromJson;

  @override
  String get sessionId;
  @override
  String get transportType; // e.g. "bluetooth", "wifi", "usb", "emulator"
  @override
  String get deviceName;
  @override
  String get protocol;
  @override
  DateTime get connectedAt;
  @override
  DateTime? get disconnectedAt;
  @override
  String? get firmwareVersion;
  @override
  String? get adapterVersion;
  @override
  int get latency; // in milliseconds
  @override
  String get connectionQuality;

  /// Create a copy of ObdSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ObdSessionImplCopyWith<_$ObdSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
