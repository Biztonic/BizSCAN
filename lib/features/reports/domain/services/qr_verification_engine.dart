import 'dart:convert';
import 'package:crypto/crypto.dart';

class QRVerificationEngine {
  String generateVerificationPayload({
    required String reportId,
    required String vin,
    required String vehicleId,
    required DateTime timestamp,
  }) {
    final raw = '$reportId|$vin|$vehicleId|${timestamp.toIso8601String()}';
    final bytes = utf8.encode(raw);
    final hash = sha256.convert(bytes).toString().substring(0, 16);

    return 'BIZSCAN_VERIFY://$reportId?vin=$vin&ts=${timestamp.millisecondsSinceEpoch}&hash=$hash';
  }

  bool verifyPayload(String payloadStr) {
    return payloadStr.startsWith('BIZSCAN_VERIFY://') && payloadStr.contains('&hash=');
  }
}
