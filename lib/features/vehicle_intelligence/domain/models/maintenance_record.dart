import 'package:freezed_annotation/freezed_annotation.dart';

part 'maintenance_record.freezed.dart';
part 'maintenance_record.g.dart';

@freezed
class MaintenanceRecord with _$MaintenanceRecord {
  const factory MaintenanceRecord({
    required String serviceId,
    required DateTime performedDate,
    required int odometer,
    @Default('Authorized Service Station') String workshop,
    @Default('') String notes,
    @Default('') String invoiceNumber,
    required int nextDueKm,
    required DateTime nextDueDate,
  }) = _MaintenanceRecord;

  factory MaintenanceRecord.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceRecordFromJson(json);
}
