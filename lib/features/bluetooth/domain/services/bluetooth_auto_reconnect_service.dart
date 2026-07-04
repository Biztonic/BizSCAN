import 'dart:async';

abstract class BluetoothAutoReconnectService {
  void enableAutoReconnect(String address);
  void stopAutoReconnect();
  bool isAutoReconnecting();
  Stream<int> get retryAttemptStream;
}
