// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'obd_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ObdCommandImpl _$$ObdCommandImplFromJson(Map<String, dynamic> json) =>
    _$ObdCommandImpl(
      command: json['command'] as String,
      type: json['type'] as String,
      priority: (json['priority'] as num?)?.toInt() ?? 2,
      timeout: (json['timeout'] as num?)?.toInt() ?? 3000,
      retryCount: (json['retryCount'] as num?)?.toInt() ?? 3,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$ObdCommandImplToJson(_$ObdCommandImpl instance) =>
    <String, dynamic>{
      'command': instance.command,
      'type': instance.type,
      'priority': instance.priority,
      'timeout': instance.timeout,
      'retryCount': instance.retryCount,
      'createdAt': instance.createdAt.toIso8601String(),
    };
