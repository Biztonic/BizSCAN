import '../../../../core/utils/bluetooth_helper.dart';

abstract class BluetoothRepository {
  Stream<AppBluetoothState> get connectionState;
  Future<List<BluetoothDeviceContract>> discoverDevices();
  Future<bool> connectDevice(String address);
  Future<void> disconnectDevice();
}
