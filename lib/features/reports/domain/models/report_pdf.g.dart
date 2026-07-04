// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_pdf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportPdfImpl _$$ReportPdfImplFromJson(Map<String, dynamic> json) =>
    _$ReportPdfImpl(
      pdfId: json['pdfId'] as String,
      scanId: json['scanId'] as String,
      storagePath: json['storagePath'] as String,
      downloadUrl: json['downloadUrl'] as String,
      generatedAt: DateTime.parse(json['generatedAt'] as String),
    );

Map<String, dynamic> _$$ReportPdfImplToJson(_$ReportPdfImpl instance) =>
    <String, dynamic>{
      'pdfId': instance.pdfId,
      'scanId': instance.scanId,
      'storagePath': instance.storagePath,
      'downloadUrl': instance.downloadUrl,
      'generatedAt': instance.generatedAt.toIso8601String(),
    };
