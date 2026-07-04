import 'dart:async';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/result.dart';
import '../../domain/services/emulator_transport.dart';

class MockObdTransport implements EmulatorTransport {
  bool _connected = false;
  final StreamController<String> _streamController = StreamController<String>.broadcast();
  final Map<String, String> _customResponses = {};
  String? _lastReceivedData;

  @override
  bool isConnected() => _connected;

  @override
  Future<Result<void>> connect(String targetAddress) async {
    _connected = true;
    _streamController.add('CONNECTED TO $targetAddress');
    return const Result.success(null);
  }

  @override
  Future<Result<void>> disconnect() async {
    _connected = false;
    _streamController.add('DISCONNECTED');
    return const Result.success(null);
  }

  @override
  Future<Result<void>> send(String data) async {
    if (!_connected) {
      return const Result.failure(ConnectionFailure('Transport is not connected'));
    }
    _streamController.add('TX: $data');

    final cleanCmd = data.replaceAll('\r', '').replaceAll('\n', '').trim().toUpperCase();
    
    // Check custom responses first
    if (_customResponses.containsKey(cleanCmd)) {
      _lastReceivedData = _customResponses[cleanCmd];
    } else if (cleanCmd == 'ATZ' || cleanCmd == 'AT Z' || cleanCmd == 'ATI' || cleanCmd == 'AT I') {
      _lastReceivedData = 'ELM327 v1.5';
    } else if (cleanCmd == 'ATE0' || cleanCmd == 'AT E0' || cleanCmd == 'ATL0' || cleanCmd == 'ATS0' || cleanCmd == 'ATH0' || cleanCmd == 'ATSP0') {
      _lastReceivedData = 'OK';
    } else if (cleanCmd == 'ATRV' || cleanCmd == 'AT RV') {
      _lastReceivedData = '12.4V';
    } else if (cleanCmd == '0100') {
      _lastReceivedData = '41 00 BE 3F A8 13';
    } else if (cleanCmd == '010C') {
      _lastReceivedData = '41 0C 0B F4'; // 750 RPM
    } else if (cleanCmd == '010D') {
      _lastReceivedData = '41 0D 32'; // 50 km/h
    } else if (cleanCmd == '0105') {
      _lastReceivedData = '41 05 7B'; // 83 °C
    } else if (cleanCmd == '03') {
      _lastReceivedData = '43 02 01 04 03 00'; // P0104, P0300
    } else if (cleanCmd == '0902') {
      _lastReceivedData = '49 02 01 57 56 57 5A 5A 5A 33 43 5A 57 45 31 32 33 34 35 36'; // VIN
    } else {
      _lastReceivedData = '41 ${cleanCmd.substring(cleanCmd.length > 2 ? 2 : 0)} 00';
    }

    _streamController.add('RX: $_lastReceivedData');
    return const Result.success(null);
  }

  @override
  Future<Result<String>> receive({Duration? timeout}) async {
    if (!_connected) {
      return const Result.failure(ConnectionFailure('Transport is not connected'));
    }
    if (_lastReceivedData != null) {
      final data = _lastReceivedData!;
      _lastReceivedData = null;
      return Result.success(data);
    }
    return const Result.success('NO DATA');
  }

  @override
  Stream<String> stream() => _streamController.stream;

  @override
  Future<void> dispose() async {
    await _streamController.close();
  }

  @override
  void simulateFaultCode(String dtc) {
    _customResponses['03'] = '43 01 $dtc';
  }

  @override
  void simulatePidResponse(String pid, String hexResponse) {
    _customResponses[pid.toUpperCase()] = hexResponse;
  }
}
