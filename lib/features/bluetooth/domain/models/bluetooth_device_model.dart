import 'package:freezed_annotation/freezed_annotation.dart';

part 'bluetooth_device_model.freezed.dart';
part 'bluetooth_device_model.g.dart';

@freezed
class BluetoothDeviceModel with _$BluetoothDeviceModel {
  const factory BluetoothDeviceModel({
    required String id,
    required String name,
    required String address,
    @Default('none') String bondState, // 'bonded', 'bonding', 'none'
    @Default(0) int rssi,
    @Default(false) bool isConnected,
    @Default(false) bool isPaired,
    @Default('CLASSIC') String deviceType, // 'CLASSIC', 'LE', 'DUAL', 'UNKNOWN'
    required DateTime lastSeen,
  }) = _BluetoothDeviceModel;

  factory BluetoothDeviceModel.fromJson(Map<String, dynamic> json) =>
      _$BluetoothDeviceModelFromJson(json);
}
