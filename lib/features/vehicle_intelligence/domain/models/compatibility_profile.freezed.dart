// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compatibility_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CompatibilityProfile _$CompatibilityProfileFromJson(Map<String, dynamic> json) {
  return _CompatibilityProfile.fromJson(json);
}

/// @nodoc
mixin _$CompatibilityProfile {
  List<String> get supportedPIDs => throw _privateConstructorUsedError;
  List<String> get supportedProtocols => throw _privateConstructorUsedError;
  List<String> get supportedDiagnosticModes =>
      throw _privateConstructorUsedError;
  List<String> get knownLimitations => throw _privateConstructorUsedError;
  List<String> get manufacturerExtensions => throw _privateConstructorUsedError;

  /// Serializes this CompatibilityProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CompatibilityProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompatibilityProfileCopyWith<CompatibilityProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompatibilityProfileCopyWith<$Res> {
  factory $CompatibilityProfileCopyWith(
    CompatibilityProfile value,
    $Res Function(CompatibilityProfile) then,
  ) = _$CompatibilityProfileCopyWithImpl<$Res, CompatibilityProfile>;
  @useResult
  $Res call({
    List<String> supportedPIDs,
    List<String> supportedProtocols,
    List<String> supportedDiagnosticModes,
    List<String> knownLimitations,
    List<String> manufacturerExtensions,
  });
}

/// @nodoc
class _$CompatibilityProfileCopyWithImpl<
  $Res,
  $Val extends CompatibilityProfile
