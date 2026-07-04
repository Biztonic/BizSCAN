// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'obd_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ObdSessionImpl _$$ObdSessionImplFromJson(Map<String, dynamic> json) =>
    _$ObdSessionImpl(
      sessionId: json['sessionId'] as String,
      transportType: json['transportType'] as String,
      deviceName: json['deviceName'] as String,
      protocol: json['protocol'] as String,
      connectedAt: DateTime.parse(json['connectedAt'] as String),
      disconnectedAt:
          json['disconnectedAt'] == null
              ? null
              : DateTime.parse(json['disconnectedAt'] as String),
      firmwareVersion: json['firmwareVersion'] as String?,
      adapterVersion: json['adapterVersion'] as String?,
      latency: (json['latency'] as num).toInt(),
      connectionQuality: json['connectionQuality'] as String,
    );

Map<String, dynamic> _$$ObdSessionImplToJson(_$ObdSessionImpl instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'transportType': instance.transportType,
      'deviceName': instance.deviceName,
      'protocol': instance.protocol,
      'connectedAt': instance.connectedAt.toIso8601String(),
      'disconnectedAt': instance.disconnectedAt?.toIso8601String(),
      'firmwareVersion': instance.firmwareVersion,
      'adapterVersion': instance.adapterVersion,
      'latency': instance.latency,
      'connectionQuality': instance.connectionQuality,
    };
