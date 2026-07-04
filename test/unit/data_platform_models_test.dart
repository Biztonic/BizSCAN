import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/features/vehicle/domain/models/vehicle.dart';
import 'package:bizscan/features/history/domain/models/scan_session.dart';
import 'package:bizscan/features/health/domain/models/health_report.dart';
import 'package:bizscan/features/obd/domain/models/live_pid.dart';
import 'package:bizscan/features/settings/domain/models/settings_model.dart';
import 'package:bizscan/core/sync/domain/models/sync_log.dart';

void main() {
  group('Data Platform JSON Serialization Tests', () {
    test('Vehicle serialization & deserialization', () {
      final now = DateTime.now();
      final vehicle = Vehicle(
        vehicleId: 'v123',
        ownerId: 'u456',
        nickname: 'My Nexon',
        manufacturer: 'Tata',
        model: 'Nexon EV',
        year: 2023,
        fuelType: 'electric',
        engineCapacity: 0.0,
        vin: 'TATA1234567890123',
        registrationNumber: 'MH12AB1234',
        createdAt: now,
        updatedAt: now,
      );

      final jsonMap = vehicle.toJson();
      expect(jsonMap['vehicleId'], 'v123');
      expect(jsonMap['year'], 2023);

      final deserialized = Vehicle.fromJson(jsonMap);
      expect(deserialized.vehicleId, vehicle.vehicleId);
      expect(deserialized.nickname, vehicle.nickname);
      expect(deserialized.createdAt.toUtc(), vehicle.createdAt.toUtc());
    });

    test('ScanSession serialization & deserialization', () {
      final now = DateTime.now();
      final session = ScanSession(
        scanId: 's789',
        vehicleId: 'v123',
        userId: 'u456',
        startedAt: now,
        completedAt: now.add(const Duration(minutes: 5)),
        connectionType: 'bluetooth',
        bluetoothDevice: 'OBDII-Adapter',
        protocol: 'ISO15765-4',
        scanDuration: 300,
        firmwareVersion: 'v1.5',
        appVersion: '1.0.0',
        isSynced: false,
      );

      final jsonMap = session.toJson();
      expect(jsonMap['scanId'], 's789');
      expect(jsonMap['isSynced'], false);

      final deserialized = ScanSession.fromJson(jsonMap);
      expect(deserialized.scanId, session.scanId);
      expect(deserialized.scanDuration, 300);
    });

    test('HealthReport serialization & deserialization', () {
      final now = DateTime.now();
      final report = HealthReport(
        reportId: 'rep001',
        scanId: 's789',
        overallScore: 92,
        engineScore: 95,
        batteryScore: 88,
        coolingScore: 90,
        fuelScore: 94,
        emissionScore: 93,
        recommendations: ['Replace air filter', 'Inspect battery terminals'],
        createdAt: now,
        updatedAt: now,
      );

      final jsonMap = report.toJson();
      expect(jsonMap['overallScore'], 92);
      expect(jsonMap['recommendations'], isA<List>());

      final deserialized = HealthReport.fromJson(jsonMap);
      expect(deserialized.reportId, report.reportId);
      expect(deserialized.overallScore, report.overallScore);
      expect(deserialized.recommendations.length, 2);
    });

    test('LivePid serialization & deserialization', () {
      final now = DateTime.now();
      final pid = LivePid(
        pid: '0C',
        name: 'Engine RPM',
        value: 750.0,
        unit: 'RPM',
        timestamp: now,
        isSupported: true,
      );

      final jsonMap = pid.toJson();
      expect(jsonMap['pid'], '0C');
      expect(jsonMap['value'], 750.0);

      final deserialized = LivePid.fromJson(jsonMap);
      expect(deserialized.pid, pid.pid);
      expect(deserialized.value, pid.value);
    });

    test('SettingsModel serialization & deserialization', () {
      const settings = SettingsModel(
        language: 'hi',
        theme: 'dark',
        distanceUnit: 'imperial',
        temperatureUnit: 'fahrenheit',
        fuelUnit: 'gallons',
        notifications: false,
      );

      final jsonMap = settings.toJson();
      expect(jsonMap['language'], 'hi');
      expect(jsonMap['notifications'], false);

      final deserialized = SettingsModel.fromJson(jsonMap);
      expect(deserialized.language, settings.language);
      expect(deserialized.notifications, settings.notifications);
    });

    test('SyncLog serialization & deserialization', () {
      final now = DateTime.now();
      final log = SyncLog(
        logId: 'log999',
        entityType: 'vehicle',
        entityId: 'v123',
        actionType: 'create',
        timestamp: now,
        status: 'success',
      );

      final jsonMap = log.toJson();
      expect(jsonMap['logId'], 'log999');
      expect(jsonMap['status'], 'success');

      final deserialized = SyncLog.fromJson(jsonMap);
      expect(deserialized.logId, log.logId);
      expect(deserialized.status, log.status);
    });
  });
}
