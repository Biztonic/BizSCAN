import 'dart:math';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Bluetooth Auto Reconnect Exponential Backoff Tests', () {
    test('Exponential backoff delay sequence calculation (1s, 2s, 4s, 8s, 16s)', () {
      final delays = <int>[];
      for (var attempt = 1; attempt <= 5; attempt++) {
        final delaySeconds = pow(2, attempt - 1).toInt();
        delays.add(delaySeconds);
      }

      expect(delays, [1, 2, 4, 8, 16]);
    });
  });
}
