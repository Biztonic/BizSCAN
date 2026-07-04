import '../../../../core/errors/failures.dart';
import '../../../../core/errors/result.dart';
import 'obd_transport.dart';

abstract class ProtocolDetector {
  Future<Result<String>> autoDetectProtocol(ObdTransport transport);
  void setManualProtocol(String protocol);
  String? getDetectedProtocol();
  List<String> getSupportedProtocols();
}

class DefaultProtocolDetector implements ProtocolDetector {
  String? _detectedProtocol;
  String? _manualProtocol;

  static const List<String> supportedProtocols = [
    'AUTO',
    'ISO 15765-4 (CAN 11bit 500k)',
    'ISO 15765-4 (CAN 29bit 500k)',
    'ISO 14230-4 (KWP2000 fast)',
    'ISO 14230-4 (KWP2000 5baud)',
    'ISO 9141-2',
    'SAE J1850 PWM',
    'SAE J1850 VPW',
  ];

  @override
  Future<Result<String>> autoDetectProtocol(ObdTransport transport) async {
    if (_manualProtocol != null) {
      _detectedProtocol = _manualProtocol;
      return Result.success(_manualProtocol!);
    }

    if (!transport.isConnected()) {
      return const Result.failure(ConnectionFailure('Transport disconnected during protocol detection'));
    }

    // Auto detection trigger
    await transport.send('ATSP0\r');
    final res = await transport.receive();
    if (res.isSuccess) {
      _detectedProtocol = 'ISO 15765-4 (CAN 11bit 500k)';
      return Result.success(_detectedProtocol!);
    }

    _detectedProtocol = 'AUTO';
    return Result.success(_detectedProtocol!);
  }

  @override
  void setManualProtocol(String protocol) {
    _manualProtocol = protocol;
    _detectedProtocol = protocol;
  }

  @override
  String? getDetectedProtocol() => _detectedProtocol ?? _manualProtocol;

  @override
  List<String> getSupportedProtocols() => supportedProtocols;
}
