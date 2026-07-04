import 'elm327_initializer.dart';

class CloneDetectionResult {
  final bool isClone;
  final int cloneScore; // 0 (100% genuine) to 100 (definitely clone)
  final String detectedQuirks;

  const CloneDetectionResult({
    required this.isClone,
    required this.cloneScore,
    required this.rawQuirks,
  }) : detectedQuirks = rawQuirks;

  final String rawQuirks;
}

class Elm327CloneDetector {
  CloneDetectionResult evaluateClone(Elm327InitResult initResult) {
    var score = 0;
    final quirks = <String>[];
    final info = initResult.adapterInfo.toUpperCase();

    // Genuine ELM327 never officially released v1.5 (v1.5 is a Chinese clone firmware designation)
    if (info.contains('V1.5') || info.contains('V 1.5')) {
      score += 40;
      quirks.add('Firmware version string claims v1.5 (non-official release)');
    }

    // Fake v2.1 clones often fail standard AT commands or claim v2.1 with missing features
    if (info.contains('V2.1') || info.contains('V 2.1')) {
      if (initResult.durationMs > 3000) {
        score += 30;
        quirks.add('Claims v2.1 but exhibits high initialization latency (>3000ms)');
      }
    }

    // Check 0100 response format quirks
    if (initResult.supportedPids0120.length < 8) {
      score += 30;
      quirks.add('Incomplete 0100 PID bitmap response length');
    }

    final isClone = score >= 40;
    return CloneDetectionResult(
      isClone: isClone,
      cloneScore: score.clamp(0, 100),
      rawQuirks: quirks.join('; '),
    );
  }
}
