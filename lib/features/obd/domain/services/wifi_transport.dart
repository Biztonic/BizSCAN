import 'obd_transport.dart';

abstract class WifiTransport implements ObdTransport {
  Future<void> setHostAndPort(String host, int port);
}
