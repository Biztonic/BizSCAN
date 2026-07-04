import 'dart:async';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/result.dart';
import '../../../obd/domain/services/bluetooth_transport.dart';
import '../../domain/services/bluetooth_connection_service.dart';
import '../../domain/services/bluetooth_discovery_service.dart';

class BluetoothTransportImpl implements BluetoothTransport {
  final BluetoothConnectionService _connectionService;
  final BluetoothDiscoveryService _discoveryService;
  String? _lastReceivedData;
  StreamSubscription<String>? _dataSubscription;

  BluetoothTransportImpl(this._connectionService, this._discoveryService) {
    _dataSubscription = _connectionService.dataStream.listen((data) {
      _lastReceivedData = data;
    });
  }

  @override
  bool isConnected() => _connectionService.isConnected();

  @override
  Future<Result<void>> connect(String targetAddress) async {
    return _connectionService.connect(targetAddress);
  }

  @override
  Future<Result<void>> disconnect() async {
    return _connectionService.disconnect();
  }

  @override
  Future<Result<void>> send(String data) async {
    return _connectionService.sendData(data);
  }

  @override
  Future<Result<String>> receive({Duration? timeout}) async {
    if (!isConnected()) {
      return const Result.failure(ConnectionFailure('Bluetooth is not connected'));
    }
    if (_lastReceivedData != null) {
      final data = _lastReceivedData!;
      _lastReceivedData = null;
      return Result.success(data);
    }
    return const Result.success('NO DATA');
  }

  @override
  Stream<String> stream() => _connectionService.dataStream;

  @override
  Future<List<String>> scanDevices() async {
    await _discoveryService.startDiscovery();
    final devices = _discoveryService.currentDevices;
    return devices.map((d) => d.address).toList();
  }

  @override
  Future<void> dispose() async {
    await _dataSubscription?.cancel();
    await _connectionService.disconnect();
  }
}
