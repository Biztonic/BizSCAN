import 'dart:convert';
import 'package:hive_ce/hive_ce.dart';
import '../../domain/models/compatibility_profile.dart';
import '../../domain/models/maintenance_record.dart';
import '../../domain/models/service_reminder.dart';
import '../../domain/models/vehicle_profile.dart';
import '../../domain/models/vehicle_specification.dart';
import '../../domain/repositories/vehicle_profile_repository.dart';

class VehicleProfileRepositoryImpl implements VehicleProfileRepository {
  final Box<String> _profileBox;
  final Box<String> _specBox;
  final Box<String> _recordBox;
  final Box<String> _reminderBox;
  final Box<String> _compatBox;

  String? _activeVehicleId;

  VehicleProfileRepositoryImpl(
    this._profileBox,
    this._specBox,
    this._recordBox,
    this._reminderBox,
    this._compatBox,
  );

  @override
  Future<void> saveVehicleProfile(VehicleProfile profile) async {
    await _profileBox.put(profile.vehicleId, jsonEncode(profile.toJson()));
    _activeVehicleId ??= profile.vehicleId;
  }

  @override
  Future<VehicleProfile?> getVehicleProfile(String vehicleId) async {
    final raw = _profileBox.get(vehicleId);
    if (raw == null) return null;
    try {
      return VehicleProfile.fromJson(jsonDecode(raw));
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<VehicleProfile>> getAllVehicleProfiles() async {
    final list = <VehicleProfile>[];
    for (final raw in _profileBox.values) {
      try {
        list.add(VehicleProfile.fromJson(jsonDecode(raw)));
      } catch (_) {}
    }
    return list;
  }

  @override
  Future<void> setActiveVehicle(String vehicleId) async {
    _activeVehicleId = vehicleId;
  }

  @override
  Future<VehicleProfile?> getActiveVehicle() async {
    if (_activeVehicleId != null) {
      final active = await getVehicleProfile(_activeVehicleId!);
      if (active != null) return active;
    }
    final all = await getAllVehicleProfiles();
    if (all.isEmpty) return null;
    _activeVehicleId = all.first.vehicleId;
    return all.first;
  }

  @override
  Future<void> deleteVehicleProfile(String vehicleId) async {
    await _profileBox.delete(vehicleId);
    await _specBox.delete(vehicleId);
    await _recordBox.delete(vehicleId);
    await _reminderBox.delete(vehicleId);
    await _compatBox.delete(vehicleId);
  }

  @override
  Future<void> saveSpecification(String vehicleId, VehicleSpecification spec) async {
    await _specBox.put(vehicleId, jsonEncode(spec.toJson()));
  }

  @override
  Future<VehicleSpecification?> getSpecification(String vehicleId) async {
    final raw = _specBox.get(vehicleId);
    if (raw == null) return null;
    try {
      return VehicleSpecification.fromJson(jsonDecode(raw));
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> addMaintenanceRecord(String vehicleId, MaintenanceRecord record) async {
    final history = await getMaintenanceRecords(vehicleId);
    history.add(record);
    await _recordBox.put(vehicleId, jsonEncode(history.map((r) => r.toJson()).toList()));
  }

  @override
  Future<List<MaintenanceRecord>> getMaintenanceRecords(String vehicleId) async {
    final raw = _recordBox.get(vehicleId);
    if (raw == null) return [];
    try {
      final List list = jsonDecode(raw);
      return list.map((e) => MaintenanceRecord.fromJson(e)).toList();
    } catch (_) {
      return [];
    }
  }

  @override
  Future<void> saveReminders(String vehicleId, List<ServiceReminder> reminders) async {
    await _reminderBox.put(vehicleId, jsonEncode(reminders.map((r) => r.toJson()).toList()));
  }

  @override
  Future<List<ServiceReminder>> getReminders(String vehicleId) async {
    final raw = _reminderBox.get(vehicleId);
    if (raw == null) return [];
    try {
      final List list = jsonDecode(raw);
      return list.map((e) => ServiceReminder.fromJson(e)).toList();
    } catch (_) {
      return [];
    }
  }

  @override
  Future<void> saveCompatibilityProfile(String vehicleId, CompatibilityProfile profile) async {
    await _compatBox.put(vehicleId, jsonEncode(profile.toJson()));
  }

  @override
  Future<CompatibilityProfile?> getCompatibilityProfile(String vehicleId) async {
    final raw = _compatBox.get(vehicleId);
    if (raw == null) return null;
    try {
      return CompatibilityProfile.fromJson(jsonDecode(raw));
    } catch (_) {
      return null;
    }
  }
}
