// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_section.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ReportSection _$ReportSectionFromJson(Map<String, dynamic> json) {
  return _ReportSection.fromJson(json);
}

/// @nodoc
mixin _$ReportSection {
  String get sectionId => throw _privateConstructorUsedError;
  ReportSectionType get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;
  int get sortOrder => throw _privateConstructorUsedError;
  String get contentJson => throw _privateConstructorUsedError;

  /// Serializes this ReportSection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReportSection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportSectionCopyWith<ReportSection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportSectionCopyWith<$Res> {
  factory $ReportSectionCopyWith(
    ReportSection value,
    $Res Function(ReportSection) then,
  ) = _$ReportSectionCopyWithImpl<$Res, ReportSection>;
  @useResult
  $Res call({
    String sectionId,
    ReportSectionType type,
    String title,
    bool enabled,
    int sortOrder,
    String contentJson,
  });
}

/// @nodoc
class _$ReportSectionCopyWithImpl<$Res, $Val extends ReportSection>
    implements $ReportSectionCopyWith<$Res> {
  _$ReportSectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportSection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sectionId = null,
    Object? type = null,
    Object? title = null,
    Object? enabled = null,
    Object? sortOrder = null,
    Object? contentJson = null,
  }) {
    return _then(
      _value.copyWith(
            sectionId:
                null == sectionId
                    ? _value.sectionId
                    : sectionId // ignore: cast_nullable_to_non_nullable
                        as String,
            type:
                null == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as ReportSectionType,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            enabled:
                null == enabled
                    ? _value.enabled
                    : enabled // ignore: cast_nullable_to_non_nullable
                        as bool,
            sortOrder:
                null == sortOrder
                    ? _value.sortOrder
                    : sortOrder // ignore: cast_nullable_to_non_nullable
                        as int,
            contentJson:
                null == contentJson
                    ? _value.contentJson
                    : contentJson // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReportSectionImplCopyWith<$Res>
    implements $ReportSectionCopyWith<$Res> {
  factory _$$ReportSectionImplCopyWith(
    _$ReportSectionImpl value,
    $Res Function(_$ReportSectionImpl) then,
  ) = __$$ReportSectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String sectionId,
    ReportSectionType type,
    String title,
    bool enabled,
    int sortOrder,
    String contentJson,
  });
}

/// @nodoc
class __$$ReportSectionImplCopyWithImpl<$Res>
    extends _$ReportSectionCopyWithImpl<$Res, _$ReportSectionImpl>
    implements _$$ReportSectionImplCopyWith<$Res> {
  __$$ReportSectionImplCopyWithImpl(
    _$ReportSectionImpl _value,
    $Res Function(_$ReportSectionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReportSection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sectionId = null,
    Object? type = null,
    Object? title = null,
    Object? enabled = null,
    Object? sortOrder = null,
    Object? contentJson = null,
  }) {
    return _then(
      _$ReportSectionImpl(
        sectionId:
            null == sectionId
                ? _value.sectionId
                : sectionId // ignore: cast_nullable_to_non_nullable
                    as String,
        type:
            null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as ReportSectionType,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        enabled:
            null == enabled
                ? _value.enabled
                : enabled // ignore: cast_nullable_to_non_nullable
                    as bool,
        sortOrder:
            null == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                    as int,
        contentJson:
            null == contentJson
                ? _value.contentJson
                : contentJson // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportSectionImpl implements _ReportSection {
  const _$ReportSectionImpl({
    required this.sectionId,
    required this.type,
    required this.title,
    this.enabled = true,
    this.sortOrder = 0,
    this.contentJson = '',
  });

  factory _$ReportSectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportSectionImplFromJson(json);

  @override
  final String sectionId;
  @override
  final ReportSectionType type;
  @override
  final String title;
  @override
  @JsonKey()
  final bool enabled;
  @override
  @JsonKey()
  final int sortOrder;
  @override
  @JsonKey()
  final String contentJson;

  @override
  String toString() {
    return 'ReportSection(sectionId: $sectionId, type: $type, title: $title, enabled: $enabled, sortOrder: $sortOrder, contentJson: $contentJson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportSectionImpl &&
            (identical(other.sectionId, sectionId) ||
                other.sectionId == sectionId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.contentJson, contentJson) ||
                other.contentJson == contentJson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    sectionId,
    type,
    title,
    enabled,
    sortOrder,
    contentJson,
  );

  /// Create a copy of ReportSection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportSectionImplCopyWith<_$ReportSectionImpl> get copyWith =>
      __$$ReportSectionImplCopyWithImpl<_$ReportSectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportSectionImplToJson(this);
  }
}

abstract class _ReportSection implements ReportSection {
  const factory _ReportSection({
    required final String sectionId,
    required final ReportSectionType type,
    required final String title,
    final bool enabled,
    final int sortOrder,
    final String contentJson,
  }) = _$ReportSectionImpl;

  factory _ReportSection.fromJson(Map<String, dynamic> json) =
      _$ReportSectionImpl.fromJson;

  @override
  String get sectionId;
  @override
  ReportSectionType get type;
  @override
  String get title;
  @override
  bool get enabled;
  @override
  int get sortOrder;
  @override
  String get contentJson;

  /// Create a copy of ReportSection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportSectionImplCopyWith<_$ReportSectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
