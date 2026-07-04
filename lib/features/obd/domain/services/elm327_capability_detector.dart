import 'elm327_initializer.dart';

class Elm327CapabilityDetector {
  List<String> detectCapabilities(Elm327InitResult initResult) {
    final capabilities = <String>[];

    final adapterInfo = initResult.adapterInfo.toUpperCase();
    final protocol = initResult.protocol.toUpperCase();

    // Multi-frame support (ISO-TP)
    if (adapterInfo.contains('v1.4') ||
        adapterInfo.contains('v1.5') ||
        adapterInfo.contains('v2.1') ||
        adapterInfo.contains('ELM327')) {
      capabilities.add('MULTI_FRAME');
    }

    // CAN support
    if (protocol.contains('CAN') || adapterInfo.contains('CAN')) {
      capabilities.add('CAN_BUS');
    }

    // KWP2000 support
    if (protocol.contains('KWP') || adapterInfo.contains('KWP')) {
      capabilities.add('KWP2000');
    }

    // ISO9141 support
    if (protocol.contains('9141') || adapterInfo.contains('9141')) {
      capabilities.add('ISO9141');
    }

    // J1850 support
    if (protocol.contains('J1850') || adapterInfo.contains('J1850')) {
      capabilities.add('J1850');
    }

    // Fast vs Slow Initialization
    if (initResult.durationMs < 2000) {
      capabilities.add('FAST_INIT');
    } else {
      capabilities.add('SLOW_INIT');
    }

    return capabilities;
  }
}
