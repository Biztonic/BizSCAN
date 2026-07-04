import '../../../../core/errors/result.dart';
import '../models/vehicle.dart';
import '../repositories/vehicle_repository.dart';

class SearchVehicle {
  final VehicleRepository repository;

  SearchVehicle(this.repository);

  Future<Result<List<Vehicle>>> call({String? query, String? manufacturer, String? vin}) {
    return repository.searchVehicles(query: query, manufacturer: manufacturer, vin: vin);
  }
}
