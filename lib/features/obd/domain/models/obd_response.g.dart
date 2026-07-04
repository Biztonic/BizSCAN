// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'obd_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ObdResponseImpl _$$ObdResponseImplFromJson(Map<String, dynamic> json) =>
    _$ObdResponseImpl(
      rawData: json['rawData'] as String,
      parsedData: json['parsedData'] as Map<String, dynamic>?,
      responseTime: (json['responseTime'] as num).toInt(),
      isValid: json['isValid'] as bool,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$ObdResponseImplToJson(_$ObdResponseImpl instance) =>
    <String, dynamic>{
      'rawData': instance.rawData,
      'parsedData': instance.parsedData,
      'responseTime': instance.responseTime,
      'isValid': instance.isValid,
      'error': instance.error,
    };
