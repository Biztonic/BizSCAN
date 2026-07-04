import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/services/di_service.dart';
import '../../../../core/utils/bluetooth_helper.dart';
import '../../domain/repositories/bluetooth_repository.dart';

part 'bluetooth_provider.g.dart';

@riverpod
class BluetoothStateNotifier extends _$BluetoothStateNotifier {
  late final BluetoothRepository _repository;

  @override
  Stream<AppBluetoothState> build() {
    _repository = sl<BluetoothRepository>();
    return _repository.connectionState;
  }

  Future<List<BluetoothDeviceContract>> scanDevices() {
    return _repository.discoverDevices();
  }

  Future<bool> connect(String address) {
    return _repository.connectDevice(address);
  }

  Future<void> disconnect() {
    return _repository.disconnectDevice();
  }
}
