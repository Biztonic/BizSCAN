import 'dart:async';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/result.dart';
import '../../domain/models/obd_command.dart';
import '../../domain/models/obd_response.dart';
import '../../domain/services/command_executor.dart';
import '../../domain/services/obd_transport.dart';
import '../../domain/services/response_parser.dart';

class DefaultCommandExecutor implements CommandExecutor {
  final ObdTransport _transport;
  final ResponseParser _parser;

  final StreamController<ObdCommand> _commandStreamController = StreamController<ObdCommand>.broadcast();
  final StreamController<ObdResponse> _responseStreamController = StreamController<ObdResponse>.broadcast();
  final List<ObdCommand> _commandQueue = [];

  DefaultCommandExecutor(this._transport, this._parser);

  @override
  Stream<ObdCommand> get commandStream => _commandStreamController.stream;

  @override
  Stream<ObdResponse> get responseStream => _responseStreamController.stream;

  @override
  Future<Result<void>> initializeAdapter() async {
    final resetRes = await sendAtCommand('ATZ');
    if (resetRes.isFailure) return Result.failure(resetRes.failureOrNull!);

    final echoRes = await sendAtCommand('ATE0');
    if (echoRes.isFailure) return Result.failure(echoRes.failureOrNull!);

    final protoRes = await sendAtCommand('ATSP0');
    if (protoRes.isFailure) return Result.failure(protoRes.failureOrNull!);

    return const Result.success(null);
  }

  @override
  Future<Result<void>> resetAdapter() async {
    final res = await sendAtCommand('ATZ');
    if (res.isSuccess) return const Result.success(null);
    return Result.failure(res.failureOrNull!);
  }

  @override
  Future<Result<ObdResponse>> sendAtCommand(String command, {Duration? timeout}) async {
    final obdCmd = ObdCommand(
      command: command,
      type: 'AT',
      priority: 1,
      timeout: timeout?.inMilliseconds ?? 2000,
      createdAt: DateTime.now(),
    );
    return executeCommand(obdCmd);
  }

  @override
  Future<Result<ObdResponse>> sendPidCommand(String pid, {Duration? timeout}) async {
    final obdCmd = ObdCommand(
      command: pid,
      type: 'PID',
      priority: 2,
      timeout: timeout?.inMilliseconds ?? 3000,
      createdAt: DateTime.now(),
    );
    return executeCommand(obdCmd);
  }

  @override
  Future<Result<ObdResponse>> executeCommand(ObdCommand command) async {
    if (!_transport.isConnected()) {
      return const Result.failure(ConnectionFailure('Transport is disconnected'));
    }

    _commandStreamController.add(command);
    var attempts = 0;
    Result<ObdResponse>? lastResult;

    while (attempts < command.retryCount) {
      attempts++;
      final sendResult = await _transport.send('${command.command}\r');
      if (sendResult.isFailure) {
        lastResult = Result.failure(sendResult.failureOrNull!);
        continue;
      }

      final receiveResult = await _transport.receive(
        timeout: Duration(milliseconds: command.timeout),
      );

      if (receiveResult.isFailure) {
        lastResult = Result.failure(receiveResult.failureOrNull!);
        continue;
      }

      final rawData = receiveResult.getOrNull!;
      final parsedResult = _parser.parseRawResponse(rawData, command);
      if (parsedResult.isSuccess) {
        final response = parsedResult.getOrNull!;
        _responseStreamController.add(response);
        return Result.success(response);
      } else {
        lastResult = Result.failure(parsedResult.failureOrNull!);
      }
    }

    return lastResult ?? const Result.failure(TimeoutFailure('Command execution timed out after retries'));
  }

  @override
  void queueCommand(ObdCommand command) {
    _commandQueue.add(command);
    _commandQueue.sort((a, b) => a.priority.compareTo(b.priority));
  }

  @override
  void cancelPendingCommands() {
    _commandQueue.clear();
  }
}
