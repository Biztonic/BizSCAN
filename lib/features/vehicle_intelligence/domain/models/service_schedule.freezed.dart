// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ServiceSchedule _$ServiceScheduleFromJson(Map<String, dynamic> json) {
  return _ServiceSchedule.fromJson(json);
}

/// @nodoc
mixin _$ServiceSchedule {
  String get serviceId => throw _privateConstructorUsedError;
  int get intervalKm => throw _privateConstructorUsedError;
  int get intervalMonths => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get priority => throw _privateConstructorUsedError; // 1 (highest) to 5
  String get estimatedCost => throw _privateConstructorUsedError;
  String get estimatedTime => throw _privateConstructorUsedError;
  bool get diyPossible => throw _privateConstructorUsedError;

  /// Serializes this ServiceSchedule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServiceSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceScheduleCopyWith<ServiceSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceScheduleCopyWith<$Res> {
  factory $ServiceScheduleCopyWith(
    ServiceSchedule value,
    $Res Function(ServiceSchedule) then,
  ) = _$ServiceScheduleCopyWithImpl<$Res, ServiceSchedule>;
  @useResult
  $Res call({
    String serviceId,
    int intervalKm,
    int intervalMonths,
    String title,
    String description,
    int priority,
    String estimatedCost,
    String estimatedTime,
    bool diyPossible,
  });
}

