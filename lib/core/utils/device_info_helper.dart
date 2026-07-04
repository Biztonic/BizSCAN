import 'dart:io';

class DeviceInfoHelper {
  static String get osName => Platform.operatingSystem;
  static String get osVersion => Platform.operatingSystemVersion;
  static bool get isAndroid => Platform.isAndroid;
  static bool get isIOS => Platform.isIOS;
  static bool get isWindows => Platform.isWindows;
  static bool get isMacOS => Platform.isMacOS;
  
  static String get platformName {
    if (isAndroid) return 'Android';
    if (isIOS) return 'iOS';
    if (isWindows) return 'Windows';
    if (isMacOS) return 'macOS';
    return 'Unknown';
  }

  static Map<String, dynamic> getSummary() {
    return {
      'os': osName,
      'version': osVersion,
      'platform': platformName,
      'locale': Platform.localeName,
    };
  }
}
