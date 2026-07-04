// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaintenanceRecordImpl _$$MaintenanceRecordImplFromJson(
  Map<String, dynamic> json,
) => _$MaintenanceRecordImpl(
  serviceId: json['serviceId'] as String,
  performedDate: DateTime.parse(json['performedDate'] as String),
  odometer: (json['odometer'] as num).toInt(),
  workshop: json['workshop'] as String? ?? 'Authorized Service Station',
  notes: json['notes'] as String? ?? '',
  invoiceNumber: json['invoiceNumber'] as String? ?? '',
  nextDueKm: (json['nextDueKm'] as num).toInt(),
  nextDueDate: DateTime.parse(json['nextDueDate'] as String),
);

Map<String, dynamic> _$$MaintenanceRecordImplToJson(
  _$MaintenanceRecordImpl instance,
) => <String, dynamic>{
  'serviceId': instance.serviceId,
  'performedDate': instance.performedDate.toIso8601String(),
  'odometer': instance.odometer,
  'workshop': instance.workshop,
  'notes': instance.notes,
  'invoiceNumber': instance.invoiceNumber,
  'nextDueKm': instance.nextDueKm,
  'nextDueDate': instance.nextDueDate.toIso8601String(),
};
