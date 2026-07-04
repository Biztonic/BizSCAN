// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceScheduleImpl _$$ServiceScheduleImplFromJson(
  Map<String, dynamic> json,
) => _$ServiceScheduleImpl(
  serviceId: json['serviceId'] as String,
  intervalKm: (json['intervalKm'] as num).toInt(),
  intervalMonths: (json['intervalMonths'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  priority: (json['priority'] as num?)?.toInt() ?? 2,
  estimatedCost: json['estimatedCost'] as String? ?? '₹2,000 - ₹4,500',
  estimatedTime: json['estimatedTime'] as String? ?? '45 mins',
  diyPossible: json['diyPossible'] as bool? ?? true,
);

Map<String, dynamic> _$$ServiceScheduleImplToJson(
  _$ServiceScheduleImpl instance,
) => <String, dynamic>{
  'serviceId': instance.serviceId,
  'intervalKm': instance.intervalKm,
  'intervalMonths': instance.intervalMonths,
  'title': instance.title,
  'description': instance.description,
  'priority': instance.priority,
  'estimatedCost': instance.estimatedCost,
  'estimatedTime': instance.estimatedTime,
  'diyPossible': instance.diyPossible,
};
