import 'dart:async';

abstract class BluetoothStateMonitor {
  Future<bool> isBluetoothEnabled();
  Stream<bool> get bluetoothEnabledStream;
  Stream<String> get stateStream; // "enabled", "disabled", "turningOn", "turningOff"
}
