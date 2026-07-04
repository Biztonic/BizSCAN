import '../../../../core/errors/result.dart';

abstract class BluetoothConnectionService {
  Future<Result<void>> connect(String address, {Duration? timeout});
  Future<Result<void>> disconnect();
  Future<Result<void>> cancelConnection();
  bool isConnected();
  Stream<bool> get connectionStatusStream;
  Stream<String> get dataStream;
  Future<Result<void>> sendData(String data);
}
