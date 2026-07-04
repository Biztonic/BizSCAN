import 'package:flutter/material.dart';

class AppTheme {
  // Brand colors
  static const Color primaryColor = Color(0xFF0B192C); // Dark Automotive Navy/Charcoal
  static const Color secondaryColor = Color(0xFF008DDA); // High-Precision Tech Blue
  static const Color tertiaryColor = Color(0xFFF1C40F); // Warm Warning Amber
  static const Color errorColor = Color(0xFFE74C3C); // Warning/Critical Red
  static const Color successColor = Color(0xFF2ECC71); // Diagnostic Pass Green
  
  // Automotive Specific Colors
  static const Color healthExcellent = Color(0xFF2ECC71); // Green
  static const Color healthGood = Color(0xFF85E65D); // Light Green
  static const Color healthWarning = Color(0xFFF39C12); // Amber Orange
  static const Color healthCritical = Color(0xFFC0392B); // Dark Red
  
  static const Color batteryColor = Color(0xFFF1C40F); // Battery Gold
  static const Color temperatureColor = Color(0xFFE67E22); // Coolant Orange
  static const Color fuelColor = Color(0xFF3498DB); // Fuel Level Blue
  static const Color speedColor = Color(0xFF9B59B6); // Speed Amethyst
  
  static const Color darkCardColor = Color(0xFF1E2022); // Premium dark card backing
  static const Color lightCardColor = Color(0xFFFFFFFF); // Clean white card backing

  static const Color lightShimmerBase = Color(0xFFE0E0E0);
  static const Color lightShimmerHighlight = Color(0xFFF5F5F5);
  static const Color darkShimmerBase = Color(0xFF303030);
  static const Color darkShimmerHighlight = Color(0xFF424242);

