// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScanSessionImpl _$$ScanSessionImplFromJson(Map<String, dynamic> json) =>
    _$ScanSessionImpl(
      scanId: json['scanId'] as String,
      vehicleId: json['vehicleId'] as String,
      userId: json['userId'] as String,
      startedAt: DateTime.parse(json['startedAt'] as String),
      completedAt:
          json['completedAt'] == null
              ? null
              : DateTime.parse(json['completedAt'] as String),
      connectionType: json['connectionType'] as String,
      bluetoothDevice: json['bluetoothDevice'] as String?,
      protocol: json['protocol'] as String,
      scanDuration: (json['scanDuration'] as num).toInt(),
      firmwareVersion: json['firmwareVersion'] as String?,
      appVersion: json['appVersion'] as String,
      isSynced: json['isSynced'] as bool,
    );

Map<String, dynamic> _$$ScanSessionImplToJson(_$ScanSessionImpl instance) =>
    <String, dynamic>{
      'scanId': instance.scanId,
      'vehicleId': instance.vehicleId,
      'userId': instance.userId,
      'startedAt': instance.startedAt.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'connectionType': instance.connectionType,
      'bluetoothDevice': instance.bluetoothDevice,
      'protocol': instance.protocol,
      'scanDuration': instance.scanDuration,
      'firmwareVersion': instance.firmwareVersion,
      'appVersion': instance.appVersion,
      'isSynced': instance.isSynced,
    };
