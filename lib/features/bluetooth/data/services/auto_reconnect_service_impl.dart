import 'dart:async';
import 'dart:math';
import '../../domain/services/bluetooth_auto_reconnect_service.dart';
import '../../domain/services/bluetooth_connection_service.dart';

class BluetoothAutoReconnectServiceImpl implements BluetoothAutoReconnectService {
  final BluetoothConnectionService _connectionService;
  Timer? _reconnectTimer;
  final StreamController<int> _retryController = StreamController<int>.broadcast();
  bool _isAutoReconnecting = false;
  int _currentAttempt = 0;
  static const int maxRetries = 5;

  BluetoothAutoReconnectServiceImpl(this._connectionService);

  @override
  bool isAutoReconnecting() => _isAutoReconnecting;

  @override
  Stream<int> get retryAttemptStream => _retryController.stream;

  @override
  void enableAutoReconnect(String address) {
    if (_isAutoReconnecting) return;
    _isAutoReconnecting = true;
    _currentAttempt = 0;
    _attemptReconnect(address);
  }

  @override
  void stopAutoReconnect() {
    _isAutoReconnecting = false;
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
    _currentAttempt = 0;
    _retryController.add(0);
  }

  void _attemptReconnect(String address) async {
    if (!_isAutoReconnecting || _currentAttempt >= maxRetries) {
      stopAutoReconnect();
      return;
    }

    _currentAttempt++;
    _retryController.add(_currentAttempt);

    final res = await _connectionService.connect(address);
    if (res.isSuccess) {
      stopAutoReconnect();
      return;
    }

    // Exponential Backoff: 1s, 2s, 4s, 8s, 16s
    final delaySeconds = pow(2, _currentAttempt - 1).toInt();
    _reconnectTimer = Timer(Duration(seconds: delaySeconds), () {
      _attemptReconnect(address);
    });
  }
}
