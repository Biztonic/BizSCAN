import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/features/bluetooth/domain/models/bluetooth_device_model.dart';
import 'package:bizscan/features/bluetooth/presentation/widgets/bluetooth_device_list.dart';
import 'package:bizscan/features/bluetooth/presentation/widgets/bluetooth_disabled_view.dart';
import 'package:bizscan/features/bluetooth/presentation/widgets/no_devices_view.dart';
import 'package:bizscan/features/bluetooth/presentation/widgets/permission_required_view.dart';

void main() {
  group('Bluetooth UI Widget Tests', () {
    testWidgets('BluetoothDisabledView renders disabled headline and check button', (tester) async {
      var refreshed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BluetoothDisabledView(
              onRefresh: () => refreshed = true,
            ),
          ),
        ),
      );

      expect(find.text('Bluetooth is Disabled'), findsOneWidget);
      expect(find.text('Check Status'), findsOneWidget);

      await tester.tap(find.text('Check Status'));
      expect(refreshed, true);
    });

    testWidgets('PermissionRequiredView renders grant button', (tester) async {
      var granted = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PermissionRequiredView(
              onRequestPermissions: () => granted = true,
            ),
          ),
        ),
      );

      expect(find.text('Permissions Required'), findsOneWidget);
      expect(find.text('Grant Permissions'), findsOneWidget);

      await tester.tap(find.text('Grant Permissions'));
      expect(granted, true);
    });

    testWidgets('NoDevicesView renders scan now CTA', (tester) async {
      var scanned = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NoDevicesView(
              onStartScan: () => scanned = true,
            ),
          ),
        ),
      );

      expect(find.text('No Devices Found'), findsOneWidget);
      expect(find.text('Scan Now'), findsOneWidget);

      await tester.tap(find.text('Scan Now'));
      expect(scanned, true);
    });

    testWidgets('BluetoothDeviceList renders device cards and badges', (tester) async {
      final now = DateTime.now();
      final devices = [
        BluetoothDeviceModel(
          id: '00:11:22:33:44:55',
          name: 'OBDII Scanner',
          address: '00:11:22:33:44:55',
          isPaired: true,
          rssi: -50,
          lastSeen: now,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BluetoothDeviceList(
              devices: devices,
              onDeviceTap: (_) {},
            ),
          ),
        ),
      );

      expect(find.text('OBDII Scanner'), findsOneWidget);
      expect(find.text('00:11:22:33:44:55'), findsOneWidget);
      expect(find.text('PAIRED'), findsOneWidget);
      expect(find.text('Connect'), findsOneWidget);
    });
  });
}
