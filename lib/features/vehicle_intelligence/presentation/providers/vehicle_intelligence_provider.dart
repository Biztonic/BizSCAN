import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/di_service.dart';
import '../../domain/models/compatibility_profile.dart';
import '../../domain/models/service_reminder.dart';
import '../../domain/models/vehicle_profile.dart';
import '../../domain/models/vehicle_specification.dart';
import '../../domain/repositories/vehicle_profile_repository.dart';
import '../../domain/services/compatibility_engine.dart';
import '../../domain/services/maintenance_scheduler.dart';
import '../../domain/services/vehicle_specification_engine.dart';
import '../../domain/services/vin_decoder_engine.dart';

final vehicleProfileRepositoryProvider = Provider<VehicleProfileRepository>((ref) {
  return sl<VehicleProfileRepository>();
});

final vinDecoderEngineProvider = Provider<VinDecoderEngine>((ref) {
  return sl<VinDecoderEngine>();
});

final vehicleSpecificationEngineProvider = Provider<VehicleSpecificationEngine>((ref) {
  return sl<VehicleSpecificationEngine>();
});

final maintenanceSchedulerProvider = Provider<MaintenanceScheduler>((ref) {
  return sl<MaintenanceScheduler>();
});

final compatibilityEngineProvider = Provider<CompatibilityEngine>((ref) {
  return sl<CompatibilityEngine>();
});

final currentVehicleProvider = FutureProvider<VehicleProfile?>((ref) async {
  final repo = ref.watch(vehicleProfileRepositoryProvider);
  return repo.getActiveVehicle();
});

final vehicleSpecificationsProvider = FutureProvider<VehicleSpecification>((ref) async {
  final activeVehicle = await ref.watch(currentVehicleProvider.future);
  if (activeVehicle == null) return const VehicleSpecification();
  final engine = ref.watch(vehicleSpecificationEngineProvider);
  return engine.getSpecifications(activeVehicle);
});

final serviceReminderProvider = FutureProvider<List<ServiceReminder>>((ref) async {
  final scheduler = ref.watch(maintenanceSchedulerProvider);
  return scheduler.calculateReminders(
    currentOdometerKm: 45000,
    lastServiceDate: DateTime.now().subtract(const Duration(days: 300)),
    lastServiceKm: 35000,
  );
});

final compatibilityProvider = FutureProvider<CompatibilityProfile>((ref) async {
  final engine = ref.watch(compatibilityEngineProvider);
  return engine.evaluateCompatibility(
    protocol: 'ISO 15765-4 (CAN 11bit 500k)',
    supportedPidsHex: '4100BE3FA813',
  );
});
