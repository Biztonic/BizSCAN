// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_layout.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DashboardLayout _$DashboardLayoutFromJson(Map<String, dynamic> json) {
  return _DashboardLayout.fromJson(json);
}

/// @nodoc
mixin _$DashboardLayout {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get visibleWidgetIds => throw _privateConstructorUsedError;
  int get gridColumns => throw _privateConstructorUsedError;
  int get refreshRateMs => throw _privateConstructorUsedError; // 30 FPS default
  bool get isDefault => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this DashboardLayout to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardLayout
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardLayoutCopyWith<DashboardLayout> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardLayoutCopyWith<$Res> {
  factory $DashboardLayoutCopyWith(
    DashboardLayout value,
    $Res Function(DashboardLayout) then,
  ) = _$DashboardLayoutCopyWithImpl<$Res, DashboardLayout>;
  @useResult
  $Res call({
    String id,
    String name,
    List<String> visibleWidgetIds,
    int gridColumns,
    int refreshRateMs,
    bool isDefault,
    DateTime createdAt,
  });
}

/// @nodoc
class _$DashboardLayoutCopyWithImpl<$Res, $Val extends DashboardLayout>
    implements $DashboardLayoutCopyWith<$Res> {
  _$DashboardLayoutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardLayout
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? visibleWidgetIds = null,
    Object? gridColumns = null,
    Object? refreshRateMs = null,
    Object? isDefault = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            visibleWidgetIds:
                null == visibleWidgetIds
                    ? _value.visibleWidgetIds
                    : visibleWidgetIds // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            gridColumns:
                null == gridColumns
                    ? _value.gridColumns
                    : gridColumns // ignore: cast_nullable_to_non_nullable
                        as int,
            refreshRateMs:
                null == refreshRateMs
                    ? _value.refreshRateMs
                    : refreshRateMs // ignore: cast_nullable_to_non_nullable
                        as int,
            isDefault:
                null == isDefault
                    ? _value.isDefault
                    : isDefault // ignore: cast_nullable_to_non_nullable
                        as bool,
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
abstract class _$$DashboardLayoutImplCopyWith<$Res>
    implements $DashboardLayoutCopyWith<$Res> {
  factory _$$DashboardLayoutImplCopyWith(
    _$DashboardLayoutImpl value,
    $Res Function(_$DashboardLayoutImpl) then,
  ) = __$$DashboardLayoutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    List<String> visibleWidgetIds,
    int gridColumns,
    int refreshRateMs,
    bool isDefault,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$DashboardLayoutImplCopyWithImpl<$Res>
    extends _$DashboardLayoutCopyWithImpl<$Res, _$DashboardLayoutImpl>
    implements _$$DashboardLayoutImplCopyWith<$Res> {
  __$$DashboardLayoutImplCopyWithImpl(
    _$DashboardLayoutImpl _value,
    $Res Function(_$DashboardLayoutImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DashboardLayout
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? visibleWidgetIds = null,
    Object? gridColumns = null,
    Object? refreshRateMs = null,
    Object? isDefault = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$DashboardLayoutImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        visibleWidgetIds:
            null == visibleWidgetIds
                ? _value._visibleWidgetIds
                : visibleWidgetIds // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        gridColumns:
            null == gridColumns
                ? _value.gridColumns
                : gridColumns // ignore: cast_nullable_to_non_nullable
                    as int,
        refreshRateMs:
            null == refreshRateMs
                ? _value.refreshRateMs
                : refreshRateMs // ignore: cast_nullable_to_non_nullable
                    as int,
        isDefault:
            null == isDefault
                ? _value.isDefault
                : isDefault // ignore: cast_nullable_to_non_nullable
                    as bool,
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
class _$DashboardLayoutImpl implements _DashboardLayout {
  const _$DashboardLayoutImpl({
    required this.id,
    required this.name,
    final List<String> visibleWidgetIds = const [],
    this.gridColumns = 2,
    this.refreshRateMs = 33,
    this.isDefault = false,
    required this.createdAt,
  }) : _visibleWidgetIds = visibleWidgetIds;

  factory _$DashboardLayoutImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardLayoutImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final List<String> _visibleWidgetIds;
  @override
  @JsonKey()
  List<String> get visibleWidgetIds {
    if (_visibleWidgetIds is EqualUnmodifiableListView)
      return _visibleWidgetIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_visibleWidgetIds);
  }

  @override
  @JsonKey()
  final int gridColumns;
  @override
  @JsonKey()
  final int refreshRateMs;
  // 30 FPS default
  @override
  @JsonKey()
  final bool isDefault;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'DashboardLayout(id: $id, name: $name, visibleWidgetIds: $visibleWidgetIds, gridColumns: $gridColumns, refreshRateMs: $refreshRateMs, isDefault: $isDefault, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardLayoutImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(
              other._visibleWidgetIds,
              _visibleWidgetIds,
            ) &&
            (identical(other.gridColumns, gridColumns) ||
                other.gridColumns == gridColumns) &&
            (identical(other.refreshRateMs, refreshRateMs) ||
                other.refreshRateMs == refreshRateMs) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    const DeepCollectionEquality().hash(_visibleWidgetIds),
    gridColumns,
    refreshRateMs,
    isDefault,
    createdAt,
  );

  /// Create a copy of DashboardLayout
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardLayoutImplCopyWith<_$DashboardLayoutImpl> get copyWith =>
      __$$DashboardLayoutImplCopyWithImpl<_$DashboardLayoutImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardLayoutImplToJson(this);
  }
}

abstract class _DashboardLayout implements DashboardLayout {
  const factory _DashboardLayout({
    required final String id,
    required final String name,
    final List<String> visibleWidgetIds,
    final int gridColumns,
    final int refreshRateMs,
    final bool isDefault,
    required final DateTime createdAt,
  }) = _$DashboardLayoutImpl;

  factory _DashboardLayout.fromJson(Map<String, dynamic> json) =
      _$DashboardLayoutImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  List<String> get visibleWidgetIds;
  @override
  int get gridColumns;
  @override
  int get refreshRateMs; // 30 FPS default
  @override
  bool get isDefault;
  @override
  DateTime get createdAt;

  /// Create a copy of DashboardLayout
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardLayoutImplCopyWith<_$DashboardLayoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
