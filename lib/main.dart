import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/services/di_service.dart';
import 'core/services/logging_service.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';
import 'core/config/app_localizations.dart';
import 'core/config/locale_provider.dart';

void main() async {
  // Ensure Flutter engine is initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize dependency injection locator
  await DiService.init();
  
  final logger = sl<LoggingService>();
  
  // Centralized global Flutter framework errors handler
  FlutterError.onError = (details) {
    logger.error('Flutter Framework Error: ${details.exception}', details.stack);
  };
  
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sharedPrefs = sl<SharedPreferences>();
    
    // Read state parameters from persistent cache storage
    final showOnboarding = sharedPrefs.getBool('show_onboarding') ?? true;
    final isAuthenticated = sharedPrefs.getBool('is_authenticated') ?? false;
    final locale = ref.watch(localeStateNotifierProvider);

    final router = AppRouter.getRouter(
      showOnboarding: showOnboarding,
      isAuthenticated: isAuthenticated,
    );

    return MaterialApp.router(
      title: 'BizSCAN',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: router,
      locale: locale,
      supportedLocales: const [
        Locale('en'),
        Locale('hi'),
        Locale('mr'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}

