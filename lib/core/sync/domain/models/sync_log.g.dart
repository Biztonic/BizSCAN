// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SyncLogImpl _$$SyncLogImplFromJson(Map<String, dynamic> json) =>
    _$SyncLogImpl(
      logId: json['logId'] as String,
      entityType: json['entityType'] as String,
      entityId: json['entityId'] as String,
      actionType: json['actionType'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      status: json['status'] as String,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$$SyncLogImplToJson(_$SyncLogImpl instance) =>
    <String, dynamic>{
      'logId': instance.logId,
      'entityType': instance.entityType,
      'entityId': instance.entityId,
      'actionType': instance.actionType,
      'timestamp': instance.timestamp.toIso8601String(),
      'status': instance.status,
      'errorMessage': instance.errorMessage,
    };

_$ConflictLogImpl _$$ConflictLogImplFromJson(Map<String, dynamic> json) =>
    _$ConflictLogImpl(
      conflictId: json['conflictId'] as String,
      entityType: json['entityType'] as String,
      entityId: json['entityId'] as String,
      localVersion: json['localVersion'] as Map<String, dynamic>,
      cloudVersion: json['cloudVersion'] as Map<String, dynamic>,
      resolvedVersion: json['resolvedVersion'] as Map<String, dynamic>,
      timestamp: DateTime.parse(json['timestamp'] as String),
      resolutionStrategy: json['resolutionStrategy'] as String,
    );

Map<String, dynamic> _$$ConflictLogImplToJson(_$ConflictLogImpl instance) =>
    <String, dynamic>{
      'conflictId': instance.conflictId,
      'entityType': instance.entityType,
      'entityId': instance.entityId,
      'localVersion': instance.localVersion,
      'cloudVersion': instance.cloudVersion,
      'resolvedVersion': instance.resolvedVersion,
      'timestamp': instance.timestamp.toIso8601String(),
      'resolutionStrategy': instance.resolutionStrategy,
    };
