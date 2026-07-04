import 'package:freezed_annotation/freezed_annotation.dart';

part 'diagnostic_code.freezed.dart';
part 'diagnostic_code.g.dart';

@freezed
class DiagnosticCode with _$DiagnosticCode {
  const factory DiagnosticCode({
    required String code,
    required String description,
    required String severity, // e.g. High, Medium, Low
    required String category, // e.g. Powertrain, Body, Chassis
    required String status,   // e.g. Active, Pending, Cleared
  }) = _DiagnosticCode;

  factory DiagnosticCode.fromJson(Map<String, dynamic> json) => _$DiagnosticCodeFromJson(json);
}
