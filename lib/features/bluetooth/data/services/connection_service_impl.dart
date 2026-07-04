import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/result.dart';
import '../../domain/services/bluetooth_connection_service.dart';

class BluetoothConnectionServiceImpl implements BluetoothConnectionService {
  BluetoothConnection? _connection;
  StreamSubscription<Uint8List>? _dataSubscription;
  final StreamController<bool> _statusController = StreamController<bool>.broadcast();
  final StreamController<String> _dataController = StreamController<String>.broadcast();
  bool _isConnected = false;

  @override
  bool isConnected() => _isConnected && (_connection?.isConnected ?? false);

  @override
  Stream<bool> get connectionStatusStream => _statusController.stream;

  @override
  Stream<String> get dataStream => _dataController.stream;

  @override
  Future<Result<void>> connect(String address, {Duration? timeout}) async {
    try {
      await disconnect();

      final connFuture = BluetoothConnection.toAddress(address);
      final effTimeout = timeout ?? const Duration(seconds: 10);

      _connection = await connFuture.timeout(effTimeout, onTimeout: () {
        throw TimeoutFailure('Bluetooth connection to $address timed out');
      });

      _isConnected = true;
      _statusController.add(true);

      _dataSubscription = _connection!.input!.listen((Uint8List data) {
        final decoded = utf8.decode(data, allowMalformed: true);
        _dataController.add(decoded);
      }, onDone: () {
        _handleDisconnect();
      }, onError: (_) {
        _handleDisconnect();
      });

      return const Result.success(null);
    } catch (e) {
      _handleDisconnect();
      return Result.failure(ConnectionFailure('Bluetooth connection failed: $e'));
    }
  }

  @override
  Future<Result<void>> disconnect() async {
    _handleDisconnect();
    return const Result.success(null);
  }

  @override
  Future<Result<void>> cancelConnection() async {
    return disconnect();
  }

  @override
  Future<Result<void>> sendData(String data) async {
    if (!isConnected() || _connection == null) {
      return const Result.failure(ConnectionFailure('Bluetooth is not connected'));
    }
    try {
      final bytes = Uint8List.fromList(utf8.encode(data));
      _connection!.output.add(bytes);
      await _connection!.output.allSent;
      return const Result.success(null);
    } catch (e) {
      return Result.failure(ConnectionFailure('Failed to send data: $e'));
    }
  }

  void _handleDisconnect() {
    _isConnected = false;
    _statusController.add(false);
    _dataSubscription?.cancel();
    _dataSubscription = null;
    try {
      _connection?.dispose();
    } catch (_) {}
    _connection = null;
  }
}
