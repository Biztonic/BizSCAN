import '../../../../core/errors/failures.dart';
import '../../../../core/errors/result.dart';
import '../../../../core/services/di_service.dart';
import '../../../bluetooth/domain/repositories/bluetooth_device_repository.dart';
import '../../domain/models/elm327_state.dart';
import '../../domain/models/obd_command.dart';
import '../../domain/models/obd_response.dart';
import '../../domain/repositories/obd_repository.dart';
import '../../domain/services/elm327_engine.dart';
import '../../domain/services/response_parser.dart';

class OBDRepositoryImpl implements OBDRepository {
  Elm327Engine get _elmEngine => sl<Elm327Engine>();
  ResponseParser get _parser => sl<ResponseParser>();

  @override
  Future<Result<bool>> initializeConnection() async {
    if (_elmEngine.state == Elm327State.ready) {
      return const Result.success(true);
    }

    final bluetoothDeviceRepo = sl<BluetoothDeviceRepository>();
    final lastDevice = await bluetoothDeviceRepo.getLastConnectedDevice();
    if (lastDevice == null) {
      return const Result.failure(ConnectionFailure('No OBD-II device configured in settings'));
    }

    final initRes = await _elmEngine.connectAndInitialize(lastDevice.address);
    if (initRes.isFailure) {
      return Result.failure(initRes.failureOrNull!);
    }
    return const Result.success(true);
  }

  @override
  Future<Result<String>> readVIN() async {
    final cmd = ObdCommand(
      command: '0902',
      type: 'PID',
      createdAt: DateTime.now(),
    );
    final res = await _elmEngine.executeCommand(cmd);
    if (res.isFailure) return Result.failure(res.failureOrNull!);
    
    final rawData = res.getOrNull!.rawData;
    final parsed = _parser.parseVinResponse(rawData);
    return parsed;
  }

  @override
  Future<Result<double>> readEngineRPM() async {
    return _readPidDouble('010C', 'Engine Speed');
  }

  @override
  Future<Result<double>> readCoolantTemperature() async {
    return _readPidDouble('0105', 'Engine Coolant Temperature');
  }

  @override
  Future<Result<double>> readBatteryVoltage() async {
    final cmd = ObdCommand(
      command: 'ATRV',
      type: 'AT',
      createdAt: DateTime.now(),
    );
    final res = await _elmEngine.executeCommand(cmd);
    if (res.isFailure) return Result.failure(res.failureOrNull!);

    try {
      final raw = res.getOrNull!.rawData;
      final clean = raw.replaceAll(RegExp(r'[^0-9.]'), '');
      final volt = double.tryParse(clean);
      if (volt != null) {
        return Result.success(volt);
      }
      return const Result.failure(ParserFailure('Invalid voltage format'));
    } catch (e) {
      return Result.failure(ParserFailure('Failed to parse voltage: $e'));
    }
  }

  @override
  Future<Result<List<String>>> readActiveDTCs() async {
    final cmd = ObdCommand(
      command: '03',
      type: 'DTC',
      createdAt: DateTime.now(),
    );
    final res = await _elmEngine.executeCommand(cmd);
    if (res.isFailure) return Result.failure(res.failureOrNull!);

    final rawData = res.getOrNull!.rawData;
    final parsed = _parser.parseDtcResponse(rawData);
    return parsed;
  }

  @override
  Future<Result<void>> clearDTCs() async {
    final cmd = ObdCommand(
      command: '04',
      type: 'DTC',
      createdAt: DateTime.now(),
    );
    final res = await _elmEngine.executeCommand(cmd);
    if (res.isFailure) return Result.failure(res.failureOrNull!);
    return const Result.success(null);
  }

  @override
  Future<Result<void>> closeConnection() async {
    await _elmEngine.disconnect();
    return const Result.success(null);
  }

  Future<Result<double>> _readPidDouble(String pid, String name) async {
    final cmd = ObdCommand(
      command: pid,
      type: 'PID',
      createdAt: DateTime.now(),
    );
    final res = await _elmEngine.executeCommand(cmd);
    if (res.isFailure) return Result.failure(res.failureOrNull!);

    final rawData = res.getOrNull!.rawData;
    final parsedRes = _parser.parsePidResponse(rawData, pid);
    if (parsedRes.isFailure) return Result.failure(parsedRes.failureOrNull!);

    final parsed = parsedRes.getOrNull;
    if (parsed != null && parsed.containsKey('value')) {
      final val = parsed['value'];
      if (val is num) {
        return Result.success(val.toDouble());
      }
    }
    return Result.failure(ParserFailure('Failed to read double value for $name'));
  }
}
