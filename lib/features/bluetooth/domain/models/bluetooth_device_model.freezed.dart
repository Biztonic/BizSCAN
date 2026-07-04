// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bluetooth_device_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BluetoothDeviceModel _$BluetoothDeviceModelFromJson(Map<String, dynamic> json) {
  return _BluetoothDeviceModel.fromJson(json);
}

/// @nodoc
mixin _$BluetoothDeviceModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get bondState =>
      throw _privateConstructorUsedError; // 'bonded', 'bonding', 'none'
  int get rssi => throw _privateConstructorUsedError;
  bool get isConnected => throw _privateConstructorUsedError;
  bool get isPaired => throw _privateConstructorUsedError;
  String get deviceType =>
      throw _privateConstructorUsedError; // 'CLASSIC', 'LE', 'DUAL', 'UNKNOWN'
  DateTime get lastSeen => throw _privateConstructorUsedError;

  /// Serializes this BluetoothDeviceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BluetoothDeviceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BluetoothDeviceModelCopyWith<BluetoothDeviceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BluetoothDeviceModelCopyWith<$Res> {
  factory $BluetoothDeviceModelCopyWith(
    BluetoothDeviceModel value,
    $Res Function(BluetoothDeviceModel) then,
  ) = _$BluetoothDeviceModelCopyWithImpl<$Res, BluetoothDeviceModel>;
  @useResult
  $Res call({
    String id,
    String name,
    String address,
    String bondState,
    int rssi,
    bool isConnected,
    bool isPaired,
    String deviceType,
    DateTime lastSeen,
  });
}

/// @nodoc
class _$BluetoothDeviceModelCopyWithImpl<
  $Res,
  $Val extends BluetoothDeviceModel
>
    implements $BluetoothDeviceModelCopyWith<$Res> {
  _$BluetoothDeviceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BluetoothDeviceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? bondState = null,
    Object? rssi = null,
    Object? isConnected = null,
    Object? isPaired = null,
    Object? deviceType = null,
    Object? lastSeen = null,
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
            address:
                null == address
                    ? _value.address
                    : address // ignore: cast_nullable_to_non_nullable
                        as String,
            bondState:
                null == bondState
                    ? _value.bondState
                    : bondState // ignore: cast_nullable_to_non_nullable
                        as String,
            rssi:
                null == rssi
                    ? _value.rssi
                    : rssi // ignore: cast_nullable_to_non_nullable
                        as int,
            isConnected:
                null == isConnected
                    ? _value.isConnected
                    : isConnected // ignore: cast_nullable_to_non_nullable
                        as bool,
            isPaired:
                null == isPaired
                    ? _value.isPaired
                    : isPaired // ignore: cast_nullable_to_non_nullable
                        as bool,
            deviceType:
                null == deviceType
                    ? _value.deviceType
                    : deviceType // ignore: cast_nullable_to_non_nullable
                        as String,
            lastSeen:
                null == lastSeen
                    ? _value.lastSeen
                    : lastSeen // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BluetoothDeviceModelImplCopyWith<$Res>
    implements $BluetoothDeviceModelCopyWith<$Res> {
  factory _$$BluetoothDeviceModelImplCopyWith(
    _$BluetoothDeviceModelImpl value,
    $Res Function(_$BluetoothDeviceModelImpl) then,
  ) = __$$BluetoothDeviceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String address,
    String bondState,
    int rssi,
    bool isConnected,
    bool isPaired,
    String deviceType,
    DateTime lastSeen,
  });
}

