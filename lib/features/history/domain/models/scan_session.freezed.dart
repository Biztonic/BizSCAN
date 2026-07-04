// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ScanSession _$ScanSessionFromJson(Map<String, dynamic> json) {
  return _ScanSession.fromJson(json);
}

/// @nodoc
mixin _$ScanSession {
  String get scanId => throw _privateConstructorUsedError;
  String get vehicleId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  String get connectionType => throw _privateConstructorUsedError;
  String? get bluetoothDevice => throw _privateConstructorUsedError;
  String get protocol => throw _privateConstructorUsedError;
  int get scanDuration => throw _privateConstructorUsedError; // in seconds
  String? get firmwareVersion => throw _privateConstructorUsedError;
  String get appVersion => throw _privateConstructorUsedError;
  bool get isSynced => throw _privateConstructorUsedError;

  /// Serializes this ScanSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScanSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScanSessionCopyWith<ScanSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanSessionCopyWith<$Res> {
  factory $ScanSessionCopyWith(
    ScanSession value,
    $Res Function(ScanSession) then,
  ) = _$ScanSessionCopyWithImpl<$Res, ScanSession>;
  @useResult
  $Res call({
    String scanId,
    String vehicleId,
    String userId,
    DateTime startedAt,
    DateTime? completedAt,
    String connectionType,
    String? bluetoothDevice,
    String protocol,
    int scanDuration,
    String? firmwareVersion,
    String appVersion,
    bool isSynced,
  });
}

