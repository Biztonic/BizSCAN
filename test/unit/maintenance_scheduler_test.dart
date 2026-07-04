import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/features/vehicle_intelligence/domain/services/maintenance_scheduler.dart';

void main() {
  group('MaintenanceScheduler Unit Tests', () {
    late MaintenanceScheduler scheduler;

    setUp(() {
      scheduler = MaintenanceScheduler();
    });

    test('getDefaultSchedules returns mandatory maintenance service items', () {
      final defaultList = scheduler.getDefaultSchedules();
      expect(defaultList.length, 5);
      expect(defaultList.any((s) => s.title.contains('Oil')), true);
      expect(defaultList.any((s) => s.title.contains('Coolant')), true);
    });

    test('calculateReminders flags overdue service when current odometer exceeds threshold', () {
      final reminders = scheduler.calculateReminders(
        currentOdometerKm: 50000,
        lastServiceDate: DateTime.now().subtract(const Duration(days: 400)),
        lastServiceKm: 35000,
      );

      expect(reminders.isNotEmpty, true);
      // Oil service interval is 10,000 km -> 35k + 10k = 45k, current 50k -> overdue!
      final oilRem = reminders.firstWhere((r) => r.reminderId.contains('SCH_OIL'));
      expect(oilRem.urgency, 'overdue');
    });
  });
}
