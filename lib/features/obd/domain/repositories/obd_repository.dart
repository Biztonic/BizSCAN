import '../../../../core/errors/result.dart';

abstract class OBDRepository {
  Future<Result<bool>> initializeConnection();
  Future<Result<String>> readVIN();
  Future<Result<double>> readEngineRPM();
  Future<Result<double>> readCoolantTemperature();
  Future<Result<double>> readBatteryVoltage();
  Future<Result<List<String>>> readActiveDTCs();
  Future<Result<void>> clearDTCs();
  Future<Result<void>> closeConnection();
}
