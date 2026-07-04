// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_pid.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LivePidImpl _$$LivePidImplFromJson(Map<String, dynamic> json) =>
    _$LivePidImpl(
      pid: json['pid'] as String,
      name: json['name'] as String,
      value: (json['value'] as num).toDouble(),
      unit: json['unit'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      isSupported: json['isSupported'] as bool,
    );

Map<String, dynamic> _$$LivePidImplToJson(_$LivePidImpl instance) =>
    <String, dynamic>{
      'pid': instance.pid,
      'name': instance.name,
      'value': instance.value,
      'unit': instance.unit,
      'timestamp': instance.timestamp.toIso8601String(),
      'isSupported': instance.isSupported,
    };
