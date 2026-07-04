import 'dart:async';
import '../models/obd_command.dart';
import 'elm327_command_pipeline.dart';

class Elm327CommandScheduler {
  final Elm327CommandPipeline _pipeline;
  Timer? _timer;
  bool _isScheduled = false;

  Elm327CommandScheduler(this._pipeline);

  bool get isScheduled => _isScheduled;

  void startPeriodicPolling(List<String> pidCommands, {Duration interval = const Duration(milliseconds: 500)}) {
    stop();
    _isScheduled = true;
    _timer = Timer.periodic(interval, (_) {
      for (final pid in pidCommands) {
        _pipeline.addCommand(ObdCommand(
          command: pid,
          type: 'PID',
          priority: 2,
          timeout: 2000,
          createdAt: DateTime.now(),
        ));
      }
    });
  }

  void stop() {
    _isScheduled = false;
    _timer?.cancel();
    _timer = null;
  }
}
