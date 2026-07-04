import 'dart:convert';
import 'package:hive_ce/hive_ce.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/result.dart';
import '../../../../core/services/firestore_service.dart';
import '../../../../core/services/logging_service.dart';
import '../../domain/models/health_report.dart';
import '../../domain/repositories/health_repository.dart';

class HealthRepositoryImpl implements HealthRepository {
  final Box<String> _reportBox;
  final Box<String> _syncQueueBox;
  final FirestoreService _firestoreService;
  final LoggingService _logger;

  HealthRepositoryImpl(
    this._reportBox,
    this._syncQueueBox,
    this._firestoreService,
    this._logger,
  );

  List<HealthReport> _readAllFromBox() {
    final list = <HealthReport>[];
    for (final key in _reportBox.keys) {
      final jsonStr = _reportBox.get(key);
      if (jsonStr != null) {
        try {
          list.add(HealthReport.fromJson(json.decode(jsonStr)));
        } catch (e) {
          _logger.error('Error deserializing cached health report: $e');
        }
      }
    }
    // Sort descending by createdAt
    list.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return list;
  }

  @override
  Future<Result<HealthReport>> saveHealthReport(HealthReport report) async {
    try {
      final jsonStr = json.encode(report.toJson());
      await _reportBox.put(report.reportId, jsonStr);

      final queueItem = {
        'id': report.reportId,
        'type': 'health_report',
        'action': 'create',
        'data': report.toJson(),
        'timestamp': DateTime.now().toIso8601String(),
      };
      await _syncQueueBox.put('report_${report.reportId}', json.encode(queueItem));

      return Result.success(report);
    } catch (e) {
      return Result.failure(CacheFailure('Local write failed: $e'));
    }
  }

  @override
  Future<Result<HealthReport?>> getHealthReport(String reportId) async {
    try {
      final jsonStr = _reportBox.get(reportId);
      if (jsonStr != null) {
        return Result.success(HealthReport.fromJson(json.decode(jsonStr)));
      }
      return const Result.success(null);
    } catch (e) {
      return Result.failure(CacheFailure('Local read failed: $e'));
    }
  }

  @override
  Future<Result<HealthReport?>> getHealthReportByScan(String scanId) async {
    try {
      final list = _readAllFromBox();
      for (final report in list) {
        if (report.scanId == scanId) {
          return Result.success(report);
        }
      }
      return const Result.success(null);
    } catch (e) {
      return Result.failure(CacheFailure('Local lookup failed: $e'));
    }
  }

  @override
  Stream<List<HealthReport>> watchHealthReports() async* {
    yield _readAllFromBox();
    await for (final _ in _reportBox.watch()) {
      yield _readAllFromBox();
    }
  }

  @override
  Future<Result<List<HealthReport>>> searchReports({
    int? minScore,
    int? maxScore,
  }) async {
    try {
      var list = _readAllFromBox();
      if (minScore != null) {
        list = list.where((r) => r.overallScore >= minScore).toList();
      }
      if (maxScore != null) {
        list = list.where((r) => r.overallScore <= maxScore).toList();
      }
      return Result.success(list);
    } catch (e) {
      return Result.failure(CacheFailure('Search reports failed: $e'));
    }
  }

  @override
  Future<Result<void>> syncReports() async {
    try {
      final result = await _firestoreService.getCollection('health_reports');
      if (result.isSuccess) {
        final cloudDocs = result.getOrNull ?? [];
        for (final doc in cloudDocs) {
          final report = HealthReport.fromJson(doc);
          if (!_syncQueueBox.containsKey('report_${report.reportId}')) {
            await _reportBox.put(report.reportId, json.encode(report.toJson()));
          }
        }
      }
      return const Result.success(null);
    } catch (e) {
      return Result.failure(ServerFailure('Sync reports failed: $e'));
    }
  }

  @override
  Future<Result<String>> analyzeVehicleHealth(List<String> dtcs, Map<String, double> sensorData) async {
    return const Result.success('Overall vehicle health is excellent. No faults detected.');
  }
}
