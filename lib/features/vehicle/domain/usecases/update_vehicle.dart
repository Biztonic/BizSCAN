import '../../../../core/errors/result.dart';
import '../models/vehicle.dart';
import '../repositories/vehicle_repository.dart';

class UpdateVehicle {
  final VehicleRepository repository;

  UpdateVehicle(this.repository);

  Future<Result<Vehicle>> call(Vehicle vehicle) {
    return repository.updateVehicle(vehicle);
  }
}
