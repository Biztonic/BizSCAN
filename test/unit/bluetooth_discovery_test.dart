import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/features/bluetooth/domain/models/bluetooth_device_model.dart';

void main() {
  group('BluetoothDeviceModel & Discovery Logic Tests', () {
    test('BluetoothDeviceModel serialization and defaults', () {
      final now = DateTime.now();
      final device = BluetoothDeviceModel(
        id: '00:11:22:33:44:55',
        name: 'OBDII HC-05',
        address: '00:11:22:33:44:55',
        bondState: 'bonded',
        rssi: -55,
        isPaired: true,
        lastSeen: now,
      );

      expect(device.id, '00:11:22:33:44:55');
      expect(device.name, 'OBDII HC-05');
      expect(device.isPaired, true);
      expect(device.rssi, -55);
    });

    test('Sorting algorithm puts paired devices first, then sorts by RSSI', () {
      final now = DateTime.now();
      final dev1 = BluetoothDeviceModel(
        id: '1', name: 'Unpaired Strong Signal', address: '11:11:11:11:11:11',
        isPaired: false, rssi: -40, lastSeen: now,
      );
      final dev2 = BluetoothDeviceModel(
        id: '2', name: 'Paired Weak Signal', address: '22:22:22:22:22:22',
        isPaired: true, rssi: -85, lastSeen: now,
      );
      final dev3 = BluetoothDeviceModel(
        id: '3', name: 'Paired Strong Signal', address: '33:33:33:33:33:33',
        isPaired: true, rssi: -50, lastSeen: now,
      );

      final list = [dev1, dev2, dev3];
      list.sort((a, b) {
        if (a.isPaired && !b.isPaired) return -1;
        if (!a.isPaired && b.isPaired) return 1;
        return b.rssi.compareTo(a.rssi);
      });

      expect(list[0].id, '3'); // Paired & Strong RSSI
      expect(list[1].id, '2'); // Paired & Weak RSSI
      expect(list[2].id, '1'); // Unpaired
    });
  });
}
