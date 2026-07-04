import '../models/service_reminder.dart';
import '../models/service_schedule.dart';

class MaintenanceScheduler {
  List<ServiceSchedule> getDefaultSchedules() {
    return const [
      ServiceSchedule(
        serviceId: 'SCH_OIL',
        intervalKm: 10000,
        intervalMonths: 12,
        title: 'Engine Oil & Filter Service',
        description: 'Replace synthetic engine oil and oil filter element.',
        priority: 1,
        estimatedCost: '₹2,500 - ₹4,500',
        estimatedTime: '45 mins',
        diyPossible: true,
      ),
      ServiceSchedule(
        serviceId: 'SCH_AIR_FILTER',
        intervalKm: 15000,
        intervalMonths: 12,
        title: 'Engine Air Filter Replacement',
        description: 'Clean or replace engine intake air filter element.',
        priority: 2,
        estimatedCost: '₹500 - ₹1,200',
        estimatedTime: '15 mins',
        diyPossible: true,
      ),
      ServiceSchedule(
        serviceId: 'SCH_SPARK_PLUGS',
        intervalKm: 40000,
        intervalMonths: 24,
        title: 'Spark Plug Replacement',
        description: 'Replace Iridium / Platinum spark plugs to prevent cylinder misfires.',
        priority: 2,
        estimatedCost: '₹1,500 - ₹3,500',
        estimatedTime: '45 mins',
        diyPossible: true,
      ),
      ServiceSchedule(
        serviceId: 'SCH_BRAKE_FLUID',
        intervalKm: 30000,
        intervalMonths: 24,
        title: 'Brake Fluid Flush',
        description: 'Flush and bleed hydraulic DOT 4 brake fluid.',
        priority: 1,
        estimatedCost: '₹1,200 - ₹2,500',
        estimatedTime: '60 mins',
        diyPossible: false,
      ),
      ServiceSchedule(
        serviceId: 'SCH_COOLANT',
        intervalKm: 50000,
        intervalMonths: 36,
        title: 'Engine Coolant Flush',
        description: 'Flush radiator and replace organic acid technology (OAT) coolant.',
        priority: 1,
        estimatedCost: '₹1,800 - ₹3,800',
        estimatedTime: '60 mins',
        diyPossible: false,
      ),
    ];
  }

  List<ServiceReminder> calculateReminders({
    required int currentOdometerKm,
    required DateTime lastServiceDate,
    required int lastServiceKm,
  }) {
    final reminders = <ServiceReminder>[];
    final schedules = getDefaultSchedules();
    final now = DateTime.now();

    for (final sch in schedules) {
      final targetKm = lastServiceKm + sch.intervalKm;
      final targetDate = lastServiceDate.add(Duration(days: sch.intervalMonths * 30));

      final kmRemaining = targetKm - currentOdometerKm;
      final isOverdue = currentOdometerKm >= targetKm || now.isAfter(targetDate);

      String urgency = 'routine';
      if (isOverdue) {
        urgency = 'overdue';
      } else if (kmRemaining <= 1000) {
        urgency = 'immediate';
      } else if (kmRemaining <= 3000) {
        urgency = 'soon';
      }

      reminders.add(ServiceReminder(
        reminderId: 'REM_${sch.serviceId}',
        title: sch.title,
        dueDate: targetDate,
        dueKm: targetKm,
        urgency: urgency,
        completed: false,
        createdAt: now,
      ));
    }

    return reminders;
  }
}
