import 'package:freezed_annotation/freezed_annotation.dart';

part 'live_metric.freezed.dart';
part 'live_metric.g.dart';

@freezed
class LiveMetric with _$LiveMetric {
  const factory LiveMetric({
    required String metricName,
    required double currentValue,
    @Default(0.0) double previousValue,
    required String unit,
    @Default('stable') String trend, // 'up', 'down', 'stable'
    @Default('normal') String status, // 'normal', 'warning', 'critical'
    required DateTime timestamp,
    @Default(false) bool isStale,
  }) = _LiveMetric;

  factory LiveMetric.fromJson(Map<String, dynamic> json) =>
      _$LiveMetricFromJson(json);
}
