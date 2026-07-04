// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diagnostic_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DiagnosticCode _$DiagnosticCodeFromJson(Map<String, dynamic> json) {
  return _DiagnosticCode.fromJson(json);
}

/// @nodoc
mixin _$DiagnosticCode {
  String get code => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get severity =>
      throw _privateConstructorUsedError; // e.g. High, Medium, Low
  String get category =>
      throw _privateConstructorUsedError; // e.g. Powertrain, Body, Chassis
  String get status => throw _privateConstructorUsedError;

  /// Serializes this DiagnosticCode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DiagnosticCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiagnosticCodeCopyWith<DiagnosticCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagnosticCodeCopyWith<$Res> {
  factory $DiagnosticCodeCopyWith(
    DiagnosticCode value,
    $Res Function(DiagnosticCode) then,
  ) = _$DiagnosticCodeCopyWithImpl<$Res, DiagnosticCode>;
  @useResult
  $Res call({
    String code,
    String description,
    String severity,
    String category,
    String status,
  });
}

/// @nodoc
class _$DiagnosticCodeCopyWithImpl<$Res, $Val extends DiagnosticCode>
    implements $DiagnosticCodeCopyWith<$Res> {
  _$DiagnosticCodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiagnosticCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? description = null,
    Object? severity = null,
    Object? category = null,
    Object? status = null,
  }) {
    return _then(
      _value.copyWith(
            code:
                null == code
                    ? _value.code
                    : code // ignore: cast_nullable_to_non_nullable
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
            category:
                null == category
                    ? _value.category
                    : category // ignore: cast_nullable_to_non_nullable
                        as String,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DiagnosticCodeImplCopyWith<$Res>
    implements $DiagnosticCodeCopyWith<$Res> {
  factory _$$DiagnosticCodeImplCopyWith(
    _$DiagnosticCodeImpl value,
    $Res Function(_$DiagnosticCodeImpl) then,
  ) = __$$DiagnosticCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String code,
    String description,
    String severity,
    String category,
    String status,
  });
}

/// @nodoc
class __$$DiagnosticCodeImplCopyWithImpl<$Res>
    extends _$DiagnosticCodeCopyWithImpl<$Res, _$DiagnosticCodeImpl>
    implements _$$DiagnosticCodeImplCopyWith<$Res> {
  __$$DiagnosticCodeImplCopyWithImpl(
    _$DiagnosticCodeImpl _value,
    $Res Function(_$DiagnosticCodeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DiagnosticCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? description = null,
    Object? severity = null,
    Object? category = null,
    Object? status = null,
  }) {
    return _then(
      _$DiagnosticCodeImpl(
        code:
            null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
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
        category:
            null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                    as String,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DiagnosticCodeImpl implements _DiagnosticCode {
  const _$DiagnosticCodeImpl({
    required this.code,
    required this.description,
    required this.severity,
    required this.category,
    required this.status,
  });

  factory _$DiagnosticCodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiagnosticCodeImplFromJson(json);

  @override
  final String code;
  @override
  final String description;
  @override
  final String severity;
  // e.g. High, Medium, Low
  @override
  final String category;
  // e.g. Powertrain, Body, Chassis
  @override
  final String status;

  @override
  String toString() {
    return 'DiagnosticCode(code: $code, description: $description, severity: $severity, category: $category, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiagnosticCodeImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, description, severity, category, status);

  /// Create a copy of DiagnosticCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiagnosticCodeImplCopyWith<_$DiagnosticCodeImpl> get copyWith =>
      __$$DiagnosticCodeImplCopyWithImpl<_$DiagnosticCodeImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DiagnosticCodeImplToJson(this);
  }
}

abstract class _DiagnosticCode implements DiagnosticCode {
  const factory _DiagnosticCode({
    required final String code,
    required final String description,
    required final String severity,
    required final String category,
    required final String status,
  }) = _$DiagnosticCodeImpl;

  factory _DiagnosticCode.fromJson(Map<String, dynamic> json) =
      _$DiagnosticCodeImpl.fromJson;

  @override
  String get code;
  @override
  String get description;
  @override
  String get severity; // e.g. High, Medium, Low
  @override
  String get category; // e.g. Powertrain, Body, Chassis
  @override
  String get status;

  /// Create a copy of DiagnosticCode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiagnosticCodeImplCopyWith<_$DiagnosticCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
