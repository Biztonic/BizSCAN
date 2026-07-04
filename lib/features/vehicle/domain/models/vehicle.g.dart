// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleImpl _$$VehicleImplFromJson(Map<String, dynamic> json) =>
    _$VehicleImpl(
      vehicleId: json['vehicleId'] as String,
      ownerId: json['ownerId'] as String,
      nickname: json['nickname'] as String,
      manufacturer: json['manufacturer'] as String,
      model: json['model'] as String,
      year: (json['year'] as num).toInt(),
      fuelType: json['fuelType'] as String,
      engineCapacity: (json['engineCapacity'] as num).toDouble(),
      vin: json['vin'] as String,
      registrationNumber: json['registrationNumber'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$VehicleImplToJson(_$VehicleImpl instance) =>
    <String, dynamic>{
      'vehicleId': instance.vehicleId,
      'ownerId': instance.ownerId,
      'nickname': instance.nickname,
      'manufacturer': instance.manufacturer,
      'model': instance.model,
      'year': instance.year,
      'fuelType': instance.fuelType,
      'engineCapacity': instance.engineCapacity,
      'vin': instance.vin,
      'registrationNumber': instance.registrationNumber,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
