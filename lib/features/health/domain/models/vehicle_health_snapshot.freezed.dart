// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_health_snapshot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VehicleHealthSnapshot _$VehicleHealthSnapshotFromJson(
  Map<String, dynamic> json,
) {
  return _VehicleHealthSnapshot.fromJson(json);
}

/// @nodoc
mixin _$VehicleHealthSnapshot {
  Map<String, dynamic> get liveSensors =>
      throw _privateConstructorUsedError; // e.g. {'RPM': 750, 'COOLANT_TEMP': 85, 'BATTERY_VOLTAGE': 12.6, 'FUEL_TRIM': 2.5}
  List<String> get dtcs =>
      throw _privateConstructorUsedError; // e.g. ['P0171', 'P0300']
  Map<String, bool> get readiness => throw _privateConstructorUsedError;
  Map<String, dynamic> get freezeFrame => throw _privateConstructorUsedError;
  VehicleHealthScore get score => throw _privateConstructorUsedError;
  List<HealthAlert> get alerts => throw _privateConstructorUsedError;
  List<MaintenanceRecommendation> get recommendations =>
      throw _privateConstructorUsedError;
  DateTime get snapshotAt => throw _privateConstructorUsedError;

  /// Serializes this VehicleHealthSnapshot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleHealthSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleHealthSnapshotCopyWith<VehicleHealthSnapshot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleHealthSnapshotCopyWith<$Res> {
  factory $VehicleHealthSnapshotCopyWith(
    VehicleHealthSnapshot value,
    $Res Function(VehicleHealthSnapshot) then,
  ) = _$VehicleHealthSnapshotCopyWithImpl<$Res, VehicleHealthSnapshot>;
  @useResult
  $Res call({
    Map<String, dynamic> liveSensors,
    List<String> dtcs,
    Map<String, bool> readiness,
    Map<String, dynamic> freezeFrame,
    VehicleHealthScore score,
    List<HealthAlert> alerts,
    List<MaintenanceRecommendation> recommendations,
    DateTime snapshotAt,
  });

  $VehicleHealthScoreCopyWith<$Res> get score;
}

/// @nodoc
class _$VehicleHealthSnapshotCopyWithImpl<
  $Res,
  $Val extends VehicleHealthSnapshot
