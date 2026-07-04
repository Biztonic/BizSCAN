// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_widget_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DashboardWidgetConfig _$DashboardWidgetConfigFromJson(
  Map<String, dynamic> json,
) {
  return _DashboardWidgetConfig.fromJson(json);
}

/// @nodoc
mixin _$DashboardWidgetConfig {
  String get widgetId => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // 'gauge', 'chart', 'card', 'ring'
  String get pidSource =>
      throw _privateConstructorUsedError; // 'RPM', 'SPEED', 'COOLANT_TEMP', 'VOLTAGE', 'FUEL_TRIM'
  String get themeMode => throw _privateConstructorUsedError;
  String get colorScheme => throw _privateConstructorUsedError;
  String get size =>
      throw _privateConstructorUsedError; // 'small', 'medium', 'large'
  int get refreshIntervalMs => throw _privateConstructorUsedError;

  /// Serializes this DashboardWidgetConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardWidgetConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardWidgetConfigCopyWith<DashboardWidgetConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardWidgetConfigCopyWith<$Res> {
  factory $DashboardWidgetConfigCopyWith(
    DashboardWidgetConfig value,
    $Res Function(DashboardWidgetConfig) then,
  ) = _$DashboardWidgetConfigCopyWithImpl<$Res, DashboardWidgetConfig>;
  @useResult
  $Res call({
    String widgetId,
    String type,
    String pidSource,
    String themeMode,
    String colorScheme,
    String size,
    int refreshIntervalMs,
  });
}

/// @nodoc
class _$DashboardWidgetConfigCopyWithImpl<
  $Res,
  $Val extends DashboardWidgetConfig
