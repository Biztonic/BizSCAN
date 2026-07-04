// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleProfileImpl _$$VehicleProfileImplFromJson(
  Map<String, dynamic> json,
) => _$VehicleProfileImpl(
  vehicleId: json['vehicleId'] as String,
  vin: json['vin'] as String,
  manufacturer: json['manufacturer'] as String,
  brand: json['brand'] as String,
  model: json['model'] as String,
  generation: json['generation'] as String? ?? '',
  variant: json['variant'] as String? ?? '',
  bodyType: json['bodyType'] as String? ?? 'Sedan',
  modelYear: (json['modelYear'] as num).toInt(),
  engineCode: json['engineCode'] as String,
  engineType: json['engineType'] as String? ?? 'In-Line 4',
  displacement: json['displacement'] as String? ?? '2.0L',
  fuelType: json['fuelType'] as String? ?? 'Petrol',
  transmission: json['transmission'] as String? ?? 'Automatic',
  drivetrain: json['drivetrain'] as String? ?? 'FWD',
  emissionStandard: json['emissionStandard'] as String? ?? 'Euro 6',
  obdProtocol: json['obdProtocol'] as String? ?? 'ISO 15765-4 (CAN 11bit 500k)',
  ecuList:
      (json['ecuList'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const ['ECU_ENGINE', 'ECU_TRANSMISSION', 'ECU_ABS', 'ECU_AIRBAG'],
  batteryType: json['batteryType'] as String? ?? '12V Lead-Acid',
  countryOfOrigin: json['countryOfOrigin'] as String? ?? 'India',
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$$VehicleProfileImplToJson(
  _$VehicleProfileImpl instance,
) => <String, dynamic>{
  'vehicleId': instance.vehicleId,
  'vin': instance.vin,
  'manufacturer': instance.manufacturer,
  'brand': instance.brand,
  'model': instance.model,
  'generation': instance.generation,
  'variant': instance.variant,
  'bodyType': instance.bodyType,
  'modelYear': instance.modelYear,
  'engineCode': instance.engineCode,
  'engineType': instance.engineType,
  'displacement': instance.displacement,
  'fuelType': instance.fuelType,
  'transmission': instance.transmission,
  'drivetrain': instance.drivetrain,
  'emissionStandard': instance.emissionStandard,
  'obdProtocol': instance.obdProtocol,
  'ecuList': instance.ecuList,
  'batteryType': instance.batteryType,
  'countryOfOrigin': instance.countryOfOrigin,
  'createdAt': instance.createdAt.toIso8601String(),
};
