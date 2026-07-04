import '../../../../core/errors/result.dart';
import '../models/vehicle.dart';
import '../repositories/vehicle_repository.dart';

class CreateVehicle {
  final VehicleRepository repository;

  CreateVehicle(this.repository);

  Future<Result<Vehicle>> call(Vehicle vehicle) {
    return repository.createVehicle(vehicle);
  }
}
