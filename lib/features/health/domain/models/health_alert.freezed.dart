// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_alert.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

HealthAlert _$HealthAlertFromJson(Map<String, dynamic> json) {
  return _HealthAlert.fromJson(json);
}

/// @nodoc
mixin _$HealthAlert {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get severity =>
      throw _privateConstructorUsedError; // 'low', 'medium', 'high', 'critical'
  int get priority => throw _privateConstructorUsedError; // 1 (highest) to 5
  String get category =>
      throw _privateConstructorUsedError; // 'engine', 'battery', 'cooling', 'fuel', 'emissions', 'transmission', 'electrical'
  String get source =>
      throw _privateConstructorUsedError; // 'sensor', 'dtc', 'rule_engine'
  String get recommendation => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  List<String> get affectedSystems => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this HealthAlert to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HealthAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HealthAlertCopyWith<HealthAlert> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthAlertCopyWith<$Res> {
  factory $HealthAlertCopyWith(
    HealthAlert value,
    $Res Function(HealthAlert) then,
  ) = _$HealthAlertCopyWithImpl<$Res, HealthAlert>;
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    String severity,
    int priority,
    String category,
    String source,
    String recommendation,
    double confidence,
    List<String> affectedSystems,
    DateTime createdAt,
  });
}

/// @nodoc
class _$HealthAlertCopyWithImpl<$Res, $Val extends HealthAlert>
    implements $HealthAlertCopyWith<$Res> {
  _$HealthAlertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HealthAlert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? severity = null,
    Object? priority = null,
    Object? category = null,
    Object? source = null,
    Object? recommendation = null,
    Object? confidence = null,
    Object? affectedSystems = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
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
            severity:
                null == severity
                    ? _value.severity
                    : severity // ignore: cast_nullable_to_non_nullable
                        as String,
            priority:
                null == priority
                    ? _value.priority
                    : priority // ignore: cast_nullable_to_non_nullable
                        as int,
            category:
                null == category
                    ? _value.category
                    : category // ignore: cast_nullable_to_non_nullable
                        as String,
            source:
                null == source
                    ? _value.source
                    : source // ignore: cast_nullable_to_non_nullable
                        as String,
            recommendation:
                null == recommendation
                    ? _value.recommendation
                    : recommendation // ignore: cast_nullable_to_non_nullable
                        as String,
            confidence:
                null == confidence
                    ? _value.confidence
                    : confidence // ignore: cast_nullable_to_non_nullable
                        as double,
            affectedSystems:
                null == affectedSystems
                    ? _value.affectedSystems
                    : affectedSystems // ignore: cast_nullable_to_non_nullable
                        as List<String>,
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
abstract class _$$HealthAlertImplCopyWith<$Res>
    implements $HealthAlertCopyWith<$Res> {
  factory _$$HealthAlertImplCopyWith(
    _$HealthAlertImpl value,
    $Res Function(_$HealthAlertImpl) then,
  ) = __$$HealthAlertImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    String severity,
    int priority,
    String category,
    String source,
    String recommendation,
    double confidence,
    List<String> affectedSystems,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$HealthAlertImplCopyWithImpl<$Res>
    extends _$HealthAlertCopyWithImpl<$Res, _$HealthAlertImpl>
    implements _$$HealthAlertImplCopyWith<$Res> {
  __$$HealthAlertImplCopyWithImpl(
    _$HealthAlertImpl _value,
    $Res Function(_$HealthAlertImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HealthAlert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? severity = null,
    Object? priority = null,
    Object? category = null,
    Object? source = null,
    Object? recommendation = null,
    Object? confidence = null,
    Object? affectedSystems = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$HealthAlertImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
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
        severity:
            null == severity
                ? _value.severity
                : severity // ignore: cast_nullable_to_non_nullable
                    as String,
        priority:
            null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                    as int,
        category:
            null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                    as String,
        source:
            null == source
                ? _value.source
                : source // ignore: cast_nullable_to_non_nullable
                    as String,
        recommendation:
            null == recommendation
                ? _value.recommendation
                : recommendation // ignore: cast_nullable_to_non_nullable
                    as String,
        confidence:
            null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                    as double,
        affectedSystems:
            null == affectedSystems
                ? _value._affectedSystems
                : affectedSystems // ignore: cast_nullable_to_non_nullable
                    as List<String>,
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
class _$HealthAlertImpl implements _HealthAlert {
  const _$HealthAlertImpl({
    required this.id,
    required this.title,
    required this.description,
    required this.severity,
    this.priority = 1,
    required this.category,
    required this.source,
    required this.recommendation,
    this.confidence = 0.9,
    final List<String> affectedSystems = const [],
    required this.createdAt,
  }) : _affectedSystems = affectedSystems;

  factory _$HealthAlertImpl.fromJson(Map<String, dynamic> json) =>
      _$$HealthAlertImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String severity;
  // 'low', 'medium', 'high', 'critical'
  @override
  @JsonKey()
  final int priority;
  // 1 (highest) to 5
  @override
  final String category;
  // 'engine', 'battery', 'cooling', 'fuel', 'emissions', 'transmission', 'electrical'
  @override
  final String source;
  // 'sensor', 'dtc', 'rule_engine'
  @override
  final String recommendation;
  @override
  @JsonKey()
  final double confidence;
  final List<String> _affectedSystems;
  @override
  @JsonKey()
  List<String> get affectedSystems {
    if (_affectedSystems is EqualUnmodifiableListView) return _affectedSystems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_affectedSystems);
  }

  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'HealthAlert(id: $id, title: $title, description: $description, severity: $severity, priority: $priority, category: $category, source: $source, recommendation: $recommendation, confidence: $confidence, affectedSystems: $affectedSystems, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthAlertImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.recommendation, recommendation) ||
                other.recommendation == recommendation) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            const DeepCollectionEquality().equals(
              other._affectedSystems,
              _affectedSystems,
            ) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    description,
    severity,
    priority,
    category,
    source,
    recommendation,
    confidence,
    const DeepCollectionEquality().hash(_affectedSystems),
    createdAt,
  );

  /// Create a copy of HealthAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthAlertImplCopyWith<_$HealthAlertImpl> get copyWith =>
      __$$HealthAlertImplCopyWithImpl<_$HealthAlertImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HealthAlertImplToJson(this);
  }
}

abstract class _HealthAlert implements HealthAlert {
  const factory _HealthAlert({
    required final String id,
    required final String title,
    required final String description,
    required final String severity,
    final int priority,
    required final String category,
    required final String source,
    required final String recommendation,
    final double confidence,
    final List<String> affectedSystems,
    required final DateTime createdAt,
  }) = _$HealthAlertImpl;

  factory _HealthAlert.fromJson(Map<String, dynamic> json) =
      _$HealthAlertImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get severity; // 'low', 'medium', 'high', 'critical'
  @override
  int get priority; // 1 (highest) to 5
  @override
  String get category; // 'engine', 'battery', 'cooling', 'fuel', 'emissions', 'transmission', 'electrical'
  @override
  String get source; // 'sensor', 'dtc', 'rule_engine'
  @override
  String get recommendation;
  @override
  double get confidence;
  @override
  List<String> get affectedSystems;
  @override
  DateTime get createdAt;

  /// Create a copy of HealthAlert
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthAlertImplCopyWith<_$HealthAlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
