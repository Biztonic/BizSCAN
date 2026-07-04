import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/bluetooth_device_model.dart';
import '../../domain/services/bluetooth_connection_service.dart';
import '../../domain/services/bluetooth_discovery_service.dart';
import '../../domain/services/bluetooth_permission_service.dart';
import '../../domain/services/bluetooth_state_monitor.dart';
import '../../domain/repositories/bluetooth_device_repository.dart';

class BluetoothScannerState {
  final bool isScanning;
  final bool isBluetoothEnabled;
  final bool hasPermission;
  final bool isConnected;
  final String? connectingAddress;
  final BluetoothDeviceModel? activeDevice;
  final List<BluetoothDeviceModel> devices;
  final String? errorMessage;

  const BluetoothScannerState({
    this.isScanning = false,
    this.isBluetoothEnabled = true,
    this.hasPermission = true,
    this.isConnected = false,
    this.connectingAddress,
    this.activeDevice,
    this.devices = const [],
    this.errorMessage,
  });

  BluetoothScannerState copyWith({
    bool? isScanning,
    bool? isBluetoothEnabled,
    bool? hasPermission,
    bool? isConnected,
    String? connectingAddress,
    BluetoothDeviceModel? activeDevice,
    List<BluetoothDeviceModel>? devices,
    String? errorMessage,
  }) {
    return BluetoothScannerState(
      isScanning: isScanning ?? this.isScanning,
      isBluetoothEnabled: isBluetoothEnabled ?? this.isBluetoothEnabled,
      hasPermission: hasPermission ?? this.hasPermission,
      isConnected: isConnected ?? this.isConnected,
      connectingAddress: connectingAddress,
      activeDevice: activeDevice ?? this.activeDevice,
      devices: devices ?? this.devices,
      errorMessage: errorMessage,
    );
  }
}

class BluetoothScannerController extends StateNotifier<BluetoothScannerState> {
  final BluetoothPermissionService _permissionService;
  final BluetoothStateMonitor _stateMonitor;
  final BluetoothDiscoveryService _discoveryService;
  final BluetoothConnectionService _connectionService;
  final BluetoothDeviceRepository _repository;

  StreamSubscription<List<BluetoothDeviceModel>>? _discoverySub;
  StreamSubscription<bool>? _connectionSub;
  StreamSubscription<String>? _stateSub;

  BluetoothScannerController(
    this._permissionService,
    this._stateMonitor,
    this._discoveryService,
    this._connectionService,
    this._repository,
  ) : super(const BluetoothScannerState()) {
    _init();
  }

  void _init() async {
    final hasPerm = await _permissionService.hasPermissions();
    final isEnabled = await _stateMonitor.isBluetoothEnabled();

    state = state.copyWith(
      hasPermission: hasPerm,
      isBluetoothEnabled: isEnabled,
    );

    _stateSub = _stateMonitor.stateStream.listen((st) {
      state = state.copyWith(isBluetoothEnabled: st == 'enabled');
    });

    _discoverySub = _discoveryService.discoveryStream.listen((devs) {
      state = state.copyWith(devices: devs);
    });

    _connectionSub = _connectionService.connectionStatusStream.listen((connected) {
      state = state.copyWith(
        isConnected: connected,
        connectingAddress: null,
      );
    });
  }

  Future<void> checkAndRequestPermissions() async {
    final res = await _permissionService.requestPermissions();
    if (res.isSuccess) {
      state = state.copyWith(hasPermission: true, errorMessage: null);
      await startScanning();
    } else {
      state = state.copyWith(
        hasPermission: false,
        errorMessage: res.failureOrNull?.message,
      );
    }
  }

  Future<void> startScanning() async {
    if (!state.hasPermission) {
      await checkAndRequestPermissions();
      if (!state.hasPermission) return;
    }

    state = state.copyWith(isScanning: true, errorMessage: null);
    final res = await _discoveryService.startDiscovery();
    if (res.isFailure) {
      state = state.copyWith(
        isScanning: false,
        errorMessage: res.failureOrNull?.message,
      );
    }
  }

  Future<void> stopScanning() async {
    await _discoveryService.stopDiscovery();
    state = state.copyWith(isScanning: false);
  }

  Future<bool> connectToDevice(BluetoothDeviceModel device) async {
    state = state.copyWith(connectingAddress: device.address, errorMessage: null);
    final res = await _connectionService.connect(device.address);
    if (res.isSuccess) {
      await _repository.saveLastConnectedDevice(device);
      state = state.copyWith(
        isConnected: true,
        activeDevice: device,
        connectingAddress: null,
      );
      return true;
    } else {
      state = state.copyWith(
        isConnected: false,
        connectingAddress: null,
        errorMessage: res.failureOrNull?.message,
      );
      return false;
    }
  }

  Future<void> disconnect() async {
    await _connectionService.disconnect();
    state = state.copyWith(isConnected: false, activeDevice: null);
  }

  @override
  void dispose() {
    _discoverySub?.cancel();
    _connectionSub?.cancel();
    _stateSub?.cancel();
    super.dispose();
  }
}
