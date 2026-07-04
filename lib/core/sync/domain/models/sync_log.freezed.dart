// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SyncLog _$SyncLogFromJson(Map<String, dynamic> json) {
  return _SyncLog.fromJson(json);
}

/// @nodoc
mixin _$SyncLog {
  String get logId => throw _privateConstructorUsedError;
  String get entityType => throw _privateConstructorUsedError;
  String get entityId => throw _privateConstructorUsedError;
  String get actionType =>
      throw _privateConstructorUsedError; // create, update, delete
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError; // success, failed
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Serializes this SyncLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SyncLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SyncLogCopyWith<SyncLog> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncLogCopyWith<$Res> {
  factory $SyncLogCopyWith(SyncLog value, $Res Function(SyncLog) then) =
      _$SyncLogCopyWithImpl<$Res, SyncLog>;
  @useResult
  $Res call({
    String logId,
    String entityType,
    String entityId,
    String actionType,
    DateTime timestamp,
    String status,
    String? errorMessage,
  });
}

/// @nodoc
class _$SyncLogCopyWithImpl<$Res, $Val extends SyncLog>
    implements $SyncLogCopyWith<$Res> {
  _$SyncLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SyncLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logId = null,
    Object? entityType = null,
    Object? entityId = null,
    Object? actionType = null,
    Object? timestamp = null,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            logId:
                null == logId
                    ? _value.logId
                    : logId // ignore: cast_nullable_to_non_nullable
                        as String,
            entityType:
                null == entityType
                    ? _value.entityType
                    : entityType // ignore: cast_nullable_to_non_nullable
                        as String,
            entityId:
                null == entityId
                    ? _value.entityId
                    : entityId // ignore: cast_nullable_to_non_nullable
                        as String,
            actionType:
                null == actionType
                    ? _value.actionType
                    : actionType // ignore: cast_nullable_to_non_nullable
                        as String,
            timestamp:
                null == timestamp
                    ? _value.timestamp
                    : timestamp // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String,
            errorMessage:
                freezed == errorMessage
                    ? _value.errorMessage
                    : errorMessage // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SyncLogImplCopyWith<$Res> implements $SyncLogCopyWith<$Res> {
  factory _$$SyncLogImplCopyWith(
    _$SyncLogImpl value,
    $Res Function(_$SyncLogImpl) then,
  ) = __$$SyncLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String logId,
    String entityType,
    String entityId,
    String actionType,
    DateTime timestamp,
    String status,
    String? errorMessage,
  });
}

/// @nodoc
class __$$SyncLogImplCopyWithImpl<$Res>
    extends _$SyncLogCopyWithImpl<$Res, _$SyncLogImpl>
    implements _$$SyncLogImplCopyWith<$Res> {
  __$$SyncLogImplCopyWithImpl(
    _$SyncLogImpl _value,
    $Res Function(_$SyncLogImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SyncLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logId = null,
    Object? entityType = null,
    Object? entityId = null,
    Object? actionType = null,
    Object? timestamp = null,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$SyncLogImpl(
        logId:
            null == logId
                ? _value.logId
                : logId // ignore: cast_nullable_to_non_nullable
                    as String,
        entityType:
            null == entityType
                ? _value.entityType
                : entityType // ignore: cast_nullable_to_non_nullable
                    as String,
        entityId:
            null == entityId
                ? _value.entityId
                : entityId // ignore: cast_nullable_to_non_nullable
                    as String,
        actionType:
            null == actionType
                ? _value.actionType
                : actionType // ignore: cast_nullable_to_non_nullable
                    as String,
        timestamp:
            null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String,
        errorMessage:
            freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SyncLogImpl implements _SyncLog {
  const _$SyncLogImpl({
    required this.logId,
    required this.entityType,
    required this.entityId,
    required this.actionType,
    required this.timestamp,
    required this.status,
    this.errorMessage,
  });

  factory _$SyncLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncLogImplFromJson(json);

  @override
  final String logId;
  @override
  final String entityType;
  @override
  final String entityId;
  @override
  final String actionType;
  // create, update, delete
  @override
  final DateTime timestamp;
  @override
  final String status;
  // success, failed
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'SyncLog(logId: $logId, entityType: $entityType, entityId: $entityId, actionType: $actionType, timestamp: $timestamp, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncLogImpl &&
            (identical(other.logId, logId) || other.logId == logId) &&
            (identical(other.entityType, entityType) ||
                other.entityType == entityType) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.actionType, actionType) ||
                other.actionType == actionType) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    logId,
    entityType,
    entityId,
    actionType,
    timestamp,
    status,
    errorMessage,
  );

  /// Create a copy of SyncLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncLogImplCopyWith<_$SyncLogImpl> get copyWith =>
      __$$SyncLogImplCopyWithImpl<_$SyncLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncLogImplToJson(this);
  }
}

