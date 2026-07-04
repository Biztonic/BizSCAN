import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/core/errors/failures.dart';
import 'package:bizscan/features/obd/domain/services/elm327_response_cleaner.dart';

void main() {
  group('Elm327ResponseCleaner Unit Tests', () {
    late Elm327ResponseCleaner cleaner;

    setUp(() {
      cleaner = Elm327ResponseCleaner();
    });

    test('clean strips prompts, linefeeds, carriage returns, and noise keywords', () {
      const raw = 'SEARCHING...\r\n41 0C 0B F4\r\n>';
      final result = cleaner.clean(raw);
      expect(result, '41 0C 0B F4');
    });

    test('extractHex extracts uppercase hex string only', () {
      const raw = '41 0C 0B F4\r\n>';
      final hex = cleaner.extractHex(raw);
      expect(hex, '410C0BF4');
    });

    test('validateResponse detects BUS ERROR and UNABLE TO CONNECT', () {
      final res1 = cleaner.validateResponse('UNABLE TO CONNECT\r\n>');
      expect(res1.isFailure, true);
      expect(res1.failureOrNull, isA<Elm327BusFailure>());

      final res2 = cleaner.validateResponse('BUS ERROR\r\n>');
      expect(res2.isFailure, true);
      expect(res2.failureOrNull, isA<Elm327BusFailure>());
    });

    test('validateResponse detects BUFFER FULL and STOPPED freeze states', () {
      final res1 = cleaner.validateResponse('BUFFER FULL\r\n>');
      expect(res1.isFailure, true);
      expect(res1.failureOrNull, isA<Elm327FreezeFailure>());

      final res2 = cleaner.validateResponse('STOPPED\r\n>');
      expect(res2.isFailure, true);
      expect(res2.failureOrNull, isA<Elm327FreezeFailure>());
    });

    test('validateResponse passes valid responses', () {
      final res = cleaner.validateResponse('41 0D 32\r\n>');
      expect(res.isSuccess, true);
      expect(res.getOrNull, '41 0D 32');
    });
  });
}
