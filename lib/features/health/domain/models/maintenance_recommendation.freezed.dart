// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_recommendation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MaintenanceRecommendation _$MaintenanceRecommendationFromJson(
  Map<String, dynamic> json,
) {
  return _MaintenanceRecommendation.fromJson(json);
}

/// @nodoc
mixin _$MaintenanceRecommendation {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get urgency =>
      throw _privateConstructorUsedError; // 'immediate', 'soon', 'routine', 'preventative'
  String get estimatedCost =>
      throw _privateConstructorUsedError; // e.g. "₹500 - ₹1,500"
  String get estimatedTime =>
      throw _privateConstructorUsedError; // e.g. "30 mins"
  bool get diyPossible => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  List<String> get sourceRules => throw _privateConstructorUsedError;

  /// Serializes this MaintenanceRecommendation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MaintenanceRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaintenanceRecommendationCopyWith<MaintenanceRecommendation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaintenanceRecommendationCopyWith<$Res> {
  factory $MaintenanceRecommendationCopyWith(
    MaintenanceRecommendation value,
    $Res Function(MaintenanceRecommendation) then,
  ) = _$MaintenanceRecommendationCopyWithImpl<$Res, MaintenanceRecommendation>;
  @useResult
  $Res call({
    String title,
    String description,
    String urgency,
    String estimatedCost,
    String estimatedTime,
    bool diyPossible,
    double confidence,
    List<String> sourceRules,
  });
}

/// @nodoc
class _$MaintenanceRecommendationCopyWithImpl<
  $Res,
  $Val extends MaintenanceRecommendation
>
    implements $MaintenanceRecommendationCopyWith<$Res> {
  _$MaintenanceRecommendationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaintenanceRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? urgency = null,
    Object? estimatedCost = null,
    Object? estimatedTime = null,
    Object? diyPossible = null,
    Object? confidence = null,
    Object? sourceRules = null,
  }) {
    return _then(
      _value.copyWith(
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
            urgency:
                null == urgency
                    ? _value.urgency
                    : urgency // ignore: cast_nullable_to_non_nullable
                        as String,
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
            confidence:
                null == confidence
                    ? _value.confidence
                    : confidence // ignore: cast_nullable_to_non_nullable
                        as double,
            sourceRules:
                null == sourceRules
                    ? _value.sourceRules
                    : sourceRules // ignore: cast_nullable_to_non_nullable
                        as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MaintenanceRecommendationImplCopyWith<$Res>
    implements $MaintenanceRecommendationCopyWith<$Res> {
  factory _$$MaintenanceRecommendationImplCopyWith(
    _$MaintenanceRecommendationImpl value,
    $Res Function(_$MaintenanceRecommendationImpl) then,
  ) = __$$MaintenanceRecommendationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    String description,
    String urgency,
    String estimatedCost,
    String estimatedTime,
    bool diyPossible,
    double confidence,
    List<String> sourceRules,
  });
}

/// @nodoc
class __$$MaintenanceRecommendationImplCopyWithImpl<$Res>
    extends
        _$MaintenanceRecommendationCopyWithImpl<
          $Res,
          _$MaintenanceRecommendationImpl
        >
    implements _$$MaintenanceRecommendationImplCopyWith<$Res> {
  __$$MaintenanceRecommendationImplCopyWithImpl(
    _$MaintenanceRecommendationImpl _value,
    $Res Function(_$MaintenanceRecommendationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MaintenanceRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? urgency = null,
    Object? estimatedCost = null,
    Object? estimatedTime = null,
    Object? diyPossible = null,
    Object? confidence = null,
    Object? sourceRules = null,
  }) {
    return _then(
      _$MaintenanceRecommendationImpl(
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
        urgency:
            null == urgency
                ? _value.urgency
                : urgency // ignore: cast_nullable_to_non_nullable
                    as String,
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
        confidence:
            null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                    as double,
        sourceRules:
            null == sourceRules
                ? _value._sourceRules
                : sourceRules // ignore: cast_nullable_to_non_nullable
                    as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MaintenanceRecommendationImpl implements _MaintenanceRecommendation {
  const _$MaintenanceRecommendationImpl({
    required this.title,
    required this.description,
    required this.urgency,
    required this.estimatedCost,
    required this.estimatedTime,
    this.diyPossible = true,
    this.confidence = 0.95,
    final List<String> sourceRules = const [],
  }) : _sourceRules = sourceRules;

  factory _$MaintenanceRecommendationImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaintenanceRecommendationImplFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final String urgency;
  // 'immediate', 'soon', 'routine', 'preventative'
  @override
  final String estimatedCost;
  // e.g. "₹500 - ₹1,500"
  @override
  final String estimatedTime;
  // e.g. "30 mins"
  @override
  @JsonKey()
  final bool diyPossible;
  @override
  @JsonKey()
  final double confidence;
  final List<String> _sourceRules;
  @override
  @JsonKey()
  List<String> get sourceRules {
    if (_sourceRules is EqualUnmodifiableListView) return _sourceRules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sourceRules);
  }

  @override
  String toString() {
    return 'MaintenanceRecommendation(title: $title, description: $description, urgency: $urgency, estimatedCost: $estimatedCost, estimatedTime: $estimatedTime, diyPossible: $diyPossible, confidence: $confidence, sourceRules: $sourceRules)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaintenanceRecommendationImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.urgency, urgency) || other.urgency == urgency) &&
            (identical(other.estimatedCost, estimatedCost) ||
                other.estimatedCost == estimatedCost) &&
            (identical(other.estimatedTime, estimatedTime) ||
                other.estimatedTime == estimatedTime) &&
            (identical(other.diyPossible, diyPossible) ||
                other.diyPossible == diyPossible) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            const DeepCollectionEquality().equals(
              other._sourceRules,
              _sourceRules,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    description,
    urgency,
    estimatedCost,
    estimatedTime,
    diyPossible,
    confidence,
    const DeepCollectionEquality().hash(_sourceRules),
  );

  /// Create a copy of MaintenanceRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaintenanceRecommendationImplCopyWith<_$MaintenanceRecommendationImpl>
  get copyWith => __$$MaintenanceRecommendationImplCopyWithImpl<
    _$MaintenanceRecommendationImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaintenanceRecommendationImplToJson(this);
  }
}

abstract class _MaintenanceRecommendation implements MaintenanceRecommendation {
  const factory _MaintenanceRecommendation({
    required final String title,
    required final String description,
    required final String urgency,
    required final String estimatedCost,
    required final String estimatedTime,
    final bool diyPossible,
    final double confidence,
    final List<String> sourceRules,
  }) = _$MaintenanceRecommendationImpl;

  factory _MaintenanceRecommendation.fromJson(Map<String, dynamic> json) =
      _$MaintenanceRecommendationImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  String get urgency; // 'immediate', 'soon', 'routine', 'preventative'
  @override
  String get estimatedCost; // e.g. "₹500 - ₹1,500"
  @override
  String get estimatedTime; // e.g. "30 mins"
  @override
  bool get diyPossible;
  @override
  double get confidence;
  @override
  List<String> get sourceRules;

  /// Create a copy of MaintenanceRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaintenanceRecommendationImplCopyWith<_$MaintenanceRecommendationImpl>
  get copyWith => throw _privateConstructorUsedError;
}
