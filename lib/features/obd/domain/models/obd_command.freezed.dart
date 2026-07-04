// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'obd_command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ObdCommand _$ObdCommandFromJson(Map<String, dynamic> json) {
  return _ObdCommand.fromJson(json);
}

/// @nodoc
mixin _$ObdCommand {
  String get command => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // e.g. "AT", "PID", "DTC"
  int get priority =>
      throw _privateConstructorUsedError; // 1 = high, 2 = normal, 3 = low
  int get timeout => throw _privateConstructorUsedError; // timeout in ms
  int get retryCount => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ObdCommand to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ObdCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ObdCommandCopyWith<ObdCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ObdCommandCopyWith<$Res> {
  factory $ObdCommandCopyWith(
    ObdCommand value,
    $Res Function(ObdCommand) then,
  ) = _$ObdCommandCopyWithImpl<$Res, ObdCommand>;
  @useResult
  $Res call({
    String command,
    String type,
    int priority,
    int timeout,
    int retryCount,
    DateTime createdAt,
  });
}

/// @nodoc
class _$ObdCommandCopyWithImpl<$Res, $Val extends ObdCommand>
    implements $ObdCommandCopyWith<$Res> {
  _$ObdCommandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ObdCommand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? command = null,
    Object? type = null,
    Object? priority = null,
    Object? timeout = null,
    Object? retryCount = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            command:
                null == command
                    ? _value.command
                    : command // ignore: cast_nullable_to_non_nullable
                        as String,
            type:
                null == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as String,
            priority:
                null == priority
                    ? _value.priority
                    : priority // ignore: cast_nullable_to_non_nullable
                        as int,
            timeout:
                null == timeout
                    ? _value.timeout
                    : timeout // ignore: cast_nullable_to_non_nullable
                        as int,
            retryCount:
                null == retryCount
                    ? _value.retryCount
                    : retryCount // ignore: cast_nullable_to_non_nullable
                        as int,
            createdAt:
                null == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ObdCommandImplCopyWith<$Res>
    implements $ObdCommandCopyWith<$Res> {
  factory _$$ObdCommandImplCopyWith(
    _$ObdCommandImpl value,
    $Res Function(_$ObdCommandImpl) then,
  ) = __$$ObdCommandImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String command,
    String type,
    int priority,
    int timeout,
    int retryCount,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$ObdCommandImplCopyWithImpl<$Res>
    extends _$ObdCommandCopyWithImpl<$Res, _$ObdCommandImpl>
    implements _$$ObdCommandImplCopyWith<$Res> {
  __$$ObdCommandImplCopyWithImpl(
    _$ObdCommandImpl _value,
    $Res Function(_$ObdCommandImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ObdCommand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? command = null,
    Object? type = null,
    Object? priority = null,
    Object? timeout = null,
    Object? retryCount = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$ObdCommandImpl(
        command:
            null == command
                ? _value.command
                : command // ignore: cast_nullable_to_non_nullable
                    as String,
        type:
            null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as String,
        priority:
            null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                    as int,
        timeout:
            null == timeout
                ? _value.timeout
                : timeout // ignore: cast_nullable_to_non_nullable
                    as int,
        retryCount:
            null == retryCount
                ? _value.retryCount
                : retryCount // ignore: cast_nullable_to_non_nullable
                    as int,
        createdAt:
            null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ObdCommandImpl implements _ObdCommand {
  const _$ObdCommandImpl({
    required this.command,
    required this.type,
    this.priority = 2,
    this.timeout = 3000,
    this.retryCount = 3,
    required this.createdAt,
  });

  factory _$ObdCommandImpl.fromJson(Map<String, dynamic> json) =>
      _$$ObdCommandImplFromJson(json);

  @override
  final String command;
  @override
  final String type;
  // e.g. "AT", "PID", "DTC"
  @override
  @JsonKey()
  final int priority;
  // 1 = high, 2 = normal, 3 = low
  @override
  @JsonKey()
  final int timeout;
  // timeout in ms
  @override
  @JsonKey()
  final int retryCount;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'ObdCommand(command: $command, type: $type, priority: $priority, timeout: $timeout, retryCount: $retryCount, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ObdCommandImpl &&
            (identical(other.command, command) || other.command == command) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.timeout, timeout) || other.timeout == timeout) &&
            (identical(other.retryCount, retryCount) ||
                other.retryCount == retryCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    command,
    type,
    priority,
    timeout,
    retryCount,
    createdAt,
  );

  /// Create a copy of ObdCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ObdCommandImplCopyWith<_$ObdCommandImpl> get copyWith =>
      __$$ObdCommandImplCopyWithImpl<_$ObdCommandImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ObdCommandImplToJson(this);
  }
}

abstract class _ObdCommand implements ObdCommand {
  const factory _ObdCommand({
    required final String command,
    required final String type,
    final int priority,
    final int timeout,
    final int retryCount,
    required final DateTime createdAt,
  }) = _$ObdCommandImpl;

  factory _ObdCommand.fromJson(Map<String, dynamic> json) =
      _$ObdCommandImpl.fromJson;

  @override
  String get command;
  @override
  String get type; // e.g. "AT", "PID", "DTC"
  @override
  int get priority; // 1 = high, 2 = normal, 3 = low
  @override
  int get timeout; // timeout in ms
  @override
  int get retryCount;
  @override
  DateTime get createdAt;

  /// Create a copy of ObdCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ObdCommandImplCopyWith<_$ObdCommandImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
