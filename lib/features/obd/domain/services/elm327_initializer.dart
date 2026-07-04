import '../../../../core/errors/failures.dart';
import '../../../../core/errors/result.dart';
import 'obd_transport.dart';
import 'elm327_response_cleaner.dart';

class Elm327InitResult {
  final String adapterInfo;
  final String voltage;
  final String protocol;
  final String supportedPids0120;
  final Map<String, String> rawResponses;
  final int durationMs;

  const Elm327InitResult({
    required this.adapterInfo,
    required this.voltage,
    required this.protocol,
    required this.supportedPids0120,
    required this.rawResponses,
    required this.durationMs,
  });
}

class Elm327Initializer {
  final Elm327ResponseCleaner _cleaner = Elm327ResponseCleaner();

  Future<Result<Elm327InitResult>> initializeSequence(ObdTransport transport) async {
    final startTime = DateTime.now();
    final responses = <String, String>{};

    if (!transport.isConnected()) {
      return const Result.failure(ConnectionFailure('Transport is disconnected during initialization'));
    }

    try {
      // 1. ATZ (Reset)
      final atzRes = await _sendCommand(transport, 'ATZ');
      responses['ATZ'] = atzRes;

      // 2. ATE0 (Echo Off)
      final ate0Res = await _sendCommand(transport, 'ATE0');
      responses['ATE0'] = ate0Res;

      // 3. ATL0 (Linefeeds Off)
      final atl0Res = await _sendCommand(transport, 'ATL0');
      responses['ATL0'] = atl0Res;

      // 4. ATS0 (Spaces Off)
      final ats0Res = await _sendCommand(transport, 'ATS0');
      responses['ATS0'] = ats0Res;

      // 5. ATH0 (Headers Off)
      final ath0Res = await _sendCommand(transport, 'ATH0');
      responses['ATH0'] = ath0Res;

      // 6. ATSP0 (Auto Protocol)
      final atsp0Res = await _sendCommand(transport, 'ATSP0');
      responses['ATSP0'] = atsp0Res;

      // 7. ATI (Adapter Version Info)
      final atiRes = await _sendCommand(transport, 'ATI');
      responses['ATI'] = atiRes;

      // 8. ATRV (Read Battery Voltage)
      final atrvRes = await _sendCommand(transport, 'ATRV');
      responses['ATRV'] = atrvRes;

      // 9. 0100 (Query ECU PIDs 01-20)
      final pid0100Res = await _sendCommand(transport, '0100');
      responses['0100'] = pid0100Res;

      final durationMs = DateTime.now().difference(startTime).inMilliseconds;

      return Result.success(Elm327InitResult(
        adapterInfo: _cleaner.clean(atiRes),
        voltage: _cleaner.clean(atrvRes),
        protocol: 'ISO 15765-4 (CAN 11bit 500k)',
        supportedPids0120: _cleaner.extractHex(pid0100Res),
        rawResponses: responses,
        durationMs: durationMs,
      ));
    } catch (e) {
      return Result.failure(Elm327InitFailure('Initialization sequence failed: $e'));
    }
  }

  Future<String> _sendCommand(ObdTransport transport, String cmd) async {
    await transport.send('$cmd\r');
    final res = await transport.receive(timeout: const Duration(seconds: 3));
    return res.getOrNull ?? 'NO RESPONSE';
  }
}
