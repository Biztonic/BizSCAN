import '../models/vehicle_profile.dart';
import '../models/vehicle_specification.dart';
import 'vehicle_database.dart';

class VehicleSpecificationEngine {
  final VehicleDatabase _database = VehicleDatabase();

  VehicleSpecification getSpecifications(VehicleProfile profile) {
    return _database.getSpecificationForModel(profile.brand, profile.model);
  }
}
