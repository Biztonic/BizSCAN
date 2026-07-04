// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_reminder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceReminderImpl _$$ServiceReminderImplFromJson(
  Map<String, dynamic> json,
) => _$ServiceReminderImpl(
  reminderId: json['reminderId'] as String,
  title: json['title'] as String,
  dueDate: DateTime.parse(json['dueDate'] as String),
  dueKm: (json['dueKm'] as num).toInt(),
  urgency: json['urgency'] as String? ?? 'routine',
  completed: json['completed'] as bool? ?? false,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$$ServiceReminderImplToJson(
  _$ServiceReminderImpl instance,
) => <String, dynamic>{
  'reminderId': instance.reminderId,
  'title': instance.title,
  'dueDate': instance.dueDate.toIso8601String(),
  'dueKm': instance.dueKm,
  'urgency': instance.urgency,
  'completed': instance.completed,
  'createdAt': instance.createdAt.toIso8601String(),
};
