import '../../../../core/errors/result.dart';
import '../models/vehicle.dart';

abstract class VehicleRepository {
  Future<Result<Vehicle>> createVehicle(Vehicle vehicle);
  Future<Result<Vehicle>> updateVehicle(Vehicle vehicle);
  Future<Result<void>> deleteVehicle(String vehicleId);
  Future<Result<Vehicle?>> getVehicle(String vehicleId);
  Future<Result<List<Vehicle>>> searchVehicles({String? query, String? manufacturer, String? vin});
  Stream<List<Vehicle>> watchVehicles();
  Future<Result<void>> syncVehicles();
}
