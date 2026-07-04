// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'obd_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ObdResponse _$ObdResponseFromJson(Map<String, dynamic> json) {
  return _ObdResponse.fromJson(json);
}

/// @nodoc
mixin _$ObdResponse {
  String get rawData => throw _privateConstructorUsedError;
  Map<String, dynamic>? get parsedData => throw _privateConstructorUsedError;
  int get responseTime => throw _privateConstructorUsedError; // in milliseconds
  bool get isValid => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this ObdResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ObdResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ObdResponseCopyWith<ObdResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ObdResponseCopyWith<$Res> {
  factory $ObdResponseCopyWith(
    ObdResponse value,
    $Res Function(ObdResponse) then,
  ) = _$ObdResponseCopyWithImpl<$Res, ObdResponse>;
  @useResult
  $Res call({
    String rawData,
    Map<String, dynamic>? parsedData,
    int responseTime,
    bool isValid,
    String? error,
  });
}

/// @nodoc
class _$ObdResponseCopyWithImpl<$Res, $Val extends ObdResponse>
    implements $ObdResponseCopyWith<$Res> {
  _$ObdResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ObdResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawData = null,
    Object? parsedData = freezed,
    Object? responseTime = null,
    Object? isValid = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            rawData:
                null == rawData
                    ? _value.rawData
                    : rawData // ignore: cast_nullable_to_non_nullable
                        as String,
            parsedData:
                freezed == parsedData
                    ? _value.parsedData
                    : parsedData // ignore: cast_nullable_to_non_nullable
                        as Map<String, dynamic>?,
            responseTime:
                null == responseTime
                    ? _value.responseTime
                    : responseTime // ignore: cast_nullable_to_non_nullable
                        as int,
            isValid:
                null == isValid
                    ? _value.isValid
                    : isValid // ignore: cast_nullable_to_non_nullable
                        as bool,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ObdResponseImplCopyWith<$Res>
    implements $ObdResponseCopyWith<$Res> {
  factory _$$ObdResponseImplCopyWith(
    _$ObdResponseImpl value,
    $Res Function(_$ObdResponseImpl) then,
  ) = __$$ObdResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String rawData,
    Map<String, dynamic>? parsedData,
    int responseTime,
    bool isValid,
    String? error,
  });
}

/// @nodoc
class __$$ObdResponseImplCopyWithImpl<$Res>
    extends _$ObdResponseCopyWithImpl<$Res, _$ObdResponseImpl>
    implements _$$ObdResponseImplCopyWith<$Res> {
  __$$ObdResponseImplCopyWithImpl(
    _$ObdResponseImpl _value,
    $Res Function(_$ObdResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ObdResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawData = null,
    Object? parsedData = freezed,
    Object? responseTime = null,
    Object? isValid = null,
    Object? error = freezed,
  }) {
    return _then(
      _$ObdResponseImpl(
        rawData:
            null == rawData
                ? _value.rawData
                : rawData // ignore: cast_nullable_to_non_nullable
                    as String,
        parsedData:
            freezed == parsedData
                ? _value._parsedData
                : parsedData // ignore: cast_nullable_to_non_nullable
                    as Map<String, dynamic>?,
        responseTime:
            null == responseTime
                ? _value.responseTime
                : responseTime // ignore: cast_nullable_to_non_nullable
                    as int,
        isValid:
            null == isValid
                ? _value.isValid
                : isValid // ignore: cast_nullable_to_non_nullable
                    as bool,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ObdResponseImpl implements _ObdResponse {
  const _$ObdResponseImpl({
    required this.rawData,
    final Map<String, dynamic>? parsedData,
    required this.responseTime,
    required this.isValid,
    this.error,
  }) : _parsedData = parsedData;

  factory _$ObdResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ObdResponseImplFromJson(json);

  @override
  final String rawData;
  final Map<String, dynamic>? _parsedData;
  @override
  Map<String, dynamic>? get parsedData {
    final value = _parsedData;
    if (value == null) return null;
    if (_parsedData is EqualUnmodifiableMapView) return _parsedData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final int responseTime;
  // in milliseconds
  @override
  final bool isValid;
  @override
  final String? error;

  @override
  String toString() {
    return 'ObdResponse(rawData: $rawData, parsedData: $parsedData, responseTime: $responseTime, isValid: $isValid, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ObdResponseImpl &&
            (identical(other.rawData, rawData) || other.rawData == rawData) &&
            const DeepCollectionEquality().equals(
              other._parsedData,
              _parsedData,
            ) &&
            (identical(other.responseTime, responseTime) ||
                other.responseTime == responseTime) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    rawData,
    const DeepCollectionEquality().hash(_parsedData),
    responseTime,
    isValid,
    error,
  );

  /// Create a copy of ObdResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ObdResponseImplCopyWith<_$ObdResponseImpl> get copyWith =>
      __$$ObdResponseImplCopyWithImpl<_$ObdResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ObdResponseImplToJson(this);
  }
}

abstract class _ObdResponse implements ObdResponse {
  const factory _ObdResponse({
    required final String rawData,
    final Map<String, dynamic>? parsedData,
    required final int responseTime,
    required final bool isValid,
    final String? error,
  }) = _$ObdResponseImpl;

  factory _ObdResponse.fromJson(Map<String, dynamic> json) =
      _$ObdResponseImpl.fromJson;

  @override
  String get rawData;
  @override
  Map<String, dynamic>? get parsedData;
  @override
  int get responseTime; // in milliseconds
  @override
  bool get isValid;
  @override
  String? get error;

  /// Create a copy of ObdResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ObdResponseImplCopyWith<_$ObdResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
