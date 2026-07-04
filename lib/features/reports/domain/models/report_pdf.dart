import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_pdf.freezed.dart';
part 'report_pdf.g.dart';

@freezed
class ReportPdf with _$ReportPdf {
  const factory ReportPdf({
    required String pdfId,
    required String scanId,
    required String storagePath,
    required String downloadUrl,
    required DateTime generatedAt,
  }) = _ReportPdf;

  factory ReportPdf.fromJson(Map<String, dynamic> json) => _$ReportPdfFromJson(json);
}
