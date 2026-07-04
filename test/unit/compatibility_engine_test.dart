import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/features/vehicle_intelligence/domain/services/compatibility_engine.dart';

void main() {
  group('CompatibilityEngine Unit Tests', () {
    late CompatibilityEngine engine;

    setUp(() {
      engine = CompatibilityEngine();
    });

    test('evaluateCompatibility builds detailed mode and PID support profile', () {
      final profile = engine.evaluateCompatibility(
        protocol: 'ISO 15765-4 (CAN 11bit 500k)',
        supportedPidsHex: '4100BE3FA813',
      );

      expect(profile.supportedPIDs.isNotEmpty, true);
      expect(profile.supportedDiagnosticModes.isNotEmpty, true);
      expect(profile.supportedProtocols, contains('ISO 15765-4 (CAN 11bit 500k)'));
    });
  });
}
