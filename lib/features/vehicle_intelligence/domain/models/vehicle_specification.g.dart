// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_specification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleSpecificationImpl _$$VehicleSpecificationImplFromJson(
  Map<String, dynamic> json,
) => _$VehicleSpecificationImpl(
  engineOilCapacity:
      json['engineOilCapacity'] as String? ?? '4.0 Litres (5W-30)',
  coolantCapacity: json['coolantCapacity'] as String? ?? '6.5 Litres',
  transmissionFluidCapacity:
      json['transmissionFluidCapacity'] as String? ?? '7.2 Litres (ATF WS)',
  brakeFluidSpecification:
      json['brakeFluidSpecification'] as String? ?? 'DOT 4',
  powerSteeringFluid:
      json['powerSteeringFluid'] as String? ?? 'Electric Power Steering (EPS)',
  fuelTankCapacity: json['fuelTankCapacity'] as String? ?? '50 Litres',
  batteryCapacity: json['batteryCapacity'] as String? ?? '12V 60Ah',
  tyrePressureFront: json['tyrePressureFront'] as String? ?? '32 PSI (2.2 Bar)',
  tyrePressureRear: json['tyrePressureRear'] as String? ?? '30 PSI (2.1 Bar)',
  wheelSize: json['wheelSize'] as String? ?? '205/55 R16',
  idleRPM: (json['idleRPM'] as num?)?.toInt() ?? 750,
  redlineRPM: (json['redlineRPM'] as num?)?.toInt() ?? 6500,
);

Map<String, dynamic> _$$VehicleSpecificationImplToJson(
  _$VehicleSpecificationImpl instance,
) => <String, dynamic>{
  'engineOilCapacity': instance.engineOilCapacity,
  'coolantCapacity': instance.coolantCapacity,
  'transmissionFluidCapacity': instance.transmissionFluidCapacity,
  'brakeFluidSpecification': instance.brakeFluidSpecification,
  'powerSteeringFluid': instance.powerSteeringFluid,
  'fuelTankCapacity': instance.fuelTankCapacity,
  'batteryCapacity': instance.batteryCapacity,
  'tyrePressureFront': instance.tyrePressureFront,
  'tyrePressureRear': instance.tyrePressureRear,
  'wheelSize': instance.wheelSize,
  'idleRPM': instance.idleRPM,
  'redlineRPM': instance.redlineRPM,
};
