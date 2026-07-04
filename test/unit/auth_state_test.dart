import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bizscan/core/services/di_service.dart';
import 'package:bizscan/features/authentication/domain/repositories/auth_repository.dart';
import 'package:bizscan/features/authentication/data/repositories/local_auth_repository.dart';
import 'package:bizscan/features/authentication/presentation/providers/auth_provider.dart';
import 'package:bizscan/features/authentication/domain/models/user_profile.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late SharedPreferences prefs;
  late LocalAuthRepository authRepository;

  setUp(() async {
    // Clear GetIt registrations to avoid duplicates
    await sl.reset();
    
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(() => prefs);
    
    authRepository = LocalAuthRepository(prefs);
    sl.registerLazySingleton<AuthRepository>(() => authRepository);
  });

  tearDown(() async {
    await sl.reset();
  });

  group('AuthNotifier State & Migration Tests', () {
    test('initial state should be null when no profile cached', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final authStream = container.read(authNotifierProvider);
      expect(authStream, const AsyncValue<UserProfile?>.loading());
    });

    test('loginAsGuest should set is_authenticated cache to true', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(authNotifierProvider.notifier);
      final result = await notifier.loginAsGuest();

      expect(result.isSuccess, isTrue);
      expect(prefs.getBool('is_authenticated'), isTrue);
    });

    test('signUpWithEmail should migrate local settings to user profile and clear guest cache', () async {
      // Simulate guest settings
      await prefs.setString('selected_language', 'hi');
      await prefs.setString('theme_mode', 'dark');
      await prefs.setString('guest_user_profile', 'userId=temp-uuid');

      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(authNotifierProvider.notifier);
      
      final result = await notifier.signUpWithEmail(
        name: 'Rohan',
        email: 'rohan@gmail.com',
        password: 'password123',
      );

      expect(result.isSuccess, isTrue);
      
      // Check migrated settings in SharedPreferences
      expect(prefs.getString('selected_language'), equals('hi'));
      expect(prefs.getString('theme_mode'), equals('dark'));
      
      // Guest profile must be removed
      expect(prefs.getString('guest_user_profile'), isNull);
    });

    test('signOut should set is_authenticated cache to false', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(authNotifierProvider.notifier);
      
      // Sign in first
      await notifier.signInWithEmail('user@domain.com', 'password123');
      expect(prefs.getBool('is_authenticated'), isTrue);

      // Sign out
      await notifier.signOut();
      expect(prefs.getBool('is_authenticated'), isFalse);
    });
  });
}
