import 'dart:convert';
import '../models/live_metric.dart';

class SessionFrame {
  final DateTime timestamp;
  final Map<String, double> metrics;
  final List<String> activeDtcs;

  const SessionFrame({
    required this.timestamp,
    required this.metrics,
    required this.activeDtcs,
  });

  Map<String, dynamic> toJson() => {
        'timestamp': timestamp.toIso8601String(),
        'metrics': metrics,
        'activeDtcs': activeDtcs,
      };

  factory SessionFrame.fromJson(Map<String, dynamic> json) => SessionFrame(
        timestamp: DateTime.parse(json['timestamp']),
        metrics: Map<String, double>.from(json['metrics']),
        activeDtcs: List<String>.from(json['activeDtcs']),
      );
}

class LiveSessionRecorder {
  final List<SessionFrame> _recordedFrames = [];
  bool _isRecording = false;
  DateTime? _sessionStartTime;

  bool get isRecording => _isRecording;
  int get frameCount => _recordedFrames.length;

  void startRecording() {
    _recordedFrames.clear();
    _sessionStartTime = DateTime.now();
    _isRecording = true;
  }

  void recordFrame(Map<String, LiveMetric> metrics, List<String> dtcs) {
    if (!_isRecording) return;
    final map = <String, double>{};
    metrics.forEach((k, v) => map[k] = v.currentValue);

    _recordedFrames.add(SessionFrame(
      timestamp: DateTime.now(),
      metrics: map,
      activeDtcs: dtcs,
    ));
  }

  void stopRecording() {
    _isRecording = false;
  }

  List<SessionFrame> getRecordedFrames() {
    return List.unmodifiable(_recordedFrames);
  }

  String exportJson() {
    final data = {
      'startTime': _sessionStartTime?.toIso8601String(),
      'frameCount': _recordedFrames.length,
      'frames': _recordedFrames.map((f) => f.toJson()).toList(),
    };
    return jsonEncode(data);
  }
}
