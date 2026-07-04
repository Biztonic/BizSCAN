import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/services/di_service.dart';
import '../../domain/repositories/obd_repository.dart';

part 'obd_provider.g.dart';

@riverpod
class OBDStateNotifier extends _$OBDStateNotifier {
  late final OBDRepository _repository;

  @override
  FutureOr<Map<String, dynamic>> build() {
    _repository = sl<OBDRepository>();
    return {
      'isConnected': false,
      'vin': '',
      'rpm': 0.0,
      'coolant': 0.0,
      'voltage': 12.4,
      'dtcs': <String>[],
    };
  }

  Future<void> connectAndFetch() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final connResult = await _repository.initializeConnection();
      if (connResult.isFailure) {
        throw Exception(connResult.failureOrNull?.message ?? 'Failed to connect');
      }

      final vinResult = await _repository.readVIN();
      final rpmResult = await _repository.readEngineRPM();
      final coolantResult = await _repository.readCoolantTemperature();
      final voltageResult = await _repository.readBatteryVoltage();
      final dtcsResult = await _repository.readActiveDTCs();

      return {
        'isConnected': true,
        'vin': vinResult.getOrNull ?? 'Unknown VIN',
        'rpm': rpmResult.getOrNull ?? 0.0,
        'coolant': coolantResult.getOrNull ?? 0.0,
        'voltage': voltageResult.getOrNull ?? 12.4,
        'dtcs': dtcsResult.getOrNull ?? <String>[],
      };
    });
  }

  Future<void> disconnect() async {
    await _repository.closeConnection();
    state = const AsyncValue.data({
      'isConnected': false,
      'vin': '',
      'rpm': 0.0,
      'coolant': 0.0,
      'voltage': 12.4,
      'dtcs': <String>[],
    });
  }
}
