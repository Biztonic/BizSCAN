import 'obd_transport.dart';

abstract class BluetoothTransport implements ObdTransport {
  Future<List<String>> scanDevices();
}
