// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bluetooth_device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BluetoothDeviceModelImpl _$$BluetoothDeviceModelImplFromJson(
  Map<String, dynamic> json,
) => _$BluetoothDeviceModelImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  address: json['address'] as String,
  bondState: json['bondState'] as String? ?? 'none',
  rssi: (json['rssi'] as num?)?.toInt() ?? 0,
  isConnected: json['isConnected'] as bool? ?? false,
  isPaired: json['isPaired'] as bool? ?? false,
  deviceType: json['deviceType'] as String? ?? 'CLASSIC',
  lastSeen: DateTime.parse(json['lastSeen'] as String),
);

Map<String, dynamic> _$$BluetoothDeviceModelImplToJson(
  _$BluetoothDeviceModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'address': instance.address,
  'bondState': instance.bondState,
  'rssi': instance.rssi,
  'isConnected': instance.isConnected,
  'isPaired': instance.isPaired,
  'deviceType': instance.deviceType,
  'lastSeen': instance.lastSeen.toIso8601String(),
};
