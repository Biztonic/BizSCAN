import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/features/vehicle_intelligence/domain/models/vehicle_profile.dart';
import 'package:bizscan/features/vehicle_intelligence/domain/services/vehicle_specification_engine.dart';

void main() {
  group('VehicleSpecificationEngine Unit Tests', () {
    late VehicleSpecificationEngine engine;

    setUp(() {
      engine = VehicleSpecificationEngine();
    });

    test('getSpecifications returns brand-specific oil and coolant capacities for Honda', () {
      final profile = VehicleProfile(
        vehicleId: 'VEH_1',
        vin: '1HGCR2F83HA000000',
        manufacturer: 'Honda Motor Co.',
        brand: 'Honda',
        model: 'Civic',
        modelYear: 2017,
        engineCode: 'R18A',
        createdAt: DateTime.now(),
      );

      final spec = engine.getSpecifications(profile);

      expect(spec.engineOilCapacity, contains('0W-20'));
      expect(spec.coolantCapacity, contains('5.4 Litres'));
      expect(spec.tyrePressureFront, '32 PSI');
    });

    test('getSpecifications returns Suzuki specific capacities for Maruti Suzuki', () {
      final profile = VehicleProfile(
        vehicleId: 'VEH_2',
        vin: 'MA3FBA12S00100000',
        manufacturer: 'Maruti Suzuki India',
        brand: 'Maruti Suzuki',
        model: 'Swift',
        modelYear: 2020,
        engineCode: 'K12M',
        createdAt: DateTime.now(),
      );

      final spec = engine.getSpecifications(profile);

      expect(spec.engineOilCapacity, contains('5W-30'));
      expect(spec.fuelTankCapacity, '37 Litres');
    });
  });
}
