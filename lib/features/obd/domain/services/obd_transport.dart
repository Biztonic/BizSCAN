import '../../../../core/errors/result.dart';

abstract class ObdTransport {
  Future<Result<void>> connect(String targetAddress);
  Future<Result<void>> disconnect();
  bool isConnected();
  Future<Result<void>> send(String data);
  Future<Result<String>> receive({Duration? timeout});
  Stream<String> stream();
  Future<void> dispose();
}
