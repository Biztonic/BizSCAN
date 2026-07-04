import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/services/di_service.dart';
import '../../../../core/errors/result.dart';
import '../../domain/models/user_profile.dart';
import '../../domain/repositories/auth_repository.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  late final AuthRepository repository;
  late final SharedPreferences _prefs;

  @override
  Stream<UserProfile?> build() {
    repository = sl<AuthRepository>();
    _prefs = sl<SharedPreferences>();
    return repository.authStateChanges();
  }

  Future<Result<UserProfile>> signInWithEmail(String email, String password) async {
    final result = await repository.loginWithEmail(email, password);
    if (result.isSuccess) {
      await _prefs.setBool('is_authenticated', true);
      await _migrateSettings(result.getOrNull!);
    }
    return result;
  }

  Future<Result<UserProfile>> signUpWithEmail({
    required String name,
    required String email,
    required String password,
    String? phone,
  }) async {
    final localLanguage = _prefs.getString('selected_language') ?? 'en';
    final localTheme = _prefs.getString('theme_mode') ?? 'system';
    
    final result = await repository.register(
      name: name,
      email: email,
      password: password,
      phone: phone,
    );

    if (result.isSuccess) {
      final user = result.getOrNull!;
      await _prefs.setBool('is_authenticated', true);
      
      final updatedUser = user.copyWith(
        language: localLanguage,
        themeMode: localTheme,
      );
      
      await _prefs.setString('selected_language', localLanguage);
      await _prefs.setString('theme_mode', localTheme);
      await _prefs.remove('guest_user_profile');
      return Result.success(updatedUser);
    }
    return result;
  }

  Future<Result<UserProfile>> signInWithGoogle() async {
    final result = await repository.loginWithGoogle();
    if (result.isSuccess) {
      await _prefs.setBool('is_authenticated', true);
      await _migrateSettings(result.getOrNull!);
    }
    return result;
  }

  Future<Result<UserProfile>> verifyOtpCode({
    required String verificationId,
    required String smsCode,
  }) async {
    final result = await repository.verifyOtp(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    if (result.isSuccess) {
      await _prefs.setBool('is_authenticated', true);
      await _migrateSettings(result.getOrNull!);
    }
    return result;
  }

  Future<Result<UserProfile>> loginAsGuest() async {
    final result = await repository.continueAsGuest();
    if (result.isSuccess) {
      await _prefs.setBool('is_authenticated', true);
    }
    return result;
  }

  Future<void> signOut() async {
    await repository.logout();
    await _prefs.setBool('is_authenticated', false);
  }

  Future<void> _migrateSettings(UserProfile loggedInUser) async {
    await _prefs.setString('selected_language', loggedInUser.language);
    await _prefs.setString('theme_mode', loggedInUser.themeMode);
  }
}
