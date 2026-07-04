import 'dart:convert';
import 'package:hive_ce/hive_ce.dart';
import '../../domain/models/vehicle_health_snapshot.dart';
import '../../domain/repositories/vehicle_health_repository.dart';

class VehicleHealthRepositoryImpl implements VehicleHealthRepository {
  final Box<String> _healthBox;

  VehicleHealthRepositoryImpl(this._healthBox);

  @override
  Future<void> saveSnapshot(VehicleHealthSnapshot snapshot) async {
    final key = snapshot.snapshotAt.toIso8601String();
    await _healthBox.put(key, jsonEncode(snapshot.toJson()));
  }

  @override
  Future<List<VehicleHealthSnapshot>> getSnapshotHistory() async {
    final list = <VehicleHealthSnapshot>[];
    for (final raw in _healthBox.values) {
      try {
        list.add(VehicleHealthSnapshot.fromJson(jsonDecode(raw)));
      } catch (_) {}
    }
    list.sort((a, b) => b.snapshotAt.compareTo(a.snapshotAt));
    return list;
  }

  @override
  Future<VehicleHealthSnapshot?> getLatestSnapshot() async {
    final history = await getSnapshotHistory();
    if (history.isEmpty) return null;
    return history.first;
  }

  @override
  Future<void> clearHistory() async {
    await _healthBox.clear();
  }
}
