import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bizscan/features/bluetooth/domain/models/bluetooth_device_model.dart';
import 'package:bizscan/features/bluetooth/data/repositories/bluetooth_device_repository_impl.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('BluetoothDeviceRepositoryImpl Unit Tests', () {
    late BluetoothDeviceRepositoryImpl repository;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();
      repository = BluetoothDeviceRepositoryImpl(prefs);
    });

    test('saveLastConnectedDevice and getLastConnectedDevice should persist device metadata', () async {
      final now = DateTime.now();
      final device = BluetoothDeviceModel(
        id: '00:11:22:33:44:55',
        name: 'V-GATE iCar Pro',
        address: '00:11:22:33:44:55',
        isPaired: true,
        lastSeen: now,
      );

      await repository.saveLastConnectedDevice(device);
      final loaded = await repository.getLastConnectedDevice();

      expect(loaded, isNotNull);
      expect(loaded!.address, '00:11:22:33:44:55');
      expect(loaded.name, 'V-GATE iCar Pro');
    });

    test('setAutoReconnectOption and getAutoReconnectOption', () async {
      expect(await repository.getAutoReconnectOption(), true); // default true
      await repository.setAutoReconnectOption(false);
      expect(await repository.getAutoReconnectOption(), false);
    });

    test('setConnectionTimeout and getConnectionTimeout', () async {
      expect(await repository.getConnectionTimeout(), 10); // default 10s
      await repository.setConnectionTimeout(15);
      expect(await repository.getConnectionTimeout(), 15);
    });
  });
}
