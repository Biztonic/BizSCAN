// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elm327_adapter_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Elm327AdapterProfileImpl _$$Elm327AdapterProfileImplFromJson(
  Map<String, dynamic> json,
) => _$Elm327AdapterProfileImpl(
  adapterName: json['adapterName'] as String,
  firmwareVersion: json['firmwareVersion'] as String,
  voltage: json['voltage'] as String? ?? '12.0V',
  protocol: json['protocol'] as String,
  capabilities:
      (json['capabilities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  isClone: json['isClone'] as bool? ?? false,
  cloneScore: (json['cloneScore'] as num?)?.toInt() ?? 0,
  supportedCommands:
      (json['supportedCommands'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  responseDelayMs: (json['responseDelayMs'] as num?)?.toInt() ?? 20,
  maxBuffer: (json['maxBuffer'] as num?)?.toInt() ?? 512,
  successRate: (json['successRate'] as num?)?.toDouble() ?? 1.0,
  avgLatencyMs: (json['avgLatencyMs'] as num?)?.toInt() ?? 30,
  initTimeMs: (json['initTimeMs'] as num?)?.toInt() ?? 1500,
  lastSeen: DateTime.parse(json['lastSeen'] as String),
);

Map<String, dynamic> _$$Elm327AdapterProfileImplToJson(
  _$Elm327AdapterProfileImpl instance,
) => <String, dynamic>{
  'adapterName': instance.adapterName,
  'firmwareVersion': instance.firmwareVersion,
  'voltage': instance.voltage,
  'protocol': instance.protocol,
  'capabilities': instance.capabilities,
  'isClone': instance.isClone,
  'cloneScore': instance.cloneScore,
  'supportedCommands': instance.supportedCommands,
  'responseDelayMs': instance.responseDelayMs,
  'maxBuffer': instance.maxBuffer,
  'successRate': instance.successRate,
  'avgLatencyMs': instance.avgLatencyMs,
  'initTimeMs': instance.initTimeMs,
  'lastSeen': instance.lastSeen.toIso8601String(),
};
