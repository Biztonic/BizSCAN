import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/di_service.dart';
import '../../features/authentication/presentation/pages/splash_page.dart';
import '../../features/authentication/presentation/pages/language_selection_page.dart';
import '../../features/authentication/presentation/pages/welcome_page.dart';
import '../../features/authentication/presentation/pages/onboarding_page.dart';
import '../../features/authentication/presentation/pages/login_page.dart';
import '../../features/authentication/presentation/pages/register_page.dart';
import '../../features/authentication/presentation/pages/phone_login_page.dart';
import '../../features/authentication/presentation/pages/forgot_password_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_shell.dart';
import '../../features/dashboard/presentation/pages/dashboard_tab.dart';
import '../../features/vehicle/presentation/pages/vehicle_page.dart';
import '../../features/reports/presentation/pages/reports_page.dart';
import '../../features/history/presentation/pages/history_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/settings/presentation/pages/style_guide_page.dart';

class AppRouter {
  static const String splash = '/splash';
  static const String languageSelection = '/language-selection';
  static const String welcome = '/welcome';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String phoneLogin = '/phone-login';
  static const String forgotPassword = '/forgot-password';
  static const String dashboard = '/dashboard';
  static const String vehicle = '/vehicle';
  static const String reports = '/reports';
  static const String history = '/history';
  static const String settings = '/settings';
  static const String styleGuide = '/style-guide';

  static final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
  static final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

  static GoRouter getRouter({
    required bool showOnboarding,
    required bool isAuthenticated,
  }) {
    return GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: splash,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: splash,
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          path: languageSelection,
          builder: (context, state) => const LanguageSelectionPage(),
        ),
        GoRoute(
          path: welcome,
          builder: (context, state) => const WelcomePage(),
        ),
        GoRoute(
          path: onboarding,
          builder: (context, state) => const OnboardingPage(),
        ),
        GoRoute(
          path: login,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: register,
          builder: (context, state) => const RegisterPage(),
        ),
        GoRoute(
          path: phoneLogin,
          builder: (context, state) => const PhoneLoginPage(),
        ),
        GoRoute(
          path: forgotPassword,
          builder: (context, state) => const ForgotPasswordPage(),
        ),
        GoRoute(
          path: styleGuide,
          builder: (context, state) => const StyleGuidePage(),
        ),
        ShellRoute(
          navigatorKey: shellNavigatorKey,
          builder: (context, state, child) {
            return DashboardShell(child: child);
          },
          routes: [
            GoRoute(
              path: dashboard,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: DashboardTab(),
              ),
            ),
            GoRoute(
              path: vehicle,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: VehicleTab(),
              ),
            ),
            GoRoute(
              path: reports,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ReportsTab(),
              ),
            ),
            GoRoute(
              path: history,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HistoryTab(),
              ),
            ),
            GoRoute(
              path: settings,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: SettingsTab(),
              ),
            ),
          ],
        ),
      ],
      redirect: (context, state) {
        final loggingIn = state.matchedLocation == login;
        final onSplash = state.matchedLocation == splash;
        final onOnboarding = state.matchedLocation == onboarding;
        final onStyleGuide = state.matchedLocation == styleGuide;
        
        final onLanguageSelection = state.matchedLocation == languageSelection;
        final onWelcome = state.matchedLocation == welcome;
        final onRegister = state.matchedLocation == register;
        final onPhoneLogin = state.matchedLocation == phoneLogin;
        final onForgotPassword = state.matchedLocation == forgotPassword;

        if (onSplash || onStyleGuide) return null;

        final prefs = sl<SharedPreferences>();
        final hasSelectedLanguage = prefs.getString('selected_language') != null;

        // Force language selection first
        if (!hasSelectedLanguage && !onLanguageSelection) {
          return languageSelection;
        }

        if (onLanguageSelection) return null;

        // Onboarding guard: Force onboarding if not completed yet
        if (showOnboarding && !onOnboarding) {
          return onboarding;
        }

        if (onOnboarding) return null;

        // Public authentication routes
        final isPublicRoute = onWelcome || loggingIn || onRegister || onPhoneLogin || onForgotPassword;

        // Force Welcome screen if not authenticated
        if (!isAuthenticated && !isPublicRoute) {
          return welcome;
        }

        // Redirect to dashboard if logged in and trying to access Welcome/Login/Register
        if (isAuthenticated && isPublicRoute) {
          return dashboard;
        }

        return null;
      },
    );
  }
}
