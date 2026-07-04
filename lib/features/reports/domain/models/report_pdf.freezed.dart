// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_pdf.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ReportPdf _$ReportPdfFromJson(Map<String, dynamic> json) {
  return _ReportPdf.fromJson(json);
}

/// @nodoc
mixin _$ReportPdf {
  String get pdfId => throw _privateConstructorUsedError;
  String get scanId => throw _privateConstructorUsedError;
  String get storagePath => throw _privateConstructorUsedError;
  String get downloadUrl => throw _privateConstructorUsedError;
  DateTime get generatedAt => throw _privateConstructorUsedError;

  /// Serializes this ReportPdf to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReportPdf
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportPdfCopyWith<ReportPdf> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportPdfCopyWith<$Res> {
  factory $ReportPdfCopyWith(ReportPdf value, $Res Function(ReportPdf) then) =
      _$ReportPdfCopyWithImpl<$Res, ReportPdf>;
  @useResult
  $Res call({
    String pdfId,
    String scanId,
    String storagePath,
    String downloadUrl,
    DateTime generatedAt,
  });
}

/// @nodoc
class _$ReportPdfCopyWithImpl<$Res, $Val extends ReportPdf>
    implements $ReportPdfCopyWith<$Res> {
  _$ReportPdfCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportPdf
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pdfId = null,
    Object? scanId = null,
    Object? storagePath = null,
    Object? downloadUrl = null,
    Object? generatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            pdfId:
                null == pdfId
                    ? _value.pdfId
                    : pdfId // ignore: cast_nullable_to_non_nullable
                        as String,
            scanId:
                null == scanId
                    ? _value.scanId
                    : scanId // ignore: cast_nullable_to_non_nullable
                        as String,
            storagePath:
                null == storagePath
                    ? _value.storagePath
                    : storagePath // ignore: cast_nullable_to_non_nullable
                        as String,
            downloadUrl:
                null == downloadUrl
                    ? _value.downloadUrl
                    : downloadUrl // ignore: cast_nullable_to_non_nullable
                        as String,
            generatedAt:
                null == generatedAt
                    ? _value.generatedAt
                    : generatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReportPdfImplCopyWith<$Res>
    implements $ReportPdfCopyWith<$Res> {
  factory _$$ReportPdfImplCopyWith(
    _$ReportPdfImpl value,
    $Res Function(_$ReportPdfImpl) then,
  ) = __$$ReportPdfImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String pdfId,
    String scanId,
    String storagePath,
    String downloadUrl,
    DateTime generatedAt,
  });
}

/// @nodoc
class __$$ReportPdfImplCopyWithImpl<$Res>
    extends _$ReportPdfCopyWithImpl<$Res, _$ReportPdfImpl>
    implements _$$ReportPdfImplCopyWith<$Res> {
  __$$ReportPdfImplCopyWithImpl(
    _$ReportPdfImpl _value,
    $Res Function(_$ReportPdfImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReportPdf
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pdfId = null,
    Object? scanId = null,
    Object? storagePath = null,
    Object? downloadUrl = null,
    Object? generatedAt = null,
  }) {
    return _then(
      _$ReportPdfImpl(
        pdfId:
            null == pdfId
                ? _value.pdfId
                : pdfId // ignore: cast_nullable_to_non_nullable
                    as String,
        scanId:
            null == scanId
                ? _value.scanId
                : scanId // ignore: cast_nullable_to_non_nullable
                    as String,
        storagePath:
            null == storagePath
                ? _value.storagePath
                : storagePath // ignore: cast_nullable_to_non_nullable
                    as String,
        downloadUrl:
            null == downloadUrl
                ? _value.downloadUrl
                : downloadUrl // ignore: cast_nullable_to_non_nullable
                    as String,
        generatedAt:
            null == generatedAt
                ? _value.generatedAt
                : generatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportPdfImpl implements _ReportPdf {
  const _$ReportPdfImpl({
    required this.pdfId,
    required this.scanId,
    required this.storagePath,
    required this.downloadUrl,
    required this.generatedAt,
  });

  factory _$ReportPdfImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportPdfImplFromJson(json);

  @override
  final String pdfId;
  @override
  final String scanId;
  @override
  final String storagePath;
  @override
  final String downloadUrl;
  @override
  final DateTime generatedAt;

  @override
  String toString() {
    return 'ReportPdf(pdfId: $pdfId, scanId: $scanId, storagePath: $storagePath, downloadUrl: $downloadUrl, generatedAt: $generatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportPdfImpl &&
            (identical(other.pdfId, pdfId) || other.pdfId == pdfId) &&
            (identical(other.scanId, scanId) || other.scanId == scanId) &&
            (identical(other.storagePath, storagePath) ||
                other.storagePath == storagePath) &&
            (identical(other.downloadUrl, downloadUrl) ||
                other.downloadUrl == downloadUrl) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    pdfId,
    scanId,
    storagePath,
    downloadUrl,
    generatedAt,
  );

  /// Create a copy of ReportPdf
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportPdfImplCopyWith<_$ReportPdfImpl> get copyWith =>
      __$$ReportPdfImplCopyWithImpl<_$ReportPdfImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportPdfImplToJson(this);
  }
}

abstract class _ReportPdf implements ReportPdf {
  const factory _ReportPdf({
    required final String pdfId,
    required final String scanId,
    required final String storagePath,
    required final String downloadUrl,
    required final DateTime generatedAt,
  }) = _$ReportPdfImpl;

  factory _ReportPdf.fromJson(Map<String, dynamic> json) =
      _$ReportPdfImpl.fromJson;

  @override
  String get pdfId;
  @override
  String get scanId;
  @override
  String get storagePath;
  @override
  String get downloadUrl;
  @override
  DateTime get generatedAt;

  /// Create a copy of ReportPdf
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportPdfImplCopyWith<_$ReportPdfImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
