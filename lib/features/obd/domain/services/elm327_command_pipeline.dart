import 'dart:async';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/result.dart';
import '../models/obd_command.dart';
import '../models/obd_response.dart';
import 'elm327_command_queue.dart';
import 'elm327_response_cleaner.dart';
import 'obd_transport.dart';

class Elm327CommandPipeline {
  final ObdTransport _transport;
  final Elm327CommandQueue _queue;
  final Elm327ResponseCleaner _cleaner = Elm327ResponseCleaner();

  Elm327CommandPipeline(this._transport, {int maxQueueSize = 100})
      : _queue = Elm327CommandQueue(maxQueueSize: maxQueueSize);

  int get pendingCount => _queue.length;

  bool addCommand(ObdCommand command) {
    return _queue.enqueue(command);
  }

  void cancelAll() {
    _queue.clear();
  }

  Future<Result<ObdResponse>> executeNext() async {
    final command = _queue.dequeue();
    if (command == null) {
      return const Result.failure(ValidationFailure('Command queue is empty'));
    }
    return executeDirect(command);
  }

  Future<Result<ObdResponse>> executeDirect(ObdCommand command) async {
    if (!_transport.isConnected()) {
      return const Result.failure(ConnectionFailure('Transport is disconnected'));
    }

    var attempts = 0;
    Result<ObdResponse>? lastResult;

    while (attempts < command.retryCount) {
      attempts++;
      final sendRes = await _transport.send('${command.command}\r');
      if (sendRes.isFailure) {
        lastResult = Result.failure(sendRes.failureOrNull!);
        continue;
      }

      final rcvRes = await _transport.receive(timeout: Duration(milliseconds: command.timeout));
      if (rcvRes.isFailure) {
        lastResult = Result.failure(rcvRes.failureOrNull!);
        continue;
      }

      final raw = rcvRes.getOrNull!;
      final validated = _cleaner.validateResponse(raw);
      if (validated.isFailure) {
        lastResult = Result.failure(validated.failureOrNull!);
        continue;
      }

      final responseTime = DateTime.now().difference(command.createdAt).inMilliseconds;
      return Result.success(ObdResponse(
        rawData: raw,
        parsedData: {'cleaned': _cleaner.clean(raw)},
        responseTime: responseTime > 0 ? responseTime : 15,
        isValid: true,
      ));
    }

    return lastResult ?? const Result.failure(TimeoutFailure('Command execution timed out after retries'));
  }
}