  // Gradient definitions
  static const LinearGradient premiumGradient = LinearGradient(
    colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient blueNeonGradient = LinearGradient(
    colors: [Color(0xFF00D2FF), Color(0xFF0066FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient healthScoreGradient = LinearGradient(
    colors: [Color(0xFF11998e), Color(0xFF38ef7d)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient glassmorphicGradient = LinearGradient(
    colors: [Colors.white24, Colors.white12],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Spacing tokens
  static const double spacing2 = 2.0;
  static const double spacing4 = 4.0;
  static const double spacing8 = 8.0;
  static const double spacing12 = 12.0;
  static const double spacing16 = 16.0;
  static const double spacing20 = 20.0;
  static const double spacing24 = 24.0;
  static const double spacing32 = 32.0;
  static const double spacing48 = 48.0;
  static const double spacing64 = 64.0;

  // Radius tokens
  static const double radiusExtraSmall = 4.0;
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 12.0;
  static const double radiusLarge = 16.0;
  static const double radiusExtraLarge = 24.0;
  static const double radiusFull = 999.0;

  // Elevation tokens
  static const double elevationNone = 0.0;
  static const double elevationLow = 1.0;
  static const double elevationMedium = 3.0;
  static const double elevationHigh = 6.0;
  static const double elevationSuper = 12.0;

  // Border Width tokens
  static const double borderThin = 1.0;
  static const double borderMedium = 2.0;
  static const double borderThick = 3.0;

  // Opacity tokens
  static const double opacityDisabled = 0.35;
  static const double opacitySubtle = 0.70;
  static const double opacityMuted = 0.45;
  static const double opacityGlass = 0.15;

  // Animation Duration tokens
  static const Duration durationFast = Duration(milliseconds: 150);
  static const Duration durationMedium = Duration(milliseconds: 300);
  static const Duration durationSlow = Duration(milliseconds: 500);

  // Component Sizes
  static const double buttonHeightSmall = 36.0;
  static const double buttonHeightMedium = 48.0;
  static const double buttonHeightLarge = 56.0;

  static const double inputHeightMedium = 56.0;
  static const double cardPadding = 16.0;

  // Font Family names
  static const String fontInter = 'Inter';
  static const String fontNotoSans = 'NotoSans';
  static const String fontNotoSansDevanagari = 'NotoSansDevanagari';

  // Soft shadows for design components
  static List<BoxShadow> get softShadow => [
        BoxShadow(
          color: Colors.black.withOpacity(0.04),
          blurRadius: 16,
          offset: const Offset(0, 6),
        ),
      ];

  static List<BoxShadow> get cardShadow => [
        BoxShadow(
          color: Colors.black.withOpacity(0.03),
          blurRadius: 10,
          offset: const Offset(0, 3),
        ),
      ];

  static List<BoxShadow> get glassShadow => [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 20,
          offset: const Offset(0, 8),
        ),
      ];

  // Light Color Scheme
  static final ColorScheme _lightScheme = ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.light,
    primary: primaryColor,
    secondary: secondaryColor,
    tertiary: tertiaryColor,
    error: errorColor,
    surface: const Color(0xFFF5F7FA), // Light cool gray background
    onSurface: const Color(0xFF0F172A),
    outline: const Color(0xFFCBD5E1),
  );

  // Dark Color Scheme (sleek dark mode)
  static final ColorScheme _darkScheme = ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.dark,
    primary: const Color(0xFF38BDF8),
    secondary: const Color(0xFF008DDA),
    tertiary: const Color(0xFFF1C40F),
    error: const Color(0xFFE74C3C),
    surface: const Color(0xFF0C0C0E), // Ultra dark black background
    onSurface: const Color(0xFFF1F5F9),
    outline: const Color(0xFF334155),
  );

  // Text theme builder
  static TextTheme _buildTextTheme(TextTheme base, String fontFamily) {
    return base.copyWith(
      displayLarge: base.displayLarge?.copyWith(fontFamily: fontFamily, fontWeight: FontWeight.bold),
      displayMedium: base.displayMedium?.copyWith(fontFamily: fontFamily, fontWeight: FontWeight.bold),
      displaySmall: base.displaySmall?.copyWith(fontFamily: fontFamily, fontWeight: FontWeight.w600),
      headlineLarge: base.headlineLarge?.copyWith(fontFamily: fontFamily, fontWeight: FontWeight.bold),
      headlineMedium: base.headlineMedium?.copyWith(fontFamily: fontFamily, fontWeight: FontWeight.w600),
      headlineSmall: base.headlineSmall?.copyWith(fontFamily: fontFamily, fontWeight: FontWeight.w500),
      titleLarge: base.titleLarge?.copyWith(fontFamily: fontFamily, fontWeight: FontWeight.w600),
      titleMedium: base.titleMedium?.copyWith(fontFamily: fontFamily, fontWeight: FontWeight.w500),
      titleSmall: base.titleSmall?.copyWith(fontFamily: fontFamily, fontWeight: FontWeight.w400),
      bodyLarge: base.bodyLarge?.copyWith(fontFamily: fontFamily, height: 1.4),
      bodyMedium: base.bodyMedium?.copyWith(fontFamily: fontFamily, height: 1.4),
      bodySmall: base.bodySmall?.copyWith(fontFamily: fontFamily, height: 1.4),
      labelLarge: base.labelLarge?.copyWith(fontFamily: fontFamily, fontWeight: FontWeight.w600),
      labelMedium: base.labelMedium?.copyWith(fontFamily: fontFamily),
      labelSmall: base.labelSmall?.copyWith(fontFamily: fontFamily),
    );
  }

  // Light Theme Configuration
  static ThemeData get lightTheme {
    final ThemeData base = ThemeData.light(useMaterial3: true);
    return base.copyWith(
      colorScheme: _lightScheme,
      textTheme: _buildTextTheme(base.textTheme, fontInter),
      cardTheme: CardTheme(
        elevation: elevationLow,
        shadowColor: Colors.black.withOpacity(0.08),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusLarge),
        ),
        color: lightCardColor,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xFF0F172A)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusMedium),
          ),
        ),
      ),
    );
  }

  // Dark Theme Configuration
  static ThemeData get darkTheme {
    final ThemeData base = ThemeData.dark(useMaterial3: true);
    return base.copyWith(
      colorScheme: _darkScheme,
      textTheme: _buildTextTheme(base.textTheme, fontInter),
      cardTheme: CardTheme(
        elevation: elevationNone,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusLarge),
        ),
        color: darkCardColor,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xFFF1F5F9)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusMedium),
          ),
        ),
      ),
    );
  }
}
