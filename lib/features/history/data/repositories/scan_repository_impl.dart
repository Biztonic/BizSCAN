import 'dart:convert';
import 'package:hive_ce/hive_ce.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/result.dart';
import '../../../../core/services/firestore_service.dart';
import '../../../../core/services/logging_service.dart';
import '../../domain/models/scan_session.dart';
import '../../domain/repositories/scan_repository.dart';

class ScanRepositoryImpl implements ScanRepository {
  final Box<String> _scanBox;
  final Box<String> _syncQueueBox;
  final FirestoreService _firestoreService;
  final LoggingService _logger;

  ScanRepositoryImpl(
    this._scanBox,
    this._syncQueueBox,
    this._firestoreService,
    this._logger,
  );

  List<ScanSession> _readAllFromBox() {
    final list = <ScanSession>[];
    for (final key in _scanBox.keys) {
      final jsonStr = _scanBox.get(key);
      if (jsonStr != null) {
        try {
          list.add(ScanSession.fromJson(json.decode(jsonStr)));
        } catch (e) {
          _logger.error('Error deserializing cached scan: $e');
        }
      }
    }
    list.sort((a, b) => b.startedAt.compareTo(a.startedAt));
    return list;
  }

  @override
  Future<Result<ScanSession>> createScan(ScanSession scan) async {
    try {
      final jsonStr = json.encode(scan.toJson());
      await _scanBox.put(scan.scanId, jsonStr);

      final queueItem = {
        'id': scan.scanId,
        'type': 'scan_session',
        'action': 'create',
        'data': scan.toJson(),
        'timestamp': DateTime.now().toIso8601String(),
      };
      await _syncQueueBox.put('scan_${scan.scanId}', json.encode(queueItem));

      return Result.success(scan);
    } catch (e) {
      return Result.failure(CacheFailure('Local write failed: $e'));
    }
  }

  @override
  Future<Result<ScanSession>> updateScan(ScanSession scan) async {
    try {
      final jsonStr = json.encode(scan.toJson());
      await _scanBox.put(scan.scanId, jsonStr);

      final queueItem = {
        'id': scan.scanId,
        'type': 'scan_session',
        'action': 'update',
        'data': scan.toJson(),
        'timestamp': DateTime.now().toIso8601String(),
      };
      await _syncQueueBox.put('scan_${scan.scanId}', json.encode(queueItem));

      return Result.success(scan);
    } catch (e) {
      return Result.failure(CacheFailure('Local update failed: $e'));
    }
  }

  @override
  Future<Result<ScanSession?>> getScan(String scanId) async {
    try {
      final jsonStr = _scanBox.get(scanId);
      if (jsonStr != null) {
        return Result.success(ScanSession.fromJson(json.decode(jsonStr)));
      }
      return const Result.success(null);
    } catch (e) {
      return Result.failure(CacheFailure('Local read failed: $e'));
    }
  }

  @override
  Stream<List<ScanSession>> watchHistory() async* {
    yield _readAllFromBox();
    await for (final _ in _scanBox.watch()) {
      yield _readAllFromBox();
    }
  }

  @override
  Future<Result<List<ScanSession>>> searchScans({
    String? vehicleId,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      var list = _readAllFromBox();
      if (vehicleId != null && vehicleId.trim().isNotEmpty) {
        list = list.where((s) => s.vehicleId == vehicleId).toList();
      }
      if (startDate != null) {
        list = list.where((s) => s.startedAt.isAfter(startDate)).toList();
      }
      if (endDate != null) {
        list = list.where((s) => s.startedAt.isBefore(endDate)).toList();
      }
      return Result.success(list);
    } catch (e) {
      return Result.failure(CacheFailure('Search scans failed: $e'));
    }
  }

  @override
  Future<Result<void>> syncScans() async {
    try {
      final result = await _firestoreService.getCollection('scan_sessions');
      if (result.isSuccess) {
        final cloudDocs = result.getOrNull ?? [];
        for (final doc in cloudDocs) {
          final scan = ScanSession.fromJson(doc);
          if (!_syncQueueBox.containsKey('scan_${scan.scanId}')) {
            await _scanBox.put(scan.scanId, json.encode(scan.toJson()));
          }
        }
      }
      return const Result.success(null);
    } catch (e) {
      return Result.failure(ServerFailure('Sync scans failed: $e'));
    }
  }
}
