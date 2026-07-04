// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SettingsModel _$SettingsModelFromJson(Map<String, dynamic> json) {
  return _SettingsModel.fromJson(json);
}

/// @nodoc
mixin _$SettingsModel {
  String get language => throw _privateConstructorUsedError;
  String get theme => throw _privateConstructorUsedError;
  String get distanceUnit => throw _privateConstructorUsedError;
  String get temperatureUnit => throw _privateConstructorUsedError;
  String get fuelUnit => throw _privateConstructorUsedError;
  bool get notifications => throw _privateConstructorUsedError;

  /// Serializes this SettingsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SettingsModelCopyWith<SettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsModelCopyWith<$Res> {
  factory $SettingsModelCopyWith(
    SettingsModel value,
    $Res Function(SettingsModel) then,
  ) = _$SettingsModelCopyWithImpl<$Res, SettingsModel>;
  @useResult
  $Res call({
    String language,
    String theme,
    String distanceUnit,
    String temperatureUnit,
    String fuelUnit,
    bool notifications,
  });
}

/// @nodoc
class _$SettingsModelCopyWithImpl<$Res, $Val extends SettingsModel>
    implements $SettingsModelCopyWith<$Res> {
  _$SettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
    Object? theme = null,
    Object? distanceUnit = null,
    Object? temperatureUnit = null,
    Object? fuelUnit = null,
    Object? notifications = null,
  }) {
    return _then(
      _value.copyWith(
            language:
                null == language
                    ? _value.language
                    : language // ignore: cast_nullable_to_non_nullable
                        as String,
            theme:
                null == theme
                    ? _value.theme
                    : theme // ignore: cast_nullable_to_non_nullable
                        as String,
            distanceUnit:
                null == distanceUnit
                    ? _value.distanceUnit
                    : distanceUnit // ignore: cast_nullable_to_non_nullable
                        as String,
            temperatureUnit:
                null == temperatureUnit
                    ? _value.temperatureUnit
                    : temperatureUnit // ignore: cast_nullable_to_non_nullable
                        as String,
            fuelUnit:
                null == fuelUnit
                    ? _value.fuelUnit
                    : fuelUnit // ignore: cast_nullable_to_non_nullable
                        as String,
            notifications:
                null == notifications
                    ? _value.notifications
                    : notifications // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SettingsModelImplCopyWith<$Res>
    implements $SettingsModelCopyWith<$Res> {
  factory _$$SettingsModelImplCopyWith(
    _$SettingsModelImpl value,
    $Res Function(_$SettingsModelImpl) then,
  ) = __$$SettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String language,
    String theme,
    String distanceUnit,
    String temperatureUnit,
    String fuelUnit,
    bool notifications,
  });
}

/// @nodoc
class __$$SettingsModelImplCopyWithImpl<$Res>
    extends _$SettingsModelCopyWithImpl<$Res, _$SettingsModelImpl>
    implements _$$SettingsModelImplCopyWith<$Res> {
  __$$SettingsModelImplCopyWithImpl(
    _$SettingsModelImpl _value,
    $Res Function(_$SettingsModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
    Object? theme = null,
    Object? distanceUnit = null,
    Object? temperatureUnit = null,
    Object? fuelUnit = null,
    Object? notifications = null,
  }) {
    return _then(
      _$SettingsModelImpl(
        language:
            null == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                    as String,
        theme:
            null == theme
                ? _value.theme
                : theme // ignore: cast_nullable_to_non_nullable
                    as String,
        distanceUnit:
            null == distanceUnit
                ? _value.distanceUnit
                : distanceUnit // ignore: cast_nullable_to_non_nullable
                    as String,
        temperatureUnit:
            null == temperatureUnit
                ? _value.temperatureUnit
                : temperatureUnit // ignore: cast_nullable_to_non_nullable
                    as String,
        fuelUnit:
            null == fuelUnit
                ? _value.fuelUnit
                : fuelUnit // ignore: cast_nullable_to_non_nullable
                    as String,
        notifications:
            null == notifications
                ? _value.notifications
                : notifications // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SettingsModelImpl implements _SettingsModel {
  const _$SettingsModelImpl({
    required this.language,
    required this.theme,
    required this.distanceUnit,
    required this.temperatureUnit,
    required this.fuelUnit,
    required this.notifications,
  });

  factory _$SettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettingsModelImplFromJson(json);

  @override
  final String language;
  @override
  final String theme;
  @override
  final String distanceUnit;
  @override
  final String temperatureUnit;
  @override
  final String fuelUnit;
  @override
  final bool notifications;

  @override
  String toString() {
    return 'SettingsModel(language: $language, theme: $theme, distanceUnit: $distanceUnit, temperatureUnit: $temperatureUnit, fuelUnit: $fuelUnit, notifications: $notifications)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsModelImpl &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.distanceUnit, distanceUnit) ||
                other.distanceUnit == distanceUnit) &&
            (identical(other.temperatureUnit, temperatureUnit) ||
                other.temperatureUnit == temperatureUnit) &&
            (identical(other.fuelUnit, fuelUnit) ||
                other.fuelUnit == fuelUnit) &&
            (identical(other.notifications, notifications) ||
                other.notifications == notifications));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    language,
    theme,
    distanceUnit,
    temperatureUnit,
    fuelUnit,
    notifications,
  );

  /// Create a copy of SettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsModelImplCopyWith<_$SettingsModelImpl> get copyWith =>
      __$$SettingsModelImplCopyWithImpl<_$SettingsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SettingsModelImplToJson(this);
  }
}

abstract class _SettingsModel implements SettingsModel {
  const factory _SettingsModel({
    required final String language,
    required final String theme,
    required final String distanceUnit,
    required final String temperatureUnit,
    required final String fuelUnit,
    required final bool notifications,
  }) = _$SettingsModelImpl;

  factory _SettingsModel.fromJson(Map<String, dynamic> json) =
      _$SettingsModelImpl.fromJson;

  @override
  String get language;
  @override
  String get theme;
  @override
  String get distanceUnit;
  @override
  String get temperatureUnit;
  @override
  String get fuelUnit;
  @override
  bool get notifications;

  /// Create a copy of SettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingsModelImplCopyWith<_$SettingsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
