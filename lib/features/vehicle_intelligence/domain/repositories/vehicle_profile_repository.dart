import '../models/compatibility_profile.dart';
import '../models/maintenance_record.dart';
import '../models/service_reminder.dart';
import '../models/vehicle_profile.dart';
import '../models/vehicle_specification.dart';

abstract class VehicleProfileRepository {
  Future<void> saveVehicleProfile(VehicleProfile profile);
  Future<VehicleProfile?> getVehicleProfile(String vehicleId);
  Future<List<VehicleProfile>> getAllVehicleProfiles();
  Future<void> setActiveVehicle(String vehicleId);
  Future<VehicleProfile?> getActiveVehicle();
  Future<void> deleteVehicleProfile(String vehicleId);

  Future<void> saveSpecification(String vehicleId, VehicleSpecification spec);
  Future<VehicleSpecification?> getSpecification(String vehicleId);

  Future<void> addMaintenanceRecord(String vehicleId, MaintenanceRecord record);
  Future<List<MaintenanceRecord>> getMaintenanceRecords(String vehicleId);

  Future<void> saveReminders(String vehicleId, List<ServiceReminder> reminders);
  Future<List<ServiceReminder>> getReminders(String vehicleId);

  Future<void> saveCompatibilityProfile(String vehicleId, CompatibilityProfile profile);
  Future<CompatibilityProfile?> getCompatibilityProfile(String vehicleId);
}
