// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ReportTemplate _$ReportTemplateFromJson(Map<String, dynamic> json) {
  return _ReportTemplate.fromJson(json);
}

/// @nodoc
mixin _$ReportTemplate {
  String get templateId => throw _privateConstructorUsedError;
  String get templateName => throw _privateConstructorUsedError;
  String get theme => throw _privateConstructorUsedError;
  List<ReportSection> get sections => throw _privateConstructorUsedError;
  String get pageSize => throw _privateConstructorUsedError;
  String get orientation => throw _privateConstructorUsedError;
  bool get showLogo => throw _privateConstructorUsedError;
  bool get showQRCode => throw _privateConstructorUsedError;

  /// Serializes this ReportTemplate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReportTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportTemplateCopyWith<ReportTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportTemplateCopyWith<$Res> {
  factory $ReportTemplateCopyWith(
    ReportTemplate value,
    $Res Function(ReportTemplate) then,
  ) = _$ReportTemplateCopyWithImpl<$Res, ReportTemplate>;
  @useResult
  $Res call({
    String templateId,
    String templateName,
    String theme,
    List<ReportSection> sections,
    String pageSize,
    String orientation,
    bool showLogo,
    bool showQRCode,
  });
}

/// @nodoc
class _$ReportTemplateCopyWithImpl<$Res, $Val extends ReportTemplate>
    implements $ReportTemplateCopyWith<$Res> {
  _$ReportTemplateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? templateId = null,
    Object? templateName = null,
    Object? theme = null,
    Object? sections = null,
    Object? pageSize = null,
    Object? orientation = null,
    Object? showLogo = null,
    Object? showQRCode = null,
  }) {
    return _then(
      _value.copyWith(
            templateId:
                null == templateId
                    ? _value.templateId
                    : templateId // ignore: cast_nullable_to_non_nullable
                        as String,
            templateName:
                null == templateName
                    ? _value.templateName
                    : templateName // ignore: cast_nullable_to_non_nullable
                        as String,
            theme:
                null == theme
                    ? _value.theme
                    : theme // ignore: cast_nullable_to_non_nullable
                        as String,
            sections:
                null == sections
                    ? _value.sections
                    : sections // ignore: cast_nullable_to_non_nullable
                        as List<ReportSection>,
            pageSize:
                null == pageSize
                    ? _value.pageSize
                    : pageSize // ignore: cast_nullable_to_non_nullable
                        as String,
            orientation:
                null == orientation
                    ? _value.orientation
                    : orientation // ignore: cast_nullable_to_non_nullable
                        as String,
            showLogo:
                null == showLogo
                    ? _value.showLogo
                    : showLogo // ignore: cast_nullable_to_non_nullable
                        as bool,
            showQRCode:
                null == showQRCode
                    ? _value.showQRCode
                    : showQRCode // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReportTemplateImplCopyWith<$Res>
    implements $ReportTemplateCopyWith<$Res> {
  factory _$$ReportTemplateImplCopyWith(
    _$ReportTemplateImpl value,
    $Res Function(_$ReportTemplateImpl) then,
  ) = __$$ReportTemplateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String templateId,
    String templateName,
    String theme,
    List<ReportSection> sections,
    String pageSize,
    String orientation,
    bool showLogo,
    bool showQRCode,
  });
}

/// @nodoc
class __$$ReportTemplateImplCopyWithImpl<$Res>
    extends _$ReportTemplateCopyWithImpl<$Res, _$ReportTemplateImpl>
    implements _$$ReportTemplateImplCopyWith<$Res> {
  __$$ReportTemplateImplCopyWithImpl(
    _$ReportTemplateImpl _value,
    $Res Function(_$ReportTemplateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReportTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? templateId = null,
    Object? templateName = null,
    Object? theme = null,
    Object? sections = null,
    Object? pageSize = null,
    Object? orientation = null,
    Object? showLogo = null,
    Object? showQRCode = null,
  }) {
    return _then(
      _$ReportTemplateImpl(
        templateId:
            null == templateId
                ? _value.templateId
                : templateId // ignore: cast_nullable_to_non_nullable
                    as String,
        templateName:
            null == templateName
                ? _value.templateName
                : templateName // ignore: cast_nullable_to_non_nullable
                    as String,
        theme:
            null == theme
                ? _value.theme
                : theme // ignore: cast_nullable_to_non_nullable
                    as String,
        sections:
            null == sections
                ? _value._sections
                : sections // ignore: cast_nullable_to_non_nullable
                    as List<ReportSection>,
        pageSize:
            null == pageSize
                ? _value.pageSize
                : pageSize // ignore: cast_nullable_to_non_nullable
                    as String,
        orientation:
            null == orientation
                ? _value.orientation
                : orientation // ignore: cast_nullable_to_non_nullable
                    as String,
        showLogo:
            null == showLogo
                ? _value.showLogo
                : showLogo // ignore: cast_nullable_to_non_nullable
                    as bool,
        showQRCode:
            null == showQRCode
                ? _value.showQRCode
                : showQRCode // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportTemplateImpl implements _ReportTemplate {
  const _$ReportTemplateImpl({
    required this.templateId,
    required this.templateName,
    this.theme = 'professional_dark',
    final List<ReportSection> sections = const [],
    this.pageSize = 'A4',
    this.orientation = 'portrait',
    this.showLogo = true,
    this.showQRCode = true,
  }) : _sections = sections;

  factory _$ReportTemplateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportTemplateImplFromJson(json);

  @override
  final String templateId;
  @override
  final String templateName;
  @override
  @JsonKey()
  final String theme;
  final List<ReportSection> _sections;
  @override
  @JsonKey()
  List<ReportSection> get sections {
    if (_sections is EqualUnmodifiableListView) return _sections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sections);
  }

  @override
  @JsonKey()
  final String pageSize;
  @override
  @JsonKey()
  final String orientation;
  @override
  @JsonKey()
  final bool showLogo;
  @override
  @JsonKey()
  final bool showQRCode;

  @override
  String toString() {
    return 'ReportTemplate(templateId: $templateId, templateName: $templateName, theme: $theme, sections: $sections, pageSize: $pageSize, orientation: $orientation, showLogo: $showLogo, showQRCode: $showQRCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportTemplateImpl &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
            (identical(other.templateName, templateName) ||
                other.templateName == templateName) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            const DeepCollectionEquality().equals(other._sections, _sections) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.orientation, orientation) ||
                other.orientation == orientation) &&
            (identical(other.showLogo, showLogo) ||
                other.showLogo == showLogo) &&
            (identical(other.showQRCode, showQRCode) ||
                other.showQRCode == showQRCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    templateId,
    templateName,
    theme,
    const DeepCollectionEquality().hash(_sections),
    pageSize,
    orientation,
    showLogo,
    showQRCode,
  );

  /// Create a copy of ReportTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportTemplateImplCopyWith<_$ReportTemplateImpl> get copyWith =>
      __$$ReportTemplateImplCopyWithImpl<_$ReportTemplateImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportTemplateImplToJson(this);
  }
}

abstract class _ReportTemplate implements ReportTemplate {
  const factory _ReportTemplate({
    required final String templateId,
    required final String templateName,
    final String theme,
    final List<ReportSection> sections,
    final String pageSize,
    final String orientation,
    final bool showLogo,
    final bool showQRCode,
  }) = _$ReportTemplateImpl;

  factory _ReportTemplate.fromJson(Map<String, dynamic> json) =
      _$ReportTemplateImpl.fromJson;

  @override
  String get templateId;
  @override
  String get templateName;
  @override
  String get theme;
  @override
  List<ReportSection> get sections;
  @override
  String get pageSize;
  @override
  String get orientation;
  @override
  bool get showLogo;
  @override
  bool get showQRCode;

  /// Create a copy of ReportTemplate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportTemplateImplCopyWith<_$ReportTemplateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
