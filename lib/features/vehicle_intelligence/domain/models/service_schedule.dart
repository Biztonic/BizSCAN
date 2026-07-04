import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_schedule.freezed.dart';
part 'service_schedule.g.dart';

@freezed
class ServiceSchedule with _$ServiceSchedule {
  const factory ServiceSchedule({
    required String serviceId,
    required int intervalKm,
    required int intervalMonths,
    required String title,
    required String description,
    @Default(2) int priority, // 1 (highest) to 5
    @Default('₹2,000 - ₹4,500') String estimatedCost,
    @Default('45 mins') String estimatedTime,
    @Default(true) bool diyPossible,
  }) = _ServiceSchedule;

  factory ServiceSchedule.fromJson(Map<String, dynamic> json) =>
      _$ServiceScheduleFromJson(json);
}
