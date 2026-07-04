import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/features/obd/data/transports/mock_obd_transport.dart';

void main() {
  group('MockObdTransport Unit Tests', () {
    late MockObdTransport transport;

    setUp(() {
      transport = MockObdTransport();
    });

    tearDown(() async {
      await transport.dispose();
    });

    test('should start in disconnected state', () {
      expect(transport.isConnected(), false);
    });

    test('should connect and update state', () async {
      final res = await transport.connect('00:11:22:33:44:55');
      expect(res.isSuccess, true);
      expect(transport.isConnected(), true);
    });

    test('should disconnect cleanly', () async {
      await transport.connect('00:11:22:33:44:55');
      final res = await transport.disconnect();
      expect(res.isSuccess, true);
      expect(transport.isConnected(), false);
    });

    test('should return error when sending while disconnected', () async {
      final res = await transport.send('ATZ');
      expect(res.isFailure, true);
    });

    test('should return mock responses for standard commands', () async {
      await transport.connect('00:11:22:33:44:55');

      await transport.send('ATZ');
      final rx1 = await transport.receive();
      expect(rx1.getOrNull, 'ELM327 v1.5');

      await transport.send('010C');
      final rx2 = await transport.receive();
      expect(rx2.getOrNull, '41 0C 0B F4');

      await transport.send('010D');
      final rx3 = await transport.receive();
      expect(rx3.getOrNull, '41 0D 32');
    });

    test('should support simulated custom responses', () async {
      await transport.connect('00:11:22:33:44:55');

      transport.simulatePidResponse('010C', '41 0C 1F 40'); // 2000 RPM
      await transport.send('010C');
      final rx = await transport.receive();
      expect(rx.getOrNull, '41 0C 1F 40');
    });
  });
}
