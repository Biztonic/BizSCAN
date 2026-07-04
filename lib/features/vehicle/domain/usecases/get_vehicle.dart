import '../../../../core/errors/result.dart';
import '../models/vehicle.dart';
import '../repositories/vehicle_repository.dart';

class GetVehicle {
  final VehicleRepository repository;

  GetVehicle(this.repository);

  Future<Result<Vehicle?>> call(String vehicleId) {
    return repository.getVehicle(vehicleId);
  }
}
