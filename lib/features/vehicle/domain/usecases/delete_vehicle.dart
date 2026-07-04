import '../../../../core/errors/result.dart';
import '../repositories/vehicle_repository.dart';

class DeleteVehicle {
  final VehicleRepository repository;

  DeleteVehicle(this.repository);

  Future<Result<void>> call(String vehicleId) {
    return repository.deleteVehicle(vehicleId);
  }
}
