import 'package:flutter/services.dart';

class HapticHelper {
  static Future<void> lightTap() async {
    try {
      await HapticFeedback.lightImpact();
    } catch (_) {}
  }

  static Future<void> mediumTap() async {
    try {
      await HapticFeedback.mediumImpact();
    } catch (_) {}
  }

  static Future<void> heavyTap() async {
    try {
      await HapticFeedback.heavyImpact();
    } catch (_) {}
  }

  static Future<void> selectionTap() async {
    try {
      await HapticFeedback.selectionClick();
    } catch (_) {}
  }

  static Future<void> errorVibrate() async {
    try {
      await HapticFeedback.vibrate();
      await Future.delayed(const Duration(milliseconds: 100));
      await HapticFeedback.vibrate();
    } catch (_) {}
  }
}
