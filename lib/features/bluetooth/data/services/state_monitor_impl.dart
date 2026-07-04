import 'dart:async';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import '../../domain/services/bluetooth_state_monitor.dart';

class BluetoothStateMonitorImpl implements BluetoothStateMonitor {
  final FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;

  @override
  Future<bool> isBluetoothEnabled() async {
    try {
      return (await _bluetooth.isEnabled) ?? false;
    } catch (_) {
      return false;
    }
  }

  @override
  Stream<bool> get bluetoothEnabledStream {
    return _bluetooth.onStateChanged().map((state) => state.isEnabled);
  }

  @override
  Stream<String> get stateStream {
    return _bluetooth.onStateChanged().map((state) {
      if (state == BluetoothState.STATE_ON) return 'enabled';
      if (state == BluetoothState.STATE_OFF) return 'disabled';
      if (state == BluetoothState.STATE_TURNING_ON) return 'turningOn';
      if (state == BluetoothState.STATE_TURNING_OFF) return 'turningOff';
      return 'disabled';
    });
  }
}
