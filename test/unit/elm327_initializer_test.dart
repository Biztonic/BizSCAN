import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/features/obd/data/transports/mock_obd_transport.dart';
import 'package:bizscan/features/obd/domain/services/elm327_initializer.dart';

void main() {
  group('Elm327Initializer Unit Tests', () {
    late MockObdTransport transport;
    late Elm327Initializer initializer;

    setUp(() {
      transport = MockObdTransport();
      initializer = Elm327Initializer();
    });

    tearDown(() async {
      await transport.dispose();
    });

    test('initializeSequence executes ATZ -> 0100 sequence on connected transport', () async {
      await transport.connect('00:11:22:33:44:55');

      final res = await initializer.initializeSequence(transport);

      expect(res.isSuccess, true);
      final data = res.getOrNull!;
      expect(data.adapterInfo, contains('ELM327'));
      expect(data.rawResponses, containsPair('ATZ', 'ELM327 v1.5'));
      expect(data.rawResponses, containsPair('ATE0', 'OK'));
      expect(data.rawResponses, containsPair('ATSP0', 'OK'));
      expect(data.rawResponses, containsPair('0100', '41 00 BE 3F A8 13'));
      expect(data.durationMs, greaterThanOrEqualTo(0));
    });

    test('initializeSequence fails if transport is disconnected', () async {
      final res = await initializer.initializeSequence(transport);
      expect(res.isFailure, true);
    });
  });
}
