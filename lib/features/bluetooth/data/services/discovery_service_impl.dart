import 'dart:async';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/result.dart';
import '../../domain/models/bluetooth_device_model.dart';
import '../../domain/services/bluetooth_discovery_service.dart';

class BluetoothDiscoveryServiceImpl implements BluetoothDiscoveryService {
  final FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;
  StreamSubscription<BluetoothDiscoveryResult>? _subscription;
  final Map<String, BluetoothDeviceModel> _discoveredMap = {};
  final StreamController<List<BluetoothDeviceModel>> _streamController = StreamController<List<BluetoothDeviceModel>>.broadcast();
  bool _isDiscovering = false;

  @override
  bool isDiscovering() => _isDiscovering;

  @override
  List<BluetoothDeviceModel> get currentDevices => _sortedDevices();

  @override
  Stream<List<BluetoothDeviceModel>> get discoveryStream => _streamController.stream;

  @override
  Future<Result<void>> startDiscovery() async {
    try {
      await stopDiscovery();
      _discoveredMap.clear();
      _isDiscovering = true;

      // Add bonded/paired devices first
      final bondedDevices = await _bluetooth.getBondedDevices();
      for (final dev in bondedDevices) {
        final model = BluetoothDeviceModel(
          id: dev.address,
          name: dev.name ?? 'OBD-II Adapter (${dev.address.substring(0, 5)})',
          address: dev.address,
          bondState: dev.isBonded ? 'bonded' : 'none',
          isPaired: dev.isBonded,
          isConnected: dev.isConnected,
          deviceType: dev.type.stringValue,
          lastSeen: DateTime.now(),
        );
        _discoveredMap[dev.address] = model;
      }
      _streamController.add(_sortedDevices());

      _subscription = _bluetooth.startDiscovery().listen((result) {
        final dev = result.device;
        final model = BluetoothDeviceModel(
          id: dev.address,
          name: dev.name ?? 'OBD Device (${dev.address.substring(0, 5)})',
          address: dev.address,
          bondState: dev.isBonded ? 'bonded' : 'none',
          rssi: result.rssi,
          isPaired: dev.isBonded,
          isConnected: dev.isConnected,
          deviceType: dev.type.stringValue,
          lastSeen: DateTime.now(),
        );

        _discoveredMap[dev.address] = model;
        _streamController.add(_sortedDevices());
      }, onDone: () {
        _isDiscovering = false;
      }, onError: (e) {
        _isDiscovering = false;
      });

      return const Result.success(null);
    } catch (e) {
      _isDiscovering = false;
      return Result.failure(BluetoothFailure('Discovery failed: $e'));
    }
  }

  @override
  Future<Result<void>> stopDiscovery() async {
    _isDiscovering = false;
    await _subscription?.cancel();
    _subscription = null;
    try {
      await _bluetooth.cancelDiscovery();
    } catch (_) {}
    return const Result.success(null);
  }

  List<BluetoothDeviceModel> _sortedDevices() {
    final list = _discoveredMap.values.toList();
    list.sort((a, b) {
      // Bonded devices first
      if (a.isPaired && !b.isPaired) return -1;
      if (!a.isPaired && b.isPaired) return 1;
      // Sort by RSSI
      return b.rssi.compareTo(a.rssi);
    });
    return list;
  }
}
