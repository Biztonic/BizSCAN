import '../../../../core/errors/result.dart';
import '../../domain/repositories/obd_repository.dart';

class OBDRepositoryImpl implements OBDRepository {
  @override
  Future<Result<bool>> initializeConnection() async {
    return const Result.success(true);
  }

  @override
  Future<Result<String>> readVIN() async {
    return const Result.success('MOCKVIN1234567890');
  }

  @override
  Future<Result<double>> readEngineRPM() async {
    return const Result.success(0.0);
  }

  @override
  Future<Result<double>> readCoolantTemperature() async {
    return const Result.success(0.0);
  }

  @override
  Future<Result<double>> readBatteryVoltage() async {
    return const Result.success(12.4);
  }

  @override
  Future<Result<List<String>>> readActiveDTCs() async {
    return const Result.success([]);
  }

  @override
  Future<Result<void>> clearDTCs() async {
    return const Result.success(null);
  }

  @override
  Future<Result<void>> closeConnection() async {
    return const Result.success(null);
  }
}
