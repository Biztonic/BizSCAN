import '../../../../core/errors/result.dart';
import '../models/obd_command.dart';
import '../models/obd_response.dart';

abstract class CommandExecutor {
  Future<Result<void>> initializeAdapter();
  Future<Result<void>> resetAdapter();
  Future<Result<ObdResponse>> sendAtCommand(String command, {Duration? timeout});
  Future<Result<ObdResponse>> sendPidCommand(String pid, {Duration? timeout});
  Future<Result<ObdResponse>> executeCommand(ObdCommand command);
  void queueCommand(ObdCommand command);
  void cancelPendingCommands();

  Stream<ObdCommand> get commandStream;
  Stream<ObdResponse> get responseStream;
}
