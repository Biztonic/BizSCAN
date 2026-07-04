import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/features/obd/domain/models/obd_connection_state.dart';
import 'package:bizscan/features/obd/domain/services/connection_monitor.dart';

void main() {
  group('ConnectionMonitor State Machine Unit Tests', () {
    late ConnectionMonitor monitor;

    setUp(() {
      monitor = ConnectionMonitor();
    });

    tearDown(() {
      monitor.dispose();
    });

    test('should initialize in disconnected state', () {
      expect(monitor.currentState, ObdConnectionState.disconnected);
    });

    test('should transition through connection lifecycle states', () async {
      final stateHistory = <ObdConnectionState>[];
      final subscription = monitor.stateStream.listen((state) {
        stateHistory.add(state);
      });

      monitor.transitionTo(ObdConnectionState.connecting);
      monitor.transitionTo(ObdConnectionState.initializing);
      monitor.transitionTo(ObdConnectionState.ready);
      monitor.transitionTo(ObdConnectionState.busy);
      monitor.transitionTo(ObdConnectionState.ready);

      await Future.delayed(Duration.zero);

      expect(stateHistory, [
        ObdConnectionState.connecting,
        ObdConnectionState.initializing,
        ObdConnectionState.ready,
        ObdConnectionState.busy,
        ObdConnectionState.ready,
      ]);

      await subscription.cancel();
    });

    test('should stream latency metrics correctly', () async {
      final latencies = <int>[];
      final subscription = monitor.latencyStream.listen((lat) {
        latencies.add(lat);
      });

      monitor.updateLatency(45);
      monitor.updateLatency(32);
      monitor.updateLatency(50);

      await Future.delayed(Duration.zero);

      expect(latencies, [45, 32, 50]);
      expect(monitor.lastLatencyMs, 50);

      await subscription.cancel();
    });

    test('should shift to error state and broadcast error message on failure', () async {
      String? reportedError;
      final subscription = monitor.errorStream.listen((err) {
        reportedError = err;
      });

      monitor.reportError('Connection dropped by remote device');

      await Future.delayed(Duration.zero);

      expect(monitor.currentState, ObdConnectionState.error);
      expect(reportedError, 'Connection dropped by remote device');

      await subscription.cancel();
    });
  });
}
