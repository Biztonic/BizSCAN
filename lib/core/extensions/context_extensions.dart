import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  // Theme shortcut accessors
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;

  // MediaQuery shortcut accessors
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screenSize => mediaQuery.size;
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;

  // Responsive helper checks
  bool get isPhone => screenWidth < 600;
  bool get isTablet => screenWidth >= 600 && screenWidth < 1024;
  bool get isDesktop => screenWidth >= 1024;

  bool get isPortrait => mediaQuery.orientation == Orientation.portrait;
  bool get isLandscape => mediaQuery.orientation == Orientation.landscape;

  // Responsive value picker based on screen size
  double responsiveValue({
    required double phone,
    double? tablet,
    double? desktop,
  }) {
    if (isDesktop) return desktop ?? tablet ?? phone;
    if (isTablet) return tablet ?? phone;
    return phone;
  }

  // Common spacings
  double get paddingSmall => 8.0;
  double get paddingMedium => 16.0;
  double get paddingLarge => 24.0;
  double get paddingExtraLarge => 32.0;

  double get marginSmall => 8.0;
  double get marginMedium => 16.0;
  double get marginLarge => 24.0;
}
