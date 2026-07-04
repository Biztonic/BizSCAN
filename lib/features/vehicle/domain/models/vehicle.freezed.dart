// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Vehicle _$VehicleFromJson(Map<String, dynamic> json) {
  return _Vehicle.fromJson(json);
}

/// @nodoc
mixin _$Vehicle {
  String get vehicleId => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String get manufacturer => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  String get fuelType => throw _privateConstructorUsedError;
  double get engineCapacity => throw _privateConstructorUsedError;
  String get vin => throw _privateConstructorUsedError;
  String get registrationNumber => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Vehicle to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleCopyWith<Vehicle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleCopyWith<$Res> {
  factory $VehicleCopyWith(Vehicle value, $Res Function(Vehicle) then) =
      _$VehicleCopyWithImpl<$Res, Vehicle>;
  @useResult
  $Res call({
    String vehicleId,
    String ownerId,
    String nickname,
    String manufacturer,
    String model,
    int year,
    String fuelType,
    double engineCapacity,
    String vin,
    String registrationNumber,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$VehicleCopyWithImpl<$Res, $Val extends Vehicle>
    implements $VehicleCopyWith<$Res> {
  _$VehicleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleId = null,
    Object? ownerId = null,
    Object? nickname = null,
    Object? manufacturer = null,
    Object? model = null,
    Object? year = null,
    Object? fuelType = null,
    Object? engineCapacity = null,
    Object? vin = null,
    Object? registrationNumber = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            vehicleId:
                null == vehicleId
                    ? _value.vehicleId
                    : vehicleId // ignore: cast_nullable_to_non_nullable
                        as String,
            ownerId:
                null == ownerId
                    ? _value.ownerId
                    : ownerId // ignore: cast_nullable_to_non_nullable
                        as String,
            nickname:
                null == nickname
                    ? _value.nickname
                    : nickname // ignore: cast_nullable_to_non_nullable
                        as String,
            manufacturer:
                null == manufacturer
                    ? _value.manufacturer
                    : manufacturer // ignore: cast_nullable_to_non_nullable
                        as String,
            model:
                null == model
                    ? _value.model
                    : model // ignore: cast_nullable_to_non_nullable
                        as String,
            year:
                null == year
                    ? _value.year
                    : year // ignore: cast_nullable_to_non_nullable
                        as int,
            fuelType:
                null == fuelType
                    ? _value.fuelType
                    : fuelType // ignore: cast_nullable_to_non_nullable
                        as String,
            engineCapacity:
                null == engineCapacity
                    ? _value.engineCapacity
                    : engineCapacity // ignore: cast_nullable_to_non_nullable
                        as double,
            vin:
                null == vin
                    ? _value.vin
                    : vin // ignore: cast_nullable_to_non_nullable
                        as String,
            registrationNumber:
                null == registrationNumber
                    ? _value.registrationNumber
                    : registrationNumber // ignore: cast_nullable_to_non_nullable
                        as String,
            createdAt:
                null == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            updatedAt:
                null == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VehicleImplCopyWith<$Res> implements $VehicleCopyWith<$Res> {
  factory _$$VehicleImplCopyWith(
    _$VehicleImpl value,
    $Res Function(_$VehicleImpl) then,
  ) = __$$VehicleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String vehicleId,
    String ownerId,
    String nickname,
    String manufacturer,
    String model,
    int year,
    String fuelType,
    double engineCapacity,
    String vin,
    String registrationNumber,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$VehicleImplCopyWithImpl<$Res>
    extends _$VehicleCopyWithImpl<$Res, _$VehicleImpl>
    implements _$$VehicleImplCopyWith<$Res> {
  __$$VehicleImplCopyWithImpl(
    _$VehicleImpl _value,
    $Res Function(_$VehicleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleId = null,
    Object? ownerId = null,
    Object? nickname = null,
    Object? manufacturer = null,
    Object? model = null,
    Object? year = null,
    Object? fuelType = null,
    Object? engineCapacity = null,
    Object? vin = null,
    Object? registrationNumber = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$VehicleImpl(
        vehicleId:
            null == vehicleId
                ? _value.vehicleId
                : vehicleId // ignore: cast_nullable_to_non_nullable
                    as String,
        ownerId:
            null == ownerId
                ? _value.ownerId
                : ownerId // ignore: cast_nullable_to_non_nullable
                    as String,
        nickname:
            null == nickname
                ? _value.nickname
                : nickname // ignore: cast_nullable_to_non_nullable
                    as String,
        manufacturer:
            null == manufacturer
                ? _value.manufacturer
                : manufacturer // ignore: cast_nullable_to_non_nullable
                    as String,
        model:
            null == model
                ? _value.model
                : model // ignore: cast_nullable_to_non_nullable
                    as String,
        year:
            null == year
                ? _value.year
                : year // ignore: cast_nullable_to_non_nullable
                    as int,
        fuelType:
            null == fuelType
                ? _value.fuelType
                : fuelType // ignore: cast_nullable_to_non_nullable
                    as String,
        engineCapacity:
            null == engineCapacity
                ? _value.engineCapacity
                : engineCapacity // ignore: cast_nullable_to_non_nullable
                    as double,
        vin:
            null == vin
                ? _value.vin
                : vin // ignore: cast_nullable_to_non_nullable
                    as String,
        registrationNumber:
            null == registrationNumber
                ? _value.registrationNumber
                : registrationNumber // ignore: cast_nullable_to_non_nullable
                    as String,
        createdAt:
            null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        updatedAt:
            null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleImpl implements _Vehicle {
  const _$VehicleImpl({
    required this.vehicleId,
    required this.ownerId,
    required this.nickname,
    required this.manufacturer,
    required this.model,
    required this.year,
    required this.fuelType,
    required this.engineCapacity,
    required this.vin,
    required this.registrationNumber,
    required this.createdAt,
    required this.updatedAt,
  });

  factory _$VehicleImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleImplFromJson(json);

  @override
  final String vehicleId;
  @override
  final String ownerId;
  @override
  final String nickname;
  @override
  final String manufacturer;
  @override
  final String model;
  @override
  final int year;
  @override
  final String fuelType;
  @override
  final double engineCapacity;
  @override
  final String vin;
  @override
  final String registrationNumber;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Vehicle(vehicleId: $vehicleId, ownerId: $ownerId, nickname: $nickname, manufacturer: $manufacturer, model: $model, year: $year, fuelType: $fuelType, engineCapacity: $engineCapacity, vin: $vin, registrationNumber: $registrationNumber, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleImpl &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.manufacturer, manufacturer) ||
                other.manufacturer == manufacturer) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.fuelType, fuelType) ||
                other.fuelType == fuelType) &&
            (identical(other.engineCapacity, engineCapacity) ||
                other.engineCapacity == engineCapacity) &&
            (identical(other.vin, vin) || other.vin == vin) &&
            (identical(other.registrationNumber, registrationNumber) ||
                other.registrationNumber == registrationNumber) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    vehicleId,
    ownerId,
    nickname,
    manufacturer,
    model,
    year,
    fuelType,
    engineCapacity,
    vin,
    registrationNumber,
    createdAt,
    updatedAt,
  );

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleImplCopyWith<_$VehicleImpl> get copyWith =>
      __$$VehicleImplCopyWithImpl<_$VehicleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleImplToJson(this);
  }
}

abstract class _Vehicle implements Vehicle {
  const factory _Vehicle({
    required final String vehicleId,
    required final String ownerId,
    required final String nickname,
    required final String manufacturer,
    required final String model,
    required final int year,
    required final String fuelType,
    required final double engineCapacity,
    required final String vin,
    required final String registrationNumber,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$VehicleImpl;

  factory _Vehicle.fromJson(Map<String, dynamic> json) = _$VehicleImpl.fromJson;

  @override
  String get vehicleId;
  @override
  String get ownerId;
  @override
  String get nickname;
  @override
  String get manufacturer;
  @override
  String get model;
  @override
  int get year;
  @override
  String get fuelType;
  @override
  double get engineCapacity;
  @override
  String get vin;
  @override
  String get registrationNumber;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleImplCopyWith<_$VehicleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
