// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_reminder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ServiceReminder _$ServiceReminderFromJson(Map<String, dynamic> json) {
  return _ServiceReminder.fromJson(json);
}

/// @nodoc
mixin _$ServiceReminder {
  String get reminderId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime get dueDate => throw _privateConstructorUsedError;
  int get dueKm => throw _privateConstructorUsedError;
  String get urgency =>
      throw _privateConstructorUsedError; // 'overdue', 'immediate', 'soon', 'routine'
  bool get completed => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ServiceReminder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServiceReminder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceReminderCopyWith<ServiceReminder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceReminderCopyWith<$Res> {
  factory $ServiceReminderCopyWith(
    ServiceReminder value,
    $Res Function(ServiceReminder) then,
  ) = _$ServiceReminderCopyWithImpl<$Res, ServiceReminder>;
  @useResult
  $Res call({
    String reminderId,
    String title,
    DateTime dueDate,
    int dueKm,
    String urgency,
    bool completed,
    DateTime createdAt,
  });
}

/// @nodoc
class _$ServiceReminderCopyWithImpl<$Res, $Val extends ServiceReminder>
    implements $ServiceReminderCopyWith<$Res> {
  _$ServiceReminderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceReminder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reminderId = null,
    Object? title = null,
    Object? dueDate = null,
    Object? dueKm = null,
    Object? urgency = null,
    Object? completed = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            reminderId:
                null == reminderId
                    ? _value.reminderId
                    : reminderId // ignore: cast_nullable_to_non_nullable
                        as String,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            dueDate:
                null == dueDate
                    ? _value.dueDate
                    : dueDate // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            dueKm:
                null == dueKm
                    ? _value.dueKm
                    : dueKm // ignore: cast_nullable_to_non_nullable
                        as int,
            urgency:
                null == urgency
                    ? _value.urgency
                    : urgency // ignore: cast_nullable_to_non_nullable
                        as String,
            completed:
                null == completed
                    ? _value.completed
                    : completed // ignore: cast_nullable_to_non_nullable
                        as bool,
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
abstract class _$$ServiceReminderImplCopyWith<$Res>
    implements $ServiceReminderCopyWith<$Res> {
  factory _$$ServiceReminderImplCopyWith(
    _$ServiceReminderImpl value,
    $Res Function(_$ServiceReminderImpl) then,
  ) = __$$ServiceReminderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String reminderId,
    String title,
    DateTime dueDate,
    int dueKm,
    String urgency,
    bool completed,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$ServiceReminderImplCopyWithImpl<$Res>
    extends _$ServiceReminderCopyWithImpl<$Res, _$ServiceReminderImpl>
    implements _$$ServiceReminderImplCopyWith<$Res> {
  __$$ServiceReminderImplCopyWithImpl(
    _$ServiceReminderImpl _value,
    $Res Function(_$ServiceReminderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ServiceReminder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reminderId = null,
    Object? title = null,
    Object? dueDate = null,
    Object? dueKm = null,
    Object? urgency = null,
    Object? completed = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$ServiceReminderImpl(
        reminderId:
            null == reminderId
                ? _value.reminderId
                : reminderId // ignore: cast_nullable_to_non_nullable
                    as String,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        dueDate:
            null == dueDate
                ? _value.dueDate
                : dueDate // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        dueKm:
            null == dueKm
                ? _value.dueKm
                : dueKm // ignore: cast_nullable_to_non_nullable
                    as int,
        urgency:
            null == urgency
                ? _value.urgency
                : urgency // ignore: cast_nullable_to_non_nullable
                    as String,
        completed:
            null == completed
                ? _value.completed
                : completed // ignore: cast_nullable_to_non_nullable
                    as bool,
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
class _$ServiceReminderImpl implements _ServiceReminder {
  const _$ServiceReminderImpl({
    required this.reminderId,
    required this.title,
    required this.dueDate,
    required this.dueKm,
    this.urgency = 'routine',
    this.completed = false,
    required this.createdAt,
  });

  factory _$ServiceReminderImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceReminderImplFromJson(json);

  @override
  final String reminderId;
  @override
  final String title;
  @override
  final DateTime dueDate;
  @override
  final int dueKm;
  @override
  @JsonKey()
  final String urgency;
  // 'overdue', 'immediate', 'soon', 'routine'
  @override
  @JsonKey()
  final bool completed;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'ServiceReminder(reminderId: $reminderId, title: $title, dueDate: $dueDate, dueKm: $dueKm, urgency: $urgency, completed: $completed, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceReminderImpl &&
            (identical(other.reminderId, reminderId) ||
                other.reminderId == reminderId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.dueKm, dueKm) || other.dueKm == dueKm) &&
            (identical(other.urgency, urgency) || other.urgency == urgency) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    reminderId,
    title,
    dueDate,
    dueKm,
    urgency,
    completed,
    createdAt,
  );

  /// Create a copy of ServiceReminder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceReminderImplCopyWith<_$ServiceReminderImpl> get copyWith =>
      __$$ServiceReminderImplCopyWithImpl<_$ServiceReminderImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceReminderImplToJson(this);
  }
}

abstract class _ServiceReminder implements ServiceReminder {
  const factory _ServiceReminder({
    required final String reminderId,
    required final String title,
    required final DateTime dueDate,
    required final int dueKm,
    final String urgency,
    final bool completed,
    required final DateTime createdAt,
  }) = _$ServiceReminderImpl;

  factory _ServiceReminder.fromJson(Map<String, dynamic> json) =
      _$ServiceReminderImpl.fromJson;

  @override
  String get reminderId;
  @override
  String get title;
  @override
  DateTime get dueDate;
  @override
  int get dueKm;
  @override
  String get urgency; // 'overdue', 'immediate', 'soon', 'routine'
  @override
  bool get completed;
  @override
  DateTime get createdAt;

  /// Create a copy of ServiceReminder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceReminderImplCopyWith<_$ServiceReminderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