>
    implements $DashboardWidgetConfigCopyWith<$Res> {
  _$DashboardWidgetConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardWidgetConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? widgetId = null,
    Object? type = null,
    Object? pidSource = null,
    Object? themeMode = null,
    Object? colorScheme = null,
    Object? size = null,
    Object? refreshIntervalMs = null,
  }) {
    return _then(
      _value.copyWith(
            widgetId:
                null == widgetId
                    ? _value.widgetId
                    : widgetId // ignore: cast_nullable_to_non_nullable
                        as String,
            type:
                null == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as String,
            pidSource:
                null == pidSource
                    ? _value.pidSource
                    : pidSource // ignore: cast_nullable_to_non_nullable
                        as String,
            themeMode:
                null == themeMode
                    ? _value.themeMode
                    : themeMode // ignore: cast_nullable_to_non_nullable
                        as String,
            colorScheme:
                null == colorScheme
                    ? _value.colorScheme
                    : colorScheme // ignore: cast_nullable_to_non_nullable
                        as String,
            size:
                null == size
                    ? _value.size
                    : size // ignore: cast_nullable_to_non_nullable
                        as String,
            refreshIntervalMs:
                null == refreshIntervalMs
                    ? _value.refreshIntervalMs
                    : refreshIntervalMs // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DashboardWidgetConfigImplCopyWith<$Res>
    implements $DashboardWidgetConfigCopyWith<$Res> {
  factory _$$DashboardWidgetConfigImplCopyWith(
    _$DashboardWidgetConfigImpl value,
    $Res Function(_$DashboardWidgetConfigImpl) then,
  ) = __$$DashboardWidgetConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String widgetId,
    String type,
    String pidSource,
    String themeMode,
    String colorScheme,
    String size,
    int refreshIntervalMs,
  });
}

/// @nodoc
class __$$DashboardWidgetConfigImplCopyWithImpl<$Res>
    extends
        _$DashboardWidgetConfigCopyWithImpl<$Res, _$DashboardWidgetConfigImpl>
    implements _$$DashboardWidgetConfigImplCopyWith<$Res> {
  __$$DashboardWidgetConfigImplCopyWithImpl(
    _$DashboardWidgetConfigImpl _value,
    $Res Function(_$DashboardWidgetConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DashboardWidgetConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? widgetId = null,
    Object? type = null,
    Object? pidSource = null,
    Object? themeMode = null,
    Object? colorScheme = null,
    Object? size = null,
    Object? refreshIntervalMs = null,
  }) {
    return _then(
      _$DashboardWidgetConfigImpl(
        widgetId:
            null == widgetId
                ? _value.widgetId
                : widgetId // ignore: cast_nullable_to_non_nullable
                    as String,
        type:
            null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as String,
        pidSource:
            null == pidSource
                ? _value.pidSource
                : pidSource // ignore: cast_nullable_to_non_nullable
                    as String,
        themeMode:
            null == themeMode
                ? _value.themeMode
                : themeMode // ignore: cast_nullable_to_non_nullable
                    as String,
        colorScheme:
            null == colorScheme
                ? _value.colorScheme
                : colorScheme // ignore: cast_nullable_to_non_nullable
                    as String,
        size:
            null == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                    as String,
        refreshIntervalMs:
            null == refreshIntervalMs
                ? _value.refreshIntervalMs
                : refreshIntervalMs // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardWidgetConfigImpl implements _DashboardWidgetConfig {
  const _$DashboardWidgetConfigImpl({
    required this.widgetId,
    required this.type,
    required this.pidSource,
    this.themeMode = 'dark',
    this.colorScheme = 'blue',
    this.size = 'medium',
    this.refreshIntervalMs = 33,
  });

  factory _$DashboardWidgetConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardWidgetConfigImplFromJson(json);

  @override
  final String widgetId;
  @override
  final String type;
  // 'gauge', 'chart', 'card', 'ring'
  @override
  final String pidSource;
  // 'RPM', 'SPEED', 'COOLANT_TEMP', 'VOLTAGE', 'FUEL_TRIM'
  @override
  @JsonKey()
  final String themeMode;
  @override
  @JsonKey()
  final String colorScheme;
  @override
  @JsonKey()
  final String size;
  // 'small', 'medium', 'large'
  @override
  @JsonKey()
  final int refreshIntervalMs;

  @override
  String toString() {
    return 'DashboardWidgetConfig(widgetId: $widgetId, type: $type, pidSource: $pidSource, themeMode: $themeMode, colorScheme: $colorScheme, size: $size, refreshIntervalMs: $refreshIntervalMs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardWidgetConfigImpl &&
            (identical(other.widgetId, widgetId) ||
                other.widgetId == widgetId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.pidSource, pidSource) ||
                other.pidSource == pidSource) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.colorScheme, colorScheme) ||
                other.colorScheme == colorScheme) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.refreshIntervalMs, refreshIntervalMs) ||
                other.refreshIntervalMs == refreshIntervalMs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    widgetId,
    type,
    pidSource,
    themeMode,
    colorScheme,
    size,
    refreshIntervalMs,
  );

  /// Create a copy of DashboardWidgetConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardWidgetConfigImplCopyWith<_$DashboardWidgetConfigImpl>
  get copyWith =>
      __$$DashboardWidgetConfigImplCopyWithImpl<_$DashboardWidgetConfigImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardWidgetConfigImplToJson(this);
  }
}

abstract class _DashboardWidgetConfig implements DashboardWidgetConfig {
  const factory _DashboardWidgetConfig({
    required final String widgetId,
    required final String type,
    required final String pidSource,
    final String themeMode,
    final String colorScheme,
    final String size,
    final int refreshIntervalMs,
  }) = _$DashboardWidgetConfigImpl;

  factory _DashboardWidgetConfig.fromJson(Map<String, dynamic> json) =
      _$DashboardWidgetConfigImpl.fromJson;

  @override
  String get widgetId;
  @override
  String get type; // 'gauge', 'chart', 'card', 'ring'
  @override
  String get pidSource; // 'RPM', 'SPEED', 'COOLANT_TEMP', 'VOLTAGE', 'FUEL_TRIM'
  @override
  String get themeMode;
  @override
  String get colorScheme;
  @override
  String get size; // 'small', 'medium', 'large'
  @override
  int get refreshIntervalMs;

  /// Create a copy of DashboardWidgetConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardWidgetConfigImplCopyWith<_$DashboardWidgetConfigImpl>
  get copyWith => throw _privateConstructorUsedError;
}
