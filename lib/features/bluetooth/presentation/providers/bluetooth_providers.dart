import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/di_service.dart';
import '../../domain/services/bluetooth_permission_service.dart';
import '../../domain/services/bluetooth_state_monitor.dart';
import '../../domain/services/bluetooth_discovery_service.dart';
import '../../domain/services/bluetooth_connection_service.dart';
import '../../domain/services/bluetooth_auto_reconnect_service.dart';
import '../../domain/repositories/bluetooth_device_repository.dart';
import '../controllers/bluetooth_scanner_controller.dart';

final bluetoothPermissionServiceProvider = Provider<BluetoothPermissionService>((ref) {
  return sl<BluetoothPermissionService>();
});

final bluetoothStateMonitorProvider = Provider<BluetoothStateMonitor>((ref) {
  return sl<BluetoothStateMonitor>();
});

final bluetoothDiscoveryServiceProvider = Provider<BluetoothDiscoveryService>((ref) {
  return sl<BluetoothDiscoveryService>();
});

final bluetoothConnectionServiceProvider = Provider<BluetoothConnectionService>((ref) {
  return sl<BluetoothConnectionService>();
});

final bluetoothAutoReconnectServiceProvider = Provider<BluetoothAutoReconnectService>((ref) {
  return sl<BluetoothAutoReconnectService>();
});

final bluetoothDeviceRepositoryProvider = Provider<BluetoothDeviceRepository>((ref) {
  return sl<BluetoothDeviceRepository>();
});

final bluetoothScannerControllerProvider =
    StateNotifierProvider<BluetoothScannerController, BluetoothScannerState>((ref) {
  return BluetoothScannerController(
    ref.watch(bluetoothPermissionServiceProvider),
    ref.watch(bluetoothStateMonitorProvider),
    ref.watch(bluetoothDiscoveryServiceProvider),
    ref.watch(bluetoothConnectionServiceProvider),
    ref.watch(bluetoothDeviceRepositoryProvider),
  );
});