/// @nodoc
class __$$BluetoothDeviceModelImplCopyWithImpl<$Res>
    extends _$BluetoothDeviceModelCopyWithImpl<$Res, _$BluetoothDeviceModelImpl>
    implements _$$BluetoothDeviceModelImplCopyWith<$Res> {
  __$$BluetoothDeviceModelImplCopyWithImpl(
    _$BluetoothDeviceModelImpl _value,
    $Res Function(_$BluetoothDeviceModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BluetoothDeviceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? bondState = null,
    Object? rssi = null,
    Object? isConnected = null,
    Object? isPaired = null,
    Object? deviceType = null,
    Object? lastSeen = null,
  }) {
    return _then(
      _$BluetoothDeviceModelImpl(
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
        address:
            null == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                    as String,
        bondState:
            null == bondState
                ? _value.bondState
                : bondState // ignore: cast_nullable_to_non_nullable
                    as String,
        rssi:
            null == rssi
                ? _value.rssi
                : rssi // ignore: cast_nullable_to_non_nullable
                    as int,
        isConnected:
            null == isConnected
                ? _value.isConnected
                : isConnected // ignore: cast_nullable_to_non_nullable
                    as bool,
        isPaired:
            null == isPaired
                ? _value.isPaired
                : isPaired // ignore: cast_nullable_to_non_nullable
                    as bool,
        deviceType:
            null == deviceType
                ? _value.deviceType
                : deviceType // ignore: cast_nullable_to_non_nullable
                    as String,
        lastSeen:
            null == lastSeen
                ? _value.lastSeen
                : lastSeen // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BluetoothDeviceModelImpl implements _BluetoothDeviceModel {
  const _$BluetoothDeviceModelImpl({
    required this.id,
    required this.name,
    required this.address,
    this.bondState = 'none',
    this.rssi = 0,
    this.isConnected = false,
    this.isPaired = false,
    this.deviceType = 'CLASSIC',
    required this.lastSeen,
  });

  factory _$BluetoothDeviceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BluetoothDeviceModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String address;
  @override
  @JsonKey()
  final String bondState;
  // 'bonded', 'bonding', 'none'
  @override
  @JsonKey()
  final int rssi;
  @override
  @JsonKey()
  final bool isConnected;
  @override
  @JsonKey()
  final bool isPaired;
  @override
  @JsonKey()
  final String deviceType;
  // 'CLASSIC', 'LE', 'DUAL', 'UNKNOWN'
  @override
  final DateTime lastSeen;

  @override
  String toString() {
    return 'BluetoothDeviceModel(id: $id, name: $name, address: $address, bondState: $bondState, rssi: $rssi, isConnected: $isConnected, isPaired: $isPaired, deviceType: $deviceType, lastSeen: $lastSeen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BluetoothDeviceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.bondState, bondState) ||
                other.bondState == bondState) &&
            (identical(other.rssi, rssi) || other.rssi == rssi) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected) &&
            (identical(other.isPaired, isPaired) ||
                other.isPaired == isPaired) &&
            (identical(other.deviceType, deviceType) ||
                other.deviceType == deviceType) &&
            (identical(other.lastSeen, lastSeen) ||
                other.lastSeen == lastSeen));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    address,
    bondState,
    rssi,
    isConnected,
    isPaired,
    deviceType,
    lastSeen,
  );

  /// Create a copy of BluetoothDeviceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BluetoothDeviceModelImplCopyWith<_$BluetoothDeviceModelImpl>
  get copyWith =>
      __$$BluetoothDeviceModelImplCopyWithImpl<_$BluetoothDeviceModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BluetoothDeviceModelImplToJson(this);
  }
}

abstract class _BluetoothDeviceModel implements BluetoothDeviceModel {
  const factory _BluetoothDeviceModel({
    required final String id,
    required final String name,
    required final String address,
    final String bondState,
    final int rssi,
    final bool isConnected,
    final bool isPaired,
    final String deviceType,
    required final DateTime lastSeen,
  }) = _$BluetoothDeviceModelImpl;

  factory _BluetoothDeviceModel.fromJson(Map<String, dynamic> json) =
      _$BluetoothDeviceModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get address;
  @override
  String get bondState; // 'bonded', 'bonding', 'none'
  @override
  int get rssi;
  @override
  bool get isConnected;
  @override
  bool get isPaired;
  @override
  String get deviceType; // 'CLASSIC', 'LE', 'DUAL', 'UNKNOWN'
  @override
  DateTime get lastSeen;

  /// Create a copy of BluetoothDeviceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BluetoothDeviceModelImplCopyWith<_$BluetoothDeviceModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