/// @nodoc
class _$ScanSessionCopyWithImpl<$Res, $Val extends ScanSession>
    implements $ScanSessionCopyWith<$Res> {
  _$ScanSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScanSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scanId = null,
    Object? vehicleId = null,
    Object? userId = null,
    Object? startedAt = null,
    Object? completedAt = freezed,
    Object? connectionType = null,
    Object? bluetoothDevice = freezed,
    Object? protocol = null,
    Object? scanDuration = null,
    Object? firmwareVersion = freezed,
    Object? appVersion = null,
    Object? isSynced = null,
  }) {
    return _then(
      _value.copyWith(
            scanId:
                null == scanId
                    ? _value.scanId
                    : scanId // ignore: cast_nullable_to_non_nullable
                        as String,
            vehicleId:
                null == vehicleId
                    ? _value.vehicleId
                    : vehicleId // ignore: cast_nullable_to_non_nullable
                        as String,
            userId:
                null == userId
                    ? _value.userId
                    : userId // ignore: cast_nullable_to_non_nullable
                        as String,
            startedAt:
                null == startedAt
                    ? _value.startedAt
                    : startedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            completedAt:
                freezed == completedAt
                    ? _value.completedAt
                    : completedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            connectionType:
                null == connectionType
                    ? _value.connectionType
                    : connectionType // ignore: cast_nullable_to_non_nullable
                        as String,
            bluetoothDevice:
                freezed == bluetoothDevice
                    ? _value.bluetoothDevice
                    : bluetoothDevice // ignore: cast_nullable_to_non_nullable
                        as String?,
            protocol:
                null == protocol
                    ? _value.protocol
                    : protocol // ignore: cast_nullable_to_non_nullable
                        as String,
            scanDuration:
                null == scanDuration
                    ? _value.scanDuration
                    : scanDuration // ignore: cast_nullable_to_non_nullable
                        as int,
            firmwareVersion:
                freezed == firmwareVersion
                    ? _value.firmwareVersion
                    : firmwareVersion // ignore: cast_nullable_to_non_nullable
                        as String?,
            appVersion:
                null == appVersion
                    ? _value.appVersion
                    : appVersion // ignore: cast_nullable_to_non_nullable
                        as String,
            isSynced:
                null == isSynced
                    ? _value.isSynced
                    : isSynced // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ScanSessionImplCopyWith<$Res>
    implements $ScanSessionCopyWith<$Res> {
  factory _$$ScanSessionImplCopyWith(
    _$ScanSessionImpl value,
    $Res Function(_$ScanSessionImpl) then,
  ) = __$$ScanSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String scanId,
    String vehicleId,
    String userId,
    DateTime startedAt,
    DateTime? completedAt,
    String connectionType,
    String? bluetoothDevice,
    String protocol,
    int scanDuration,
    String? firmwareVersion,
    String appVersion,
    bool isSynced,
  });
}

/// @nodoc
class __$$ScanSessionImplCopyWithImpl<$Res>
    extends _$ScanSessionCopyWithImpl<$Res, _$ScanSessionImpl>
    implements _$$ScanSessionImplCopyWith<$Res> {
  __$$ScanSessionImplCopyWithImpl(
    _$ScanSessionImpl _value,
    $Res Function(_$ScanSessionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ScanSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scanId = null,
    Object? vehicleId = null,
    Object? userId = null,
    Object? startedAt = null,
    Object? completedAt = freezed,
    Object? connectionType = null,
    Object? bluetoothDevice = freezed,
    Object? protocol = null,
    Object? scanDuration = null,
    Object? firmwareVersion = freezed,
    Object? appVersion = null,
    Object? isSynced = null,
  }) {
    return _then(
      _$ScanSessionImpl(
        scanId:
            null == scanId
                ? _value.scanId
                : scanId // ignore: cast_nullable_to_non_nullable
                    as String,
        vehicleId:
            null == vehicleId
                ? _value.vehicleId
                : vehicleId // ignore: cast_nullable_to_non_nullable
                    as String,
        userId:
            null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as String,
        startedAt:
            null == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        completedAt:
            freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        connectionType:
            null == connectionType
                ? _value.connectionType
                : connectionType // ignore: cast_nullable_to_non_nullable
                    as String,
        bluetoothDevice:
            freezed == bluetoothDevice
                ? _value.bluetoothDevice
                : bluetoothDevice // ignore: cast_nullable_to_non_nullable
                    as String?,
        protocol:
            null == protocol
                ? _value.protocol
                : protocol // ignore: cast_nullable_to_non_nullable
                    as String,
        scanDuration:
            null == scanDuration
                ? _value.scanDuration
                : scanDuration // ignore: cast_nullable_to_non_nullable
                    as int,
        firmwareVersion:
            freezed == firmwareVersion
                ? _value.firmwareVersion
                : firmwareVersion // ignore: cast_nullable_to_non_nullable
                    as String?,
        appVersion:
            null == appVersion
                ? _value.appVersion
                : appVersion // ignore: cast_nullable_to_non_nullable
                    as String,
        isSynced:
            null == isSynced
                ? _value.isSynced
                : isSynced // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ScanSessionImpl implements _ScanSession {
  const _$ScanSessionImpl({
    required this.scanId,
    required this.vehicleId,
    required this.userId,
    required this.startedAt,
    this.completedAt,
    required this.connectionType,
    this.bluetoothDevice,
    required this.protocol,
    required this.scanDuration,
    this.firmwareVersion,
    required this.appVersion,
    required this.isSynced,
  });

  factory _$ScanSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScanSessionImplFromJson(json);

  @override
  final String scanId;
  @override
  final String vehicleId;
  @override
  final String userId;
  @override
  final DateTime startedAt;
  @override
  final DateTime? completedAt;
  @override
  final String connectionType;
  @override
  final String? bluetoothDevice;
  @override
  final String protocol;
  @override
  final int scanDuration;
  // in seconds
  @override
  final String? firmwareVersion;
  @override
  final String appVersion;
  @override
  final bool isSynced;

  @override
  String toString() {
    return 'ScanSession(scanId: $scanId, vehicleId: $vehicleId, userId: $userId, startedAt: $startedAt, completedAt: $completedAt, connectionType: $connectionType, bluetoothDevice: $bluetoothDevice, protocol: $protocol, scanDuration: $scanDuration, firmwareVersion: $firmwareVersion, appVersion: $appVersion, isSynced: $isSynced)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScanSessionImpl &&
            (identical(other.scanId, scanId) || other.scanId == scanId) &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.connectionType, connectionType) ||
                other.connectionType == connectionType) &&
            (identical(other.bluetoothDevice, bluetoothDevice) ||
                other.bluetoothDevice == bluetoothDevice) &&
            (identical(other.protocol, protocol) ||
                other.protocol == protocol) &&
            (identical(other.scanDuration, scanDuration) ||
                other.scanDuration == scanDuration) &&
            (identical(other.firmwareVersion, firmwareVersion) ||
                other.firmwareVersion == firmwareVersion) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.isSynced, isSynced) ||
                other.isSynced == isSynced));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    scanId,
    vehicleId,
    userId,
    startedAt,
    completedAt,
    connectionType,
    bluetoothDevice,
    protocol,
    scanDuration,
    firmwareVersion,
    appVersion,
    isSynced,
  );

  /// Create a copy of ScanSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScanSessionImplCopyWith<_$ScanSessionImpl> get copyWith =>
      __$$ScanSessionImplCopyWithImpl<_$ScanSessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScanSessionImplToJson(this);
  }
}

abstract class _ScanSession implements ScanSession {
  const factory _ScanSession({
    required final String scanId,
    required final String vehicleId,
    required final String userId,
    required final DateTime startedAt,
    final DateTime? completedAt,
    required final String connectionType,
    final String? bluetoothDevice,
    required final String protocol,
    required final int scanDuration,
    final String? firmwareVersion,
    required final String appVersion,
    required final bool isSynced,
  }) = _$ScanSessionImpl;

  factory _ScanSession.fromJson(Map<String, dynamic> json) =
      _$ScanSessionImpl.fromJson;

  @override
  String get scanId;
  @override
  String get vehicleId;
  @override
  String get userId;
  @override
  DateTime get startedAt;
  @override
  DateTime? get completedAt;
  @override
  String get connectionType;
  @override
  String? get bluetoothDevice;
  @override
  String get protocol;
  @override
  int get scanDuration; // in seconds
  @override
  String? get firmwareVersion;
  @override
  String get appVersion;
  @override
  bool get isSynced;

  /// Create a copy of ScanSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScanSessionImplCopyWith<_$ScanSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
