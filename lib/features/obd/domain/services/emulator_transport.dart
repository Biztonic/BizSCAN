import 'obd_transport.dart';

abstract class EmulatorTransport implements ObdTransport {
  void simulateFaultCode(String dtc);
  void simulatePidResponse(String pid, String hexResponse);
}
