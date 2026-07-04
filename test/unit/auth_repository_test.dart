import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bizscan/features/authentication/data/repositories/local_auth_repository.dart';


void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late LocalAuthRepository authRepository;
  late SharedPreferences prefs;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
    authRepository = LocalAuthRepository(prefs);
  });

  group('LocalAuthRepository Unit Tests', () {
    test('continueAsGuest should create a valid guest profile and save to cache', () async {
      final result = await authRepository.continueAsGuest();
      
      expect(result.isSuccess, isTrue);
      final profile = result.getOrNull;
      expect(profile, isNotNull);
      expect(profile!.isGuest, isTrue);
      expect(profile.displayName, equals('Guest User'));
      expect(profile.email, isEmpty);
      
      final cachedId = prefs.getString('guest_user_id');
      expect(cachedId, equals(profile.userId));
      
      final cachedProfile = prefs.getString('guest_user_profile');
      expect(cachedProfile, isNotNull);
    });

    test('register should create a non-guest user profile and clean guest caches', () async {
      // First continue as guest to create guest cache
      await authRepository.continueAsGuest();
      expect(prefs.getString('guest_user_id'), isNotNull);

      // Register new user
      final result = await authRepository.register(
        name: 'Rohan Sharma',
        email: 'rohan@example.com',
        password: 'securePassword123',
        phone: '+919999999999',
      );

      expect(result.isSuccess, isTrue);
      final profile = result.getOrNull;
      expect(profile, isNotNull);
      expect(profile!.isGuest, isFalse);
      expect(profile.displayName, equals('Rohan Sharma'));
      expect(profile.email, equals('rohan@example.com'));
      
      // Guest cache should be cleared
      expect(prefs.getString('guest_user_id'), isNull);
      expect(prefs.getString('guest_user_profile'), isNull);
    });

    test('loginWithEmail should succeed with password >= 8 characters', () async {
      final result = await authRepository.loginWithEmail('test@domain.com', 'validPassword');
      
      expect(result.isSuccess, isTrue);
      final profile = result.getOrNull;
      expect(profile, isNotNull);
      expect(profile!.email, equals('test@domain.com'));
    });

    test('loginWithEmail should fail with password < 8 characters', () async {
      final result = await authRepository.loginWithEmail('test@domain.com', 'short');
      
      expect(result.isFailure, isTrue);
      expect(result.failureOrNull?.message, contains('Incorrect password'));
    });

    test('verifyOtp should create profile for valid codes (123456/654321)', () async {
      final result = await authRepository.verifyOtp(
        verificationId: 'mock-verification-id',
        smsCode: '123456',
      );

      expect(result.isSuccess, isTrue);
      final profile = result.getOrNull;
      expect(profile, isNotNull);
      expect(profile!.phone, equals('+919999999999'));
    });

    test('verifyOtp should fail for invalid code', () async {
      final result = await authRepository.verifyOtp(
        verificationId: 'mock-verification-id',
        smsCode: '000000',
      );

      expect(result.isFailure, isTrue);
      expect(result.failureOrNull?.message, contains('Invalid OTP'));
    });

    test('logout should clear user session', () async {
      await authRepository.loginWithEmail('user@test.com', 'password123');
      expect(prefs.getString('local_user_profile'), isNotNull);

      final result = await authRepository.logout();
      expect(result.isSuccess, isTrue);
      expect(prefs.getString('local_user_profile'), isNull);
    });
  });
}