abstract class _SyncLog implements SyncLog {
  const factory _SyncLog({
    required final String logId,
    required final String entityType,
    required final String entityId,
    required final String actionType,
    required final DateTime timestamp,
    required final String status,
    final String? errorMessage,
  }) = _$SyncLogImpl;

  factory _SyncLog.fromJson(Map<String, dynamic> json) = _$SyncLogImpl.fromJson;

  @override
  String get logId;
  @override
  String get entityType;
  @override
  String get entityId;
  @override
  String get actionType; // create, update, delete
  @override
  DateTime get timestamp;
  @override
  String get status; // success, failed
  @override
  String? get errorMessage;

  /// Create a copy of SyncLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncLogImplCopyWith<_$SyncLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ConflictLog _$ConflictLogFromJson(Map<String, dynamic> json) {
  return _ConflictLog.fromJson(json);
}

/// @nodoc
mixin _$ConflictLog {
  String get conflictId => throw _privateConstructorUsedError;
  String get entityType => throw _privateConstructorUsedError;
  String get entityId => throw _privateConstructorUsedError;
  Map<String, dynamic> get localVersion => throw _privateConstructorUsedError;
  Map<String, dynamic> get cloudVersion => throw _privateConstructorUsedError;
  Map<String, dynamic> get resolvedVersion =>
      throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get resolutionStrategy => throw _privateConstructorUsedError;

  /// Serializes this ConflictLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConflictLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConflictLogCopyWith<ConflictLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConflictLogCopyWith<$Res> {
  factory $ConflictLogCopyWith(
    ConflictLog value,
    $Res Function(ConflictLog) then,
  ) = _$ConflictLogCopyWithImpl<$Res, ConflictLog>;
  @useResult
  $Res call({
    String conflictId,
    String entityType,
    String entityId,
    Map<String, dynamic> localVersion,
    Map<String, dynamic> cloudVersion,
    Map<String, dynamic> resolvedVersion,
    DateTime timestamp,
    String resolutionStrategy,
  });
}

