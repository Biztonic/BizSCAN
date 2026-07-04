import 'obd_transport.dart';

abstract class UsbTransport implements ObdTransport {
  Future<void> setBaudRate(int baudRate);
}