>
    implements $CompatibilityProfileCopyWith<$Res> {
  _$CompatibilityProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompatibilityProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supportedPIDs = null,
    Object? supportedProtocols = null,
    Object? supportedDiagnosticModes = null,
    Object? knownLimitations = null,
    Object? manufacturerExtensions = null,
  }) {
    return _then(
      _value.copyWith(
            supportedPIDs:
                null == supportedPIDs
                    ? _value.supportedPIDs
                    : supportedPIDs // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            supportedProtocols:
                null == supportedProtocols
                    ? _value.supportedProtocols
                    : supportedProtocols // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            supportedDiagnosticModes:
                null == supportedDiagnosticModes
                    ? _value.supportedDiagnosticModes
                    : supportedDiagnosticModes // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            knownLimitations:
                null == knownLimitations
                    ? _value.knownLimitations
                    : knownLimitations // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            manufacturerExtensions:
                null == manufacturerExtensions
                    ? _value.manufacturerExtensions
                    : manufacturerExtensions // ignore: cast_nullable_to_non_nullable
                        as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CompatibilityProfileImplCopyWith<$Res>
    implements $CompatibilityProfileCopyWith<$Res> {
  factory _$$CompatibilityProfileImplCopyWith(
    _$CompatibilityProfileImpl value,
    $Res Function(_$CompatibilityProfileImpl) then,
  ) = __$$CompatibilityProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<String> supportedPIDs,
    List<String> supportedProtocols,
    List<String> supportedDiagnosticModes,
    List<String> knownLimitations,
    List<String> manufacturerExtensions,
  });
}

/// @nodoc
class __$$CompatibilityProfileImplCopyWithImpl<$Res>
    extends _$CompatibilityProfileCopyWithImpl<$Res, _$CompatibilityProfileImpl>
    implements _$$CompatibilityProfileImplCopyWith<$Res> {
  __$$CompatibilityProfileImplCopyWithImpl(
    _$CompatibilityProfileImpl _value,
    $Res Function(_$CompatibilityProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CompatibilityProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supportedPIDs = null,
    Object? supportedProtocols = null,
    Object? supportedDiagnosticModes = null,
    Object? knownLimitations = null,
    Object? manufacturerExtensions = null,
  }) {
    return _then(
      _$CompatibilityProfileImpl(
        supportedPIDs:
            null == supportedPIDs
                ? _value._supportedPIDs
                : supportedPIDs // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        supportedProtocols:
            null == supportedProtocols
                ? _value._supportedProtocols
                : supportedProtocols // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        supportedDiagnosticModes:
            null == supportedDiagnosticModes
                ? _value._supportedDiagnosticModes
                : supportedDiagnosticModes // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        knownLimitations:
            null == knownLimitations
                ? _value._knownLimitations
                : knownLimitations // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        manufacturerExtensions:
            null == manufacturerExtensions
                ? _value._manufacturerExtensions
                : manufacturerExtensions // ignore: cast_nullable_to_non_nullable
                    as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CompatibilityProfileImpl implements _CompatibilityProfile {
  const _$CompatibilityProfileImpl({
    final List<String> supportedPIDs = const [],
    final List<String> supportedProtocols = const [],
    final List<String> supportedDiagnosticModes = const [],
    final List<String> knownLimitations = const [],
    final List<String> manufacturerExtensions = const [],
  }) : _supportedPIDs = supportedPIDs,
       _supportedProtocols = supportedProtocols,
       _supportedDiagnosticModes = supportedDiagnosticModes,
       _knownLimitations = knownLimitations,
       _manufacturerExtensions = manufacturerExtensions;

  factory _$CompatibilityProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompatibilityProfileImplFromJson(json);

  final List<String> _supportedPIDs;
  @override
  @JsonKey()
  List<String> get supportedPIDs {
    if (_supportedPIDs is EqualUnmodifiableListView) return _supportedPIDs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_supportedPIDs);
  }

  final List<String> _supportedProtocols;
  @override
  @JsonKey()
  List<String> get supportedProtocols {
    if (_supportedProtocols is EqualUnmodifiableListView)
      return _supportedProtocols;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_supportedProtocols);
  }

  final List<String> _supportedDiagnosticModes;
  @override
  @JsonKey()
  List<String> get supportedDiagnosticModes {
    if (_supportedDiagnosticModes is EqualUnmodifiableListView)
      return _supportedDiagnosticModes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_supportedDiagnosticModes);
  }

  final List<String> _knownLimitations;
  @override
  @JsonKey()
  List<String> get knownLimitations {
    if (_knownLimitations is EqualUnmodifiableListView)
      return _knownLimitations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_knownLimitations);
  }

  final List<String> _manufacturerExtensions;
  @override
  @JsonKey()
  List<String> get manufacturerExtensions {
    if (_manufacturerExtensions is EqualUnmodifiableListView)
      return _manufacturerExtensions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_manufacturerExtensions);
  }

  @override
  String toString() {
    return 'CompatibilityProfile(supportedPIDs: $supportedPIDs, supportedProtocols: $supportedProtocols, supportedDiagnosticModes: $supportedDiagnosticModes, knownLimitations: $knownLimitations, manufacturerExtensions: $manufacturerExtensions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompatibilityProfileImpl &&
            const DeepCollectionEquality().equals(
              other._supportedPIDs,
              _supportedPIDs,
            ) &&
            const DeepCollectionEquality().equals(
              other._supportedProtocols,
              _supportedProtocols,
            ) &&
            const DeepCollectionEquality().equals(
              other._supportedDiagnosticModes,
              _supportedDiagnosticModes,
            ) &&
            const DeepCollectionEquality().equals(
              other._knownLimitations,
              _knownLimitations,
            ) &&
            const DeepCollectionEquality().equals(
              other._manufacturerExtensions,
              _manufacturerExtensions,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_supportedPIDs),
    const DeepCollectionEquality().hash(_supportedProtocols),
    const DeepCollectionEquality().hash(_supportedDiagnosticModes),
    const DeepCollectionEquality().hash(_knownLimitations),
    const DeepCollectionEquality().hash(_manufacturerExtensions),
  );

  /// Create a copy of CompatibilityProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompatibilityProfileImplCopyWith<_$CompatibilityProfileImpl>
  get copyWith =>
      __$$CompatibilityProfileImplCopyWithImpl<_$CompatibilityProfileImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CompatibilityProfileImplToJson(this);
  }
}

abstract class _CompatibilityProfile implements CompatibilityProfile {
  const factory _CompatibilityProfile({
    final List<String> supportedPIDs,
    final List<String> supportedProtocols,
    final List<String> supportedDiagnosticModes,
    final List<String> knownLimitations,
    final List<String> manufacturerExtensions,
  }) = _$CompatibilityProfileImpl;

  factory _CompatibilityProfile.fromJson(Map<String, dynamic> json) =
      _$CompatibilityProfileImpl.fromJson;

  @override
  List<String> get supportedPIDs;
  @override
  List<String> get supportedProtocols;
  @override
  List<String> get supportedDiagnosticModes;
  @override
  List<String> get knownLimitations;
  @override
  List<String> get manufacturerExtensions;

  /// Create a copy of CompatibilityProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompatibilityProfileImplCopyWith<_$CompatibilityProfileImpl>
  get copyWith => throw _privateConstructorUsedError;
}