/// @nodoc
class _$ConflictLogCopyWithImpl<$Res, $Val extends ConflictLog>
    implements $ConflictLogCopyWith<$Res> {
  _$ConflictLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConflictLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conflictId = null,
    Object? entityType = null,
    Object? entityId = null,
    Object? localVersion = null,
    Object? cloudVersion = null,
    Object? resolvedVersion = null,
    Object? timestamp = null,
    Object? resolutionStrategy = null,
  }) {
    return _then(
      _value.copyWith(
            conflictId:
                null == conflictId
                    ? _value.conflictId
                    : conflictId // ignore: cast_nullable_to_non_nullable
                        as String,
            entityType:
                null == entityType
                    ? _value.entityType
                    : entityType // ignore: cast_nullable_to_non_nullable
                        as String,
            entityId:
                null == entityId
                    ? _value.entityId
                    : entityId // ignore: cast_nullable_to_non_nullable
                        as String,
            localVersion:
                null == localVersion
                    ? _value.localVersion
                    : localVersion // ignore: cast_nullable_to_non_nullable
                        as Map<String, dynamic>,
            cloudVersion:
                null == cloudVersion
                    ? _value.cloudVersion
                    : cloudVersion // ignore: cast_nullable_to_non_nullable
                        as Map<String, dynamic>,
            resolvedVersion:
                null == resolvedVersion
                    ? _value.resolvedVersion
                    : resolvedVersion // ignore: cast_nullable_to_non_nullable
                        as Map<String, dynamic>,
            timestamp:
                null == timestamp
                    ? _value.timestamp
                    : timestamp // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            resolutionStrategy:
                null == resolutionStrategy
                    ? _value.resolutionStrategy
                    : resolutionStrategy // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ConflictLogImplCopyWith<$Res>
    implements $ConflictLogCopyWith<$Res> {
  factory _$$ConflictLogImplCopyWith(
    _$ConflictLogImpl value,
    $Res Function(_$ConflictLogImpl) then,
  ) = __$$ConflictLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String conflictId,
    String entityType,
    String entityId,
    Map<String, dynamic> localVersion,
    Map<String, dynamic> cloudVersion,
    Map<String, dynamic> resolvedVersion,
    DateTime timestamp,
    String resolutionStrategy,
  });
}

/// @nodoc
class __$$ConflictLogImplCopyWithImpl<$Res>
    extends _$ConflictLogCopyWithImpl<$Res, _$ConflictLogImpl>
    implements _$$ConflictLogImplCopyWith<$Res> {
  __$$ConflictLogImplCopyWithImpl(
    _$ConflictLogImpl _value,
    $Res Function(_$ConflictLogImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConflictLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conflictId = null,
    Object? entityType = null,
    Object? entityId = null,
    Object? localVersion = null,
    Object? cloudVersion = null,
    Object? resolvedVersion = null,
    Object? timestamp = null,
    Object? resolutionStrategy = null,
  }) {
    return _then(
      _$ConflictLogImpl(
        conflictId:
            null == conflictId
                ? _value.conflictId
                : conflictId // ignore: cast_nullable_to_non_nullable
                    as String,
        entityType:
            null == entityType
                ? _value.entityType
                : entityType // ignore: cast_nullable_to_non_nullable
                    as String,
        entityId:
            null == entityId
                ? _value.entityId
                : entityId // ignore: cast_nullable_to_non_nullable
                    as String,
        localVersion:
            null == localVersion
                ? _value._localVersion
                : localVersion // ignore: cast_nullable_to_non_nullable
                    as Map<String, dynamic>,
        cloudVersion:
            null == cloudVersion
                ? _value._cloudVersion
                : cloudVersion // ignore: cast_nullable_to_non_nullable
                    as Map<String, dynamic>,
        resolvedVersion:
            null == resolvedVersion
                ? _value._resolvedVersion
                : resolvedVersion // ignore: cast_nullable_to_non_nullable
                    as Map<String, dynamic>,
        timestamp:
            null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        resolutionStrategy:
            null == resolutionStrategy
                ? _value.resolutionStrategy
                : resolutionStrategy // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConflictLogImpl implements _ConflictLog {
  const _$ConflictLogImpl({
    required this.conflictId,
    required this.entityType,
    required this.entityId,
    required final Map<String, dynamic> localVersion,
    required final Map<String, dynamic> cloudVersion,
    required final Map<String, dynamic> resolvedVersion,
    required this.timestamp,
    required this.resolutionStrategy,
  }) : _localVersion = localVersion,
       _cloudVersion = cloudVersion,
       _resolvedVersion = resolvedVersion;

  factory _$ConflictLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConflictLogImplFromJson(json);

  @override
  final String conflictId;
  @override
  final String entityType;
  @override
  final String entityId;
  final Map<String, dynamic> _localVersion;
  @override
  Map<String, dynamic> get localVersion {
    if (_localVersion is EqualUnmodifiableMapView) return _localVersion;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_localVersion);
  }

  final Map<String, dynamic> _cloudVersion;
  @override
  Map<String, dynamic> get cloudVersion {
    if (_cloudVersion is EqualUnmodifiableMapView) return _cloudVersion;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_cloudVersion);
  }

  final Map<String, dynamic> _resolvedVersion;
  @override
  Map<String, dynamic> get resolvedVersion {
    if (_resolvedVersion is EqualUnmodifiableMapView) return _resolvedVersion;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_resolvedVersion);
  }

  @override
  final DateTime timestamp;
  @override
  final String resolutionStrategy;

  @override
  String toString() {
    return 'ConflictLog(conflictId: $conflictId, entityType: $entityType, entityId: $entityId, localVersion: $localVersion, cloudVersion: $cloudVersion, resolvedVersion: $resolvedVersion, timestamp: $timestamp, resolutionStrategy: $resolutionStrategy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConflictLogImpl &&
            (identical(other.conflictId, conflictId) ||
                other.conflictId == conflictId) &&
            (identical(other.entityType, entityType) ||
                other.entityType == entityType) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            const DeepCollectionEquality().equals(
              other._localVersion,
              _localVersion,
            ) &&
            const DeepCollectionEquality().equals(
              other._cloudVersion,
              _cloudVersion,
            ) &&
            const DeepCollectionEquality().equals(
              other._resolvedVersion,
              _resolvedVersion,
            ) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.resolutionStrategy, resolutionStrategy) ||
                other.resolutionStrategy == resolutionStrategy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    conflictId,
    entityType,
    entityId,
    const DeepCollectionEquality().hash(_localVersion),
    const DeepCollectionEquality().hash(_cloudVersion),
    const DeepCollectionEquality().hash(_resolvedVersion),
    timestamp,
    resolutionStrategy,
  );

  /// Create a copy of ConflictLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConflictLogImplCopyWith<_$ConflictLogImpl> get copyWith =>
      __$$ConflictLogImplCopyWithImpl<_$ConflictLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConflictLogImplToJson(this);
  }
}

abstract class _ConflictLog implements ConflictLog {
  const factory _ConflictLog({
    required final String conflictId,
    required final String entityType,
    required final String entityId,
    required final Map<String, dynamic> localVersion,
    required final Map<String, dynamic> cloudVersion,
    required final Map<String, dynamic> resolvedVersion,
    required final DateTime timestamp,
    required final String resolutionStrategy,
  }) = _$ConflictLogImpl;

  factory _ConflictLog.fromJson(Map<String, dynamic> json) =
      _$ConflictLogImpl.fromJson;

  @override
  String get conflictId;
  @override
  String get entityType;
  @override
  String get entityId;
  @override
  Map<String, dynamic> get localVersion;
  @override
  Map<String, dynamic> get cloudVersion;
  @override
  Map<String, dynamic> get resolvedVersion;
  @override
  DateTime get timestamp;
  @override
  String get resolutionStrategy;

  /// Create a copy of ConflictLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConflictLogImplCopyWith<_$ConflictLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
