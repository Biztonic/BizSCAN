import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/features/dashboard/domain/models/live_metric.dart';
import 'package:bizscan/features/dashboard/domain/services/live_session_recorder.dart';

void main() {
  group('LiveSessionRecorder Unit Tests', () {
    late LiveSessionRecorder recorder;

    setUp(() {
      recorder = LiveSessionRecorder();
    });

    test('startRecording, recordFrame, and stopRecording record frames and export JSON', () {
      expect(recorder.isRecording, false);
      recorder.startRecording();
      expect(recorder.isRecording, true);

      final metrics = {
        'RPM': LiveMetric(
          metricName: 'RPM',
          currentValue: 750,
          unit: 'RPM',
          timestamp: DateTime.now(),
        ),
      };

      recorder.recordFrame(metrics, ['P0171']);
      expect(recorder.frameCount, 1);

      recorder.stopRecording();
      expect(recorder.isRecording, false);

      final jsonOutput = recorder.exportJson();
      expect(jsonOutput, contains('P0171'));
      expect(jsonOutput, contains('750'));
    });
  });
}
