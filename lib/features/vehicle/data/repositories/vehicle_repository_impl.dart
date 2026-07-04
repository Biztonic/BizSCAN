import 'dart:convert';
import 'package:hive_ce/hive_ce.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/result.dart';
import '../../../../core/services/firestore_service.dart';
import '../../../../core/services/logging_service.dart';
import '../../domain/models/vehicle.dart';
import '../../domain/repositories/vehicle_repository.dart';

class VehicleRepositoryImpl implements VehicleRepository {
  final Box<String> _vehicleBox;
  final Box<String> _syncQueueBox;
  final FirestoreService _firestoreService;
  final LoggingService _logger;

  VehicleRepositoryImpl(
    this._vehicleBox,
    this._syncQueueBox,
    this._firestoreService,
    this._logger,
  );

  List<Vehicle> _readAllFromBox() {
    final list = <Vehicle>[];
    for (final key in _vehicleBox.keys) {
      final jsonStr = _vehicleBox.get(key);
      if (jsonStr != null) {
        try {
          list.add(Vehicle.fromJson(json.decode(jsonStr)));
        } catch (e) {
          _logger.error('Error deserializing cached vehicle: $e');
        }
      }
    }
    return list;
  }

  @override
  Future<Result<Vehicle>> createVehicle(Vehicle vehicle) async {
    try {
      final jsonStr = json.encode(vehicle.toJson());
      await _vehicleBox.put(vehicle.vehicleId, jsonStr);
      
      final queueItem = {
        'id': vehicle.vehicleId,
        'type': 'vehicle',
        'action': 'create',
        'data': vehicle.toJson(),
        'timestamp': DateTime.now().toIso8601String(),
      };
      await _syncQueueBox.put('vehicle_${vehicle.vehicleId}', json.encode(queueItem));

      return Result.success(vehicle);
    } catch (e) {
      return Result.failure(CacheFailure('Local write failed: $e'));
    }
  }

  @override
  Future<Result<Vehicle>> updateVehicle(Vehicle vehicle) async {
    try {
      final jsonStr = json.encode(vehicle.toJson());
      await _vehicleBox.put(vehicle.vehicleId, jsonStr);
      
      final queueItem = {
        'id': vehicle.vehicleId,
        'type': 'vehicle',
        'action': 'update',
        'data': vehicle.toJson(),
        'timestamp': DateTime.now().toIso8601String(),
      };
      await _syncQueueBox.put('vehicle_${vehicle.vehicleId}', json.encode(queueItem));

      return Result.success(vehicle);
    } catch (e) {
      return Result.failure(CacheFailure('Local update failed: $e'));
    }
  }

  @override
  Future<Result<void>> deleteVehicle(String vehicleId) async {
    try {
      await _vehicleBox.delete(vehicleId);
      
      final queueItem = {
        'id': vehicleId,
        'type': 'vehicle',
        'action': 'delete',
        'data': null,
        'timestamp': DateTime.now().toIso8601String(),
      };
      await _syncQueueBox.put('vehicle_del_$vehicleId', json.encode(queueItem));

      return const Result.success(null);
    } catch (e) {
      return Result.failure(CacheFailure('Local delete failed: $e'));
    }
  }

  @override
  Future<Result<Vehicle?>> getVehicle(String vehicleId) async {
    try {
      final jsonStr = _vehicleBox.get(vehicleId);
      if (jsonStr != null) {
        return Result.success(Vehicle.fromJson(json.decode(jsonStr)));
      }
      return const Result.success(null);
    } catch (e) {
      return Result.failure(CacheFailure('Local read failed: $e'));
    }
  }

  @override
  Future<Result<List<Vehicle>>> searchVehicles({String? query, String? manufacturer, String? vin}) async {
    try {
      var list = _readAllFromBox();
      if (query != null && query.trim().isNotEmpty) {
        final q = query.toLowerCase();
        list = list.where((v) =>
            v.nickname.toLowerCase().contains(q) ||
            v.model.toLowerCase().contains(q) ||
            v.manufacturer.toLowerCase().contains(q)).toList();
      }
      if (manufacturer != null && manufacturer.trim().isNotEmpty) {
        final m = manufacturer.toLowerCase();
        list = list.where((v) => v.manufacturer.toLowerCase() == m).toList();
      }
      if (vin != null && vin.trim().isNotEmpty) {
        final vStr = vin.toLowerCase();
        list = list.where((v) => v.vin.toLowerCase().contains(vStr)).toList();
      }
      return Result.success(list);
    } catch (e) {
      return Result.failure(CacheFailure('Search failed: $e'));
    }
  }

  @override
  Stream<List<Vehicle>> watchVehicles() async* {
    yield _readAllFromBox();
    await for (final _ in _vehicleBox.watch()) {
      yield _readAllFromBox();
    }
  }

  @override
  Future<Result<void>> syncVehicles() async {
    try {
      final result = await _firestoreService.getCollection('vehicles');
      if (result.isSuccess) {
        final cloudDocs = result.getOrNull ?? [];
        for (final doc in cloudDocs) {
          final vehicle = Vehicle.fromJson(doc);
          if (!_syncQueueBox.containsKey('vehicle_${vehicle.vehicleId}')) {
            await _vehicleBox.put(vehicle.vehicleId, json.encode(vehicle.toJson()));
          }
        }
      }
      return const Result.success(null);
    } catch (e) {
      return Result.failure(ServerFailure('Sync vehicles failed: $e'));
    }
  }
}
