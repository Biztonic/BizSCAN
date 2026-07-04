import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/features/obd/domain/services/elm327_capability_detector.dart';
import 'package:bizscan/features/obd/domain/services/elm327_initializer.dart';

void main() {
  group('Elm327CapabilityDetector Unit Tests', () {
    late Elm327CapabilityDetector detector;

    setUp(() {
      detector = Elm327CapabilityDetector();
    });

    test('detectCapabilities detects CAN bus, multi-frame, and fast init', () {
      const initResult = Elm327InitResult(
        adapterInfo: 'ELM327 v1.5',
        voltage: '12.4V',
        protocol: 'ISO 15765-4 (CAN 11bit 500k)',
        supportedPids0120: '4100BE3FA813',
        rawResponses: {},
        durationMs: 1200,
      );

      final caps = detector.detectCapabilities(initResult);

      expect(caps, contains('MULTI_FRAME'));
      expect(caps, contains('CAN_BUS'));
      expect(caps, contains('FAST_INIT'));
    });
  });
}
