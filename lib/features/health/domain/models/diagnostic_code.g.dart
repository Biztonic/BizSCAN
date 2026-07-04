// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnostic_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiagnosticCodeImpl _$$DiagnosticCodeImplFromJson(Map<String, dynamic> json) =>
    _$DiagnosticCodeImpl(
      code: json['code'] as String,
      description: json['description'] as String,
      severity: json['severity'] as String,
      category: json['category'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$DiagnosticCodeImplToJson(
  _$DiagnosticCodeImpl instance,
) => <String, dynamic>{
  'code': instance.code,
  'description': instance.description,
  'severity': instance.severity,
  'category': instance.category,
  'status': instance.status,
};
