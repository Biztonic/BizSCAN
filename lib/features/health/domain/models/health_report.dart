import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_report.freezed.dart';
part 'health_report.g.dart';

@freezed
class HealthReport with _$HealthReport {
  const factory HealthReport({
    required String reportId,
    required String scanId,
    required int overallScore,
    required int engineScore,
    required int batteryScore,
    required int coolingScore,
    required int fuelScore,
    required int emissionScore,
    required List<String> recommendations,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _HealthReport;

  factory HealthReport.fromJson(Map<String, dynamic> json) => _$HealthReportFromJson(json);
}