>
    implements $VehicleHealthSnapshotCopyWith<$Res> {
  _$VehicleHealthSnapshotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleHealthSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? liveSensors = null,
    Object? dtcs = null,
    Object? readiness = null,
    Object? freezeFrame = null,
    Object? score = null,
    Object? alerts = null,
    Object? recommendations = null,
    Object? snapshotAt = null,
  }) {
    return _then(
      _value.copyWith(
            liveSensors:
                null == liveSensors
                    ? _value.liveSensors
                    : liveSensors // ignore: cast_nullable_to_non_nullable
                        as Map<String, dynamic>,
            dtcs:
                null == dtcs
                    ? _value.dtcs
                    : dtcs // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            readiness:
                null == readiness
                    ? _value.readiness
                    : readiness // ignore: cast_nullable_to_non_nullable
                        as Map<String, bool>,
            freezeFrame:
                null == freezeFrame
                    ? _value.freezeFrame
                    : freezeFrame // ignore: cast_nullable_to_non_nullable
                        as Map<String, dynamic>,
            score:
                null == score
                    ? _value.score
                    : score // ignore: cast_nullable_to_non_nullable
                        as VehicleHealthScore,
            alerts:
                null == alerts
                    ? _value.alerts
                    : alerts // ignore: cast_nullable_to_non_nullable
                        as List<HealthAlert>,
            recommendations:
                null == recommendations
                    ? _value.recommendations
                    : recommendations // ignore: cast_nullable_to_non_nullable
                        as List<MaintenanceRecommendation>,
            snapshotAt:
                null == snapshotAt
                    ? _value.snapshotAt
                    : snapshotAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }

  /// Create a copy of VehicleHealthSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VehicleHealthScoreCopyWith<$Res> get score {
    return $VehicleHealthScoreCopyWith<$Res>(_value.score, (value) {
      return _then(_value.copyWith(score: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VehicleHealthSnapshotImplCopyWith<$Res>
    implements $VehicleHealthSnapshotCopyWith<$Res> {
  factory _$$VehicleHealthSnapshotImplCopyWith(
    _$VehicleHealthSnapshotImpl value,
    $Res Function(_$VehicleHealthSnapshotImpl) then,
  ) = __$$VehicleHealthSnapshotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Map<String, dynamic> liveSensors,
    List<String> dtcs,
    Map<String, bool> readiness,
    Map<String, dynamic> freezeFrame,
    VehicleHealthScore score,
    List<HealthAlert> alerts,
    List<MaintenanceRecommendation> recommendations,
    DateTime snapshotAt,
  });

  @override
  $VehicleHealthScoreCopyWith<$Res> get score;
}

/// @nodoc
class __$$VehicleHealthSnapshotImplCopyWithImpl<$Res>
    extends
        _$VehicleHealthSnapshotCopyWithImpl<$Res, _$VehicleHealthSnapshotImpl>
    implements _$$VehicleHealthSnapshotImplCopyWith<$Res> {
  __$$VehicleHealthSnapshotImplCopyWithImpl(
    _$VehicleHealthSnapshotImpl _value,
    $Res Function(_$VehicleHealthSnapshotImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VehicleHealthSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? liveSensors = null,
    Object? dtcs = null,
    Object? readiness = null,
    Object? freezeFrame = null,
    Object? score = null,
    Object? alerts = null,
    Object? recommendations = null,
    Object? snapshotAt = null,
  }) {
    return _then(
      _$VehicleHealthSnapshotImpl(
        liveSensors:
            null == liveSensors
                ? _value._liveSensors
                : liveSensors // ignore: cast_nullable_to_non_nullable
                    as Map<String, dynamic>,
        dtcs:
            null == dtcs
                ? _value._dtcs
                : dtcs // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        readiness:
            null == readiness
                ? _value._readiness
                : readiness // ignore: cast_nullable_to_non_nullable
                    as Map<String, bool>,
        freezeFrame:
            null == freezeFrame
                ? _value._freezeFrame
                : freezeFrame // ignore: cast_nullable_to_non_nullable
                    as Map<String, dynamic>,
        score:
            null == score
                ? _value.score
                : score // ignore: cast_nullable_to_non_nullable
                    as VehicleHealthScore,
        alerts:
            null == alerts
                ? _value._alerts
                : alerts // ignore: cast_nullable_to_non_nullable
                    as List<HealthAlert>,
        recommendations:
            null == recommendations
                ? _value._recommendations
                : recommendations // ignore: cast_nullable_to_non_nullable
                    as List<MaintenanceRecommendation>,
        snapshotAt:
            null == snapshotAt
                ? _value.snapshotAt
                : snapshotAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleHealthSnapshotImpl implements _VehicleHealthSnapshot {
  const _$VehicleHealthSnapshotImpl({
    required final Map<String, dynamic> liveSensors,
    final List<String> dtcs = const [],
    final Map<String, bool> readiness = const {},
    final Map<String, dynamic> freezeFrame = const {},
    required this.score,
    final List<HealthAlert> alerts = const [],
    final List<MaintenanceRecommendation> recommendations = const [],
    required this.snapshotAt,
  }) : _liveSensors = liveSensors,
       _dtcs = dtcs,
       _readiness = readiness,
       _freezeFrame = freezeFrame,
       _alerts = alerts,
       _recommendations = recommendations;

  factory _$VehicleHealthSnapshotImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleHealthSnapshotImplFromJson(json);

  final Map<String, dynamic> _liveSensors;
  @override
  Map<String, dynamic> get liveSensors {
    if (_liveSensors is EqualUnmodifiableMapView) return _liveSensors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_liveSensors);
  }

  // e.g. {'RPM': 750, 'COOLANT_TEMP': 85, 'BATTERY_VOLTAGE': 12.6, 'FUEL_TRIM': 2.5}
  final List<String> _dtcs;
  // e.g. {'RPM': 750, 'COOLANT_TEMP': 85, 'BATTERY_VOLTAGE': 12.6, 'FUEL_TRIM': 2.5}
  @override
  @JsonKey()
  List<String> get dtcs {
    if (_dtcs is EqualUnmodifiableListView) return _dtcs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dtcs);
  }

  // e.g. ['P0171', 'P0300']
  final Map<String, bool> _readiness;
  // e.g. ['P0171', 'P0300']
  @override
  @JsonKey()
  Map<String, bool> get readiness {
    if (_readiness is EqualUnmodifiableMapView) return _readiness;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_readiness);
  }

  final Map<String, dynamic> _freezeFrame;
  @override
  @JsonKey()
  Map<String, dynamic> get freezeFrame {
    if (_freezeFrame is EqualUnmodifiableMapView) return _freezeFrame;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_freezeFrame);
  }

  @override
  final VehicleHealthScore score;
  final List<HealthAlert> _alerts;
  @override
  @JsonKey()
  List<HealthAlert> get alerts {
    if (_alerts is EqualUnmodifiableListView) return _alerts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_alerts);
  }

  final List<MaintenanceRecommendation> _recommendations;
  @override
  @JsonKey()
  List<MaintenanceRecommendation> get recommendations {
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendations);
  }

  @override
  final DateTime snapshotAt;

  @override
  String toString() {
    return 'VehicleHealthSnapshot(liveSensors: $liveSensors, dtcs: $dtcs, readiness: $readiness, freezeFrame: $freezeFrame, score: $score, alerts: $alerts, recommendations: $recommendations, snapshotAt: $snapshotAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleHealthSnapshotImpl &&
            const DeepCollectionEquality().equals(
              other._liveSensors,
              _liveSensors,
            ) &&
            const DeepCollectionEquality().equals(other._dtcs, _dtcs) &&
            const DeepCollectionEquality().equals(
              other._readiness,
              _readiness,
            ) &&
            const DeepCollectionEquality().equals(
              other._freezeFrame,
              _freezeFrame,
            ) &&
            (identical(other.score, score) || other.score == score) &&
            const DeepCollectionEquality().equals(other._alerts, _alerts) &&
            const DeepCollectionEquality().equals(
              other._recommendations,
              _recommendations,
            ) &&
            (identical(other.snapshotAt, snapshotAt) ||
                other.snapshotAt == snapshotAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_liveSensors),
    const DeepCollectionEquality().hash(_dtcs),
    const DeepCollectionEquality().hash(_readiness),
    const DeepCollectionEquality().hash(_freezeFrame),
    score,
    const DeepCollectionEquality().hash(_alerts),
    const DeepCollectionEquality().hash(_recommendations),
    snapshotAt,
  );

  /// Create a copy of VehicleHealthSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleHealthSnapshotImplCopyWith<_$VehicleHealthSnapshotImpl>
  get copyWith =>
      __$$VehicleHealthSnapshotImplCopyWithImpl<_$VehicleHealthSnapshotImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleHealthSnapshotImplToJson(this);
  }
}

abstract class _VehicleHealthSnapshot implements VehicleHealthSnapshot {
  const factory _VehicleHealthSnapshot({
    required final Map<String, dynamic> liveSensors,
    final List<String> dtcs,
    final Map<String, bool> readiness,
    final Map<String, dynamic> freezeFrame,
    required final VehicleHealthScore score,
    final List<HealthAlert> alerts,
    final List<MaintenanceRecommendation> recommendations,
    required final DateTime snapshotAt,
  }) = _$VehicleHealthSnapshotImpl;

  factory _VehicleHealthSnapshot.fromJson(Map<String, dynamic> json) =
      _$VehicleHealthSnapshotImpl.fromJson;

  @override
  Map<String, dynamic> get liveSensors; // e.g. {'RPM': 750, 'COOLANT_TEMP': 85, 'BATTERY_VOLTAGE': 12.6, 'FUEL_TRIM': 2.5}
  @override
  List<String> get dtcs; // e.g. ['P0171', 'P0300']
  @override
  Map<String, bool> get readiness;
  @override
  Map<String, dynamic> get freezeFrame;
  @override
  VehicleHealthScore get score;
  @override
  List<HealthAlert> get alerts;
  @override
  List<MaintenanceRecommendation> get recommendations;
  @override
  DateTime get snapshotAt;

  /// Create a copy of VehicleHealthSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleHealthSnapshotImplCopyWith<_$VehicleHealthSnapshotImpl>
  get copyWith => throw _privateConstructorUsedError;
}
