import '../models/vehicle_specification.dart';

class VehicleDatabase {
  VehicleSpecification getSpecificationForModel(String brand, String model) {
    final b = brand.toLowerCase();

    if (b.contains('honda')) {
      return const VehicleSpecification(
        engineOilCapacity: '3.7 Litres (0W-20)',
        coolantCapacity: '5.4 Litres',
        transmissionFluidCapacity: '3.5 Litres (CVT HCF-2)',
        brakeFluidSpecification: 'DOT 4',
        powerSteeringFluid: 'Electric Power Steering',
        fuelTankCapacity: '40 Litres',
        batteryCapacity: '12V 45Ah',
        tyrePressureFront: '32 PSI',
        tyrePressureRear: '30 PSI',
        wheelSize: '185/60 R15',
        idleRPM: 750,
        redlineRPM: 6600,
      );
    } else if (b.contains('maruti') || b.contains('suzuki')) {
      return const VehicleSpecification(
        engineOilCapacity: '3.1 Litres (5W-30)',
        coolantCapacity: '4.5 Litres',
        transmissionFluidCapacity: '2.2 Litres (75W-90)',
        brakeFluidSpecification: 'DOT 3',
        powerSteeringFluid: 'Electric Power Steering',
        fuelTankCapacity: '37 Litres',
        batteryCapacity: '12V 35Ah',
        tyrePressureFront: '33 PSI',
        tyrePressureRear: '33 PSI',
        wheelSize: '165/80 R14',
        idleRPM: 800,
        redlineRPM: 6200,
      );
    }

    // Default universal specification fallback
    return const VehicleSpecification();
  }
}
