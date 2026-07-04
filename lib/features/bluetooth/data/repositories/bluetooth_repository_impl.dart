import 'dart:async';
import '../../../../core/utils/bluetooth_helper.dart';
import '../../domain/repositories/bluetooth_repository.dart';

class BluetoothRepositoryImpl implements BluetoothRepository {
  final _stateController = StreamController<AppBluetoothState>.broadcast();

  BluetoothRepositoryImpl() {
    _stateController.add(AppBluetoothState.off);
  }

  @override
  Stream<AppBluetoothState> get connectionState => _stateController.stream;

  @override
  Future<List<BluetoothDeviceContract>> discoverDevices() async {
    // Architecture placeholder: return empty list of devices
    return [];
  }

  @override
  Future<bool> connectDevice(String address) async {
    _stateController.add(AppBluetoothState.on);
    return true;
  }

  @override
  Future<void> disconnectDevice() async {
    _stateController.add(AppBluetoothState.off);
  }
}