/// @nodoc
class _$ServiceScheduleCopyWithImpl<$Res, $Val extends ServiceSchedule>
    implements $ServiceScheduleCopyWith<$Res> {
  _$ServiceScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
    Object? intervalKm = null,
    Object? intervalMonths = null,
    Object? title = null,
    Object? description = null,
    Object? priority = null,
    Object? estimatedCost = null,
    Object? estimatedTime = null,
    Object? diyPossible = null,
  }) {
    return _then(
      _value.copyWith(
            serviceId:
                null == serviceId
                    ? _value.serviceId
                    : serviceId // ignore: cast_nullable_to_non_nullable
                        as String,
            intervalKm:
                null == intervalKm
                    ? _value.intervalKm
                    : intervalKm // ignore: cast_nullable_to_non_nullable
                        as int,
            intervalMonths:
                null == intervalMonths
                    ? _value.intervalMonths
                    : intervalMonths // ignore: cast_nullable_to_non_nullable
                        as int,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            priority:
                null == priority
                    ? _value.priority
                    : priority // ignore: cast_nullable_to_non_nullable
                        as int,
            estimatedCost:
                null == estimatedCost
                    ? _value.estimatedCost
                    : estimatedCost // ignore: cast_nullable_to_non_nullable
                        as String,
            estimatedTime:
                null == estimatedTime
                    ? _value.estimatedTime
                    : estimatedTime // ignore: cast_nullable_to_non_nullable
                        as String,
            diyPossible:
                null == diyPossible
                    ? _value.diyPossible
                    : diyPossible // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ServiceScheduleImplCopyWith<$Res>
    implements $ServiceScheduleCopyWith<$Res> {
  factory _$$ServiceScheduleImplCopyWith(
    _$ServiceScheduleImpl value,
    $Res Function(_$ServiceScheduleImpl) then,
  ) = __$$ServiceScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String serviceId,
    int intervalKm,
    int intervalMonths,
    String title,
    String description,
    int priority,
    String estimatedCost,
    String estimatedTime,
    bool diyPossible,
  });
}

/// @nodoc
class __$$ServiceScheduleImplCopyWithImpl<$Res>
    extends _$ServiceScheduleCopyWithImpl<$Res, _$ServiceScheduleImpl>
    implements _$$ServiceScheduleImplCopyWith<$Res> {
  __$$ServiceScheduleImplCopyWithImpl(
    _$ServiceScheduleImpl _value,
    $Res Function(_$ServiceScheduleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ServiceSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
    Object? intervalKm = null,
    Object? intervalMonths = null,
    Object? title = null,
    Object? description = null,
    Object? priority = null,
    Object? estimatedCost = null,
    Object? estimatedTime = null,
    Object? diyPossible = null,
  }) {
    return _then(
      _$ServiceScheduleImpl(
        serviceId:
            null == serviceId
                ? _value.serviceId
                : serviceId // ignore: cast_nullable_to_non_nullable
                    as String,
        intervalKm:
            null == intervalKm
                ? _value.intervalKm
                : intervalKm // ignore: cast_nullable_to_non_nullable
                    as int,
        intervalMonths:
            null == intervalMonths
                ? _value.intervalMonths
                : intervalMonths // ignore: cast_nullable_to_non_nullable
                    as int,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        priority:
            null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                    as int,
        estimatedCost:
            null == estimatedCost
                ? _value.estimatedCost
                : estimatedCost // ignore: cast_nullable_to_non_nullable
                    as String,
        estimatedTime:
            null == estimatedTime
                ? _value.estimatedTime
                : estimatedTime // ignore: cast_nullable_to_non_nullable
                    as String,
        diyPossible:
            null == diyPossible
                ? _value.diyPossible
                : diyPossible // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceScheduleImpl implements _ServiceSchedule {
  const _$ServiceScheduleImpl({
    required this.serviceId,
    required this.intervalKm,
    required this.intervalMonths,
    required this.title,
    required this.description,
    this.priority = 2,
    this.estimatedCost = '₹2,000 - ₹4,500',
    this.estimatedTime = '45 mins',
    this.diyPossible = true,
  });

  factory _$ServiceScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceScheduleImplFromJson(json);

  @override
  final String serviceId;
  @override
  final int intervalKm;
  @override
  final int intervalMonths;
  @override
  final String title;
  @override
  final String description;
  @override
  @JsonKey()
  final int priority;
  // 1 (highest) to 5
  @override
  @JsonKey()
  final String estimatedCost;
  @override
  @JsonKey()
  final String estimatedTime;
  @override
  @JsonKey()
  final bool diyPossible;

  @override
  String toString() {
    return 'ServiceSchedule(serviceId: $serviceId, intervalKm: $intervalKm, intervalMonths: $intervalMonths, title: $title, description: $description, priority: $priority, estimatedCost: $estimatedCost, estimatedTime: $estimatedTime, diyPossible: $diyPossible)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceScheduleImpl &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.intervalKm, intervalKm) ||
                other.intervalKm == intervalKm) &&
            (identical(other.intervalMonths, intervalMonths) ||
                other.intervalMonths == intervalMonths) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.estimatedCost, estimatedCost) ||
                other.estimatedCost == estimatedCost) &&
            (identical(other.estimatedTime, estimatedTime) ||
                other.estimatedTime == estimatedTime) &&
            (identical(other.diyPossible, diyPossible) ||
                other.diyPossible == diyPossible));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    serviceId,
    intervalKm,
    intervalMonths,
    title,
    description,
    priority,
    estimatedCost,
    estimatedTime,
    diyPossible,
  );

  /// Create a copy of ServiceSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceScheduleImplCopyWith<_$ServiceScheduleImpl> get copyWith =>
      __$$ServiceScheduleImplCopyWithImpl<_$ServiceScheduleImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceScheduleImplToJson(this);
  }
}

abstract class _ServiceSchedule implements ServiceSchedule {
  const factory _ServiceSchedule({
    required final String serviceId,
    required final int intervalKm,
    required final int intervalMonths,
    required final String title,
    required final String description,
    final int priority,
    final String estimatedCost,
    final String estimatedTime,
    final bool diyPossible,
  }) = _$ServiceScheduleImpl;

  factory _ServiceSchedule.fromJson(Map<String, dynamic> json) =
      _$ServiceScheduleImpl.fromJson;

  @override
  String get serviceId;
  @override
  int get intervalKm;
  @override
  int get intervalMonths;
  @override
  String get title;
  @override
  String get description;
  @override
  int get priority; // 1 (highest) to 5
  @override
  String get estimatedCost;
  @override
  String get estimatedTime;
  @override
  bool get diyPossible;

  /// Create a copy of ServiceSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceScheduleImplCopyWith<_$ServiceScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
