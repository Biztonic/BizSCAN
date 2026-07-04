import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/models/bluetooth_device_model.dart';
import '../../domain/repositories/bluetooth_device_repository.dart';

class BluetoothDeviceRepositoryImpl implements BluetoothDeviceRepository {
  final SharedPreferences _prefs;

  static const _keyLastDevice = 'bluetooth_last_device';
  static const _keyAutoReconnect = 'bluetooth_auto_reconnect';
  static const _keyTimeout = 'bluetooth_timeout';
  static const _keyPreferred = 'bluetooth_preferred';

  BluetoothDeviceRepositoryImpl(this._prefs);

  @override
  Future<void> saveLastConnectedDevice(BluetoothDeviceModel device) async {
    await _prefs.setString(_keyLastDevice, jsonEncode(device.toJson()));
  }

  @override
  Future<BluetoothDeviceModel?> getLastConnectedDevice() async {
    final str = _prefs.getString(_keyLastDevice);
    if (str == null) return null;
    try {
      return BluetoothDeviceModel.fromJson(jsonDecode(str));
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> setAutoReconnectOption(bool enabled) async {
    await _prefs.setBool(_keyAutoReconnect, enabled);
  }

  @override
  Future<bool> getAutoReconnectOption() async {
    return _prefs.getBool(_keyAutoReconnect) ?? true;
  }

  @override
  Future<void> setConnectionTimeout(int seconds) async {
    await _prefs.setInt(_keyTimeout, seconds);
  }

  @override
  Future<int> getConnectionTimeout() async {
    return _prefs.getInt(_keyTimeout) ?? 10;
  }

  @override
  Future<void> setPreferredDevice(String address) async {
    await _prefs.setString(_keyPreferred, address);
  }

  @override
  Future<String?> getPreferredDevice() async {
    return _prefs.getString(_keyPreferred);
  }
}
