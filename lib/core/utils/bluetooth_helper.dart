import 'dart:async';

enum AppBluetoothState {
  unknown,
  unavailable,
  unauthorized,
  turningOn,
  on,
  turningOff,
  off
}

abstract class BluetoothDeviceContract {
  String get name;
  String get address;
  int get rssi;
}

abstract class BluetoothHelper {
  Stream<AppBluetoothState> get stateStream;
  Future<AppBluetoothState> get currentState;
  Future<bool> get isAvailable;
  Future<bool> get isEnabled;
  
  Future<void> startScan();
  Future<void> stopScan();
  Stream<List<BluetoothDeviceContract>> get scanResults;
  
  Future<bool> connect(String address);
  Future<void> disconnect();
  Stream<bool> get connectionStateStream;
}

// A placeholder implementation of BluetoothDeviceContract for compile sanity
class BluetoothDevicePlaceholder implements BluetoothDeviceContract {
  @override
  final String name;
  @override
  final String address;
  @override
  final int rssi;

  const BluetoothDevicePlaceholder({
    required this.name,
    required this.address,
    required this.rssi,
  });
}
