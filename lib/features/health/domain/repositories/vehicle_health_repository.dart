import '../models/vehicle_health_snapshot.dart';

abstract class VehicleHealthRepository {
  Future<void> saveSnapshot(VehicleHealthSnapshot snapshot);
  Future<List<VehicleHealthSnapshot>> getSnapshotHistory();
  Future<VehicleHealthSnapshot?> getLatestSnapshot();
  Future<void> clearHistory();
}
