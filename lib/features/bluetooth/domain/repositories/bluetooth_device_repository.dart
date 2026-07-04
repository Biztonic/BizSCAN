import '../models/bluetooth_device_model.dart';

abstract class BluetoothDeviceRepository {
  Future<void> saveLastConnectedDevice(BluetoothDeviceModel device);
  Future<BluetoothDeviceModel?> getLastConnectedDevice();
  Future<void> setAutoReconnectOption(bool enabled);
  Future<bool> getAutoReconnectOption();
  Future<void> setConnectionTimeout(int seconds);
  Future<int> getConnectionTimeout();
  Future<void> setPreferredDevice(String address);
  Future<String?> getPreferredDevice();
}
