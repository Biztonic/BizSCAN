import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/features/obd/domain/services/elm327_clone_detector.dart';
import 'package:bizscan/features/obd/domain/services/elm327_initializer.dart';

void main() {
  group('Elm327CloneDetector Unit Tests', () {
    late Elm327CloneDetector cloneDetector;

    setUp(() {
      cloneDetector = Elm327CloneDetector();
    });

    test('evaluateClone identifies v1.5 firmware string as clone designation', () {
      const initResult = Elm327InitResult(
        adapterInfo: 'ELM327 v1.5',
        voltage: '12.2V',
        protocol: 'ISO 15765-4 (CAN 11bit 500k)',
        supportedPids0120: '4100BE3FA813',
        rawResponses: {},
        durationMs: 1400,
      );

      final result = cloneDetector.evaluateClone(initResult);

      expect(result.isClone, true);
      expect(result.cloneScore, greaterThanOrEqualTo(40));
      expect(result.detectedQuirks, contains('v1.5'));
    });
  });
}
