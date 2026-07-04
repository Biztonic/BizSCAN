import '../../../../core/errors/result.dart';
import '../models/bluetooth_device_model.dart';

abstract class BluetoothDiscoveryService {
  Future<Result<void>> startDiscovery();
  Future<Result<void>> stopDiscovery();
  bool isDiscovering();
  Stream<List<BluetoothDeviceModel>> get discoveryStream;
  List<BluetoothDeviceModel> get currentDevices;
}
