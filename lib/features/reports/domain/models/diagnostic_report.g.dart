// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnostic_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiagnosticReportImpl _$$DiagnosticReportImplFromJson(
  Map<String, dynamic> json,
) => _$DiagnosticReportImpl(
  reportId: json['reportId'] as String,
  vehicleId: json['vehicleId'] as String,
  sessionId: json['sessionId'] as String,
  reportNumber: json['reportNumber'] as String,
  generatedAt: DateTime.parse(json['generatedAt'] as String),
  generatedBy: json['generatedBy'] as String? ?? 'Senior Technician',
  reportType: json['reportType'] as String? ?? 'Comprehensive Diagnostic',
  reportVersion: json['reportVersion'] as String? ?? 'v1.0',
  reportStatus: json['reportStatus'] as String? ?? 'draft',
  customerInfo:
      json['customerInfo'] == null
          ? null
          : CustomerInformation.fromJson(
            json['customerInfo'] as Map<String, dynamic>,
          ),
  workshopInfo:
      json['workshopInfo'] == null
          ? null
          : WorkshopInformation.fromJson(
            json['workshopInfo'] as Map<String, dynamic>,
          ),
  sections:
      (json['sections'] as List<dynamic>?)
          ?.map((e) => ReportSection.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  digitalHash: json['digitalHash'] as String? ?? '',
  technicianSignature: json['technicianSignature'] as String? ?? '',
  customerSignature: json['customerSignature'] as String? ?? '',
);

Map<String, dynamic> _$$DiagnosticReportImplToJson(
  _$DiagnosticReportImpl instance,
) => <String, dynamic>{
  'reportId': instance.reportId,
  'vehicleId': instance.vehicleId,
  'sessionId': instance.sessionId,
  'reportNumber': instance.reportNumber,
  'generatedAt': instance.generatedAt.toIso8601String(),
  'generatedBy': instance.generatedBy,
  'reportType': instance.reportType,
  'reportVersion': instance.reportVersion,
  'reportStatus': instance.reportStatus,
  'customerInfo': instance.customerInfo,
  'workshopInfo': instance.workshopInfo,
  'sections': instance.sections,
  'digitalHash': instance.digitalHash,
  'technicianSignature': instance.technicianSignature,
  'customerSignature': instance.customerSignature,
};
