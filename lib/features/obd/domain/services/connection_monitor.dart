import 'dart:async';
import '../models/obd_connection_state.dart';

class ConnectionMonitor {
  ObdConnectionState _currentState = ObdConnectionState.disconnected;
  int _lastLatencyMs = 0;

  final StreamController<ObdConnectionState> _stateStreamController = StreamController<ObdConnectionState>.broadcast();
  final StreamController<int> _latencyStreamController = StreamController<int>.broadcast();
  final StreamController<String> _errorStreamController = StreamController<String>.broadcast();

  ObdConnectionState get currentState => _currentState;
  int get lastLatencyMs => _lastLatencyMs;

  Stream<ObdConnectionState> get stateStream => _stateStreamController.stream;
  Stream<int> get latencyStream => _latencyStreamController.stream;
  Stream<String> get errorStream => _errorStreamController.stream;

  void transitionTo(ObdConnectionState newState) {
    if (_currentState != newState) {
      _currentState = newState;
      _stateStreamController.add(newState);
    }
  }

  void updateLatency(int latencyMs) {
    _lastLatencyMs = latencyMs;
    _latencyStreamController.add(latencyMs);
  }

  void reportError(String errorMsg) {
    _errorStreamController.add(errorMsg);
    transitionTo(ObdConnectionState.error);
  }

  void reset() {
    _currentState = ObdConnectionState.disconnected;
    _lastLatencyMs = 0;
    _stateStreamController.add(_currentState);
  }

  void dispose() {
    _stateStreamController.close();
    _latencyStreamController.close();
    _errorStreamController.close();
  }
}
