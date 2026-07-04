import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bizscan/core/services/di_service.dart';
import 'package:bizscan/core/config/app_localizations.dart';
import 'package:bizscan/features/authentication/domain/repositories/auth_repository.dart';
import 'package:bizscan/features/authentication/data/repositories/local_auth_repository.dart';
import 'package:bizscan/features/authentication/presentation/pages/login_page.dart';
import 'package:bizscan/features/authentication/presentation/pages/register_page.dart';
import 'package:bizscan/features/authentication/presentation/pages/forgot_password_page.dart';
import 'package:bizscan/features/authentication/presentation/pages/phone_login_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bizscan/shared/widgets/app_button.dart';

// Masterful localization stub helper for widget tests
class TestLocalizations extends AppLocalizations {
  TestLocalizations(super.locale);

  @override
  Future<bool> load() async => true;

  @override
  String translate(String key) {
    final mockMap = {
      'login_title': 'Welcome Back',
      'login_subtitle': 'Sign in to portal',
      'login_email': 'Email Address',
      'login_password': 'Password',
      'login_btn': 'Sign In',
      'signup_title': 'Create Account',
      'signup_subtitle': 'Register to sync',
      'signup_name': 'Full Name',
      'signup_confirm_password': 'Confirm Password',
      'signup_btn': 'Create Account',
      'phone_title': 'Phone Authentication',
      'phone_subtitle': 'Enter mobile number',
      'phone_number': 'Mobile Number',
      'phone_send_otp': 'Send OTP Verification',
      'otp_title': 'OTP Verification',
      'otp_subtitle': 'Enter code',
      'otp_verify': 'Verify & Continue',
      'forgot_title': 'Reset Password',
      'forgot_subtitle': 'Enter email to reset',
      'forgot_btn': 'Send Reset Link',
      'login_remember': 'Remember Me',
      'login_google': 'Continue with Google',
      'login_phone': 'Login with Phone Number',
      'login_no_account': 'Don\'t have an account? Sign Up',
      'forgot_success_title': 'Recovery Email Sent',
      'forgot_success_desc': 'We sent a link',
    };
    return mockMap[key] ?? key;
  }
}

class TestLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const TestLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return TestLocalizations(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;
}

class TestWidgetWrapper extends StatelessWidget {
  final Widget child;
  const TestWidgetWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        supportedLocales: const [Locale('en')],
        localizationsDelegates: const [
          TestLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: child,
      ),
    );
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late SharedPreferences prefs;

  setUp(() async {
    await sl.reset();
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(() => prefs);
    sl.registerLazySingleton<AuthRepository>(() => LocalAuthRepository(prefs));
  });

  tearDown(() async {
    await sl.reset();
  });

  group('Authentication Page Widget Tests', () {
    testWidgets('LoginPage should render text fields and CTA button', (WidgetTester tester) async {
      await tester.pumpWidget(const TestWidgetWrapper(child: LoginPage()));
      await tester.pumpAndSettle();

      expect(find.text('Welcome Back'), findsOneWidget);
      expect(find.text('Sign In'), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(2)); // Email and Password inputs
    });

    testWidgets('RegisterPage should render validation inputs and register button', (WidgetTester tester) async {
      await tester.pumpWidget(const TestWidgetWrapper(child: RegisterPage()));
      await tester.pumpAndSettle();

      // Headline and Button both say "Create Account"
      expect(find.text('Create Account'), findsNWidgets(2));
      expect(find.text('Full Name'), findsOneWidget);
      expect(find.text('Confirm Password'), findsOneWidget);
    });

    testWidgets('ForgotPasswordPage should render recovery field and success state transitions', (WidgetTester tester) async {
      await tester.pumpWidget(const TestWidgetWrapper(child: ForgotPasswordPage()));
      await tester.pumpAndSettle();

      expect(find.text('Reset Password'), findsOneWidget);
      expect(find.text('Send Reset Link'), findsOneWidget);
      
      // Enter recovery email
      await tester.enterText(find.byType(TextFormField), 'rohan@example.com');
      await tester.tap(find.byType(AppButton));
      await tester.pumpAndSettle();
      
      // Should show success view
      expect(find.text('Recovery Email Sent'), findsOneWidget);
    });

    testWidgets('PhoneLoginPage should render input views and shift to OTP view on trigger', (WidgetTester tester) async {
      await tester.pumpWidget(const TestWidgetWrapper(child: PhoneLoginPage()));
      await tester.pumpAndSettle();

      expect(find.text('Phone Authentication'), findsOneWidget);
      expect(find.text('Mobile Number'), findsOneWidget);
      
      // Type in 10-digit number in the phone number field (index 1)
      await tester.enterText(find.byType(TextFormField).at(1), '9999999999');
      await tester.tap(find.byType(AppButton));
      
      // Pump timer frames
      await tester.pump(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      // View should transition to OTP code input screen
      expect(find.text('OTP Verification'), findsOneWidget);
    });
  });
}
