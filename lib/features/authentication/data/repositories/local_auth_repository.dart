import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/result.dart';
import '../../domain/models/user_profile.dart';
import '../../domain/repositories/auth_repository.dart';

class LocalAuthRepository implements AuthRepository {
  final SharedPreferences _prefs;
  final _authStateController = StreamController<UserProfile?>.broadcast();
  UserProfile? _currentUser;

  LocalAuthRepository(this._prefs) {
    _initSession();
  }

  void _initSession() {
    final guestProfile = _prefs.getString('guest_user_profile');
    if (guestProfile != null) {
      try {
        final Map<String, dynamic> guestMap = Map<String, dynamic>.from(
          Uri.splitQueryString(guestProfile),
        );
        final profile = UserProfile(
          userId: guestMap['userId'] ?? '',
          displayName: guestMap['displayName'] ?? 'Guest',
          email: guestMap['email'] ?? '',
          language: guestMap['language'] ?? 'en',
          themeMode: guestMap['themeMode'] ?? 'system',
          preferredUnit: guestMap['preferredUnit'] ?? 'metric',
          isGuest: true,
          createdAt: DateTime.tryParse(guestMap['createdAt'] ?? '') ?? DateTime.now(),
          updatedAt: DateTime.tryParse(guestMap['updatedAt'] ?? '') ?? DateTime.now(),
        );
        _currentUser = profile;
        _authStateController.add(profile);
      } catch (_) {
        _currentUser = null;
        _authStateController.add(null);
      }
    } else {
      final userJson = _prefs.getString('local_user_profile');
      if (userJson != null) {
        try {
          final Map<String, dynamic> userMap = Map<String, dynamic>.from(
            Uri.splitQueryString(userJson),
          );
          final profile = UserProfile(
            userId: userMap['userId'] ?? '',
            displayName: userMap['displayName'] ?? 'User',
            email: userMap['email'] ?? '',
            phone: userMap['phone'],
            language: userMap['language'] ?? 'en',
            themeMode: userMap['themeMode'] ?? 'system',
            preferredUnit: userMap['preferredUnit'] ?? 'metric',
            isGuest: false,
            createdAt: DateTime.tryParse(userMap['createdAt'] ?? '') ?? DateTime.now(),
            updatedAt: DateTime.tryParse(userMap['updatedAt'] ?? '') ?? DateTime.now(),
          );
          _currentUser = profile;
          _authStateController.add(profile);
        } catch (_) {
          _currentUser = null;
          _authStateController.add(null);
        }
      } else {
        _currentUser = null;
        _authStateController.add(null);
      }
    }
  }

  @override
  Future<Result<UserProfile>> loginWithEmail(String email, String password) async {
    // Local mock verification
    if (password.length < 8) {
      return const Result.failure(AuthFailure('Incorrect password.'));
    }
    
    await _clearGuestCache();
    final profile = UserProfile(
      userId: const Uuid().v4(),
      displayName: email.split('@')[0],
      email: email,
      language: _prefs.getString('selected_language') ?? 'en',
      themeMode: 'system',
      preferredUnit: 'metric',
      isGuest: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    
    await _saveUserLocal(profile);
    _currentUser = profile;
    _authStateController.add(profile);
    return Result.success(profile);
  }

  @override
  Future<Result<UserProfile>> register({
    required String name,
    required String email,
    required String password,
    String? phone,
  }) async {
    await _clearGuestCache();
    final profile = UserProfile(
      userId: const Uuid().v4(),
      displayName: name,
      email: email,
      phone: phone,
      language: _prefs.getString('selected_language') ?? 'en',
      themeMode: 'system',
      preferredUnit: 'metric',
      isGuest: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    
    await _saveUserLocal(profile);
    _currentUser = profile;
    _authStateController.add(profile);
    return Result.success(profile);
  }

  @override
  Future<Result<UserProfile>> loginWithGoogle() async {
    await _clearGuestCache();
    final profile = UserProfile(
      userId: const Uuid().v4(),
      displayName: 'Google User',
      email: 'google@example.com',
      language: _prefs.getString('selected_language') ?? 'en',
      themeMode: 'system',
      preferredUnit: 'metric',
      isGuest: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    
    await _saveUserLocal(profile);
    _currentUser = profile;
    _authStateController.add(profile);
    return Result.success(profile);
  }

  @override
  Future<Result<void>> loginWithPhone({
    required String phone,
    required void Function(String verificationId, int? resendToken) codeSent,
    required void Function(Exception e) verificationFailed,
  }) async {
    // Emit mock OTP flow
    Future.delayed(const Duration(seconds: 1), () {
      codeSent('mock-verification-id', 123456);
    });
    return const Result.success(null);
  }

  @override
  Future<Result<UserProfile>> verifyOtp({
    required String verificationId,
    required String smsCode,
  }) async {
    if (smsCode == '123456' || smsCode == '654321') {
      await _clearGuestCache();
      final profile = UserProfile(
        userId: const Uuid().v4(),
        displayName: 'Phone User',
        email: '',
        phone: '+919999999999',
        language: _prefs.getString('selected_language') ?? 'en',
        themeMode: 'system',
        preferredUnit: 'metric',
        isGuest: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      await _saveUserLocal(profile);
      _currentUser = profile;
      _authStateController.add(profile);
      return Result.success(profile);
    }
    return const Result.failure(AuthFailure('Invalid OTP verification code entered.'));
  }

  @override
  Future<Result<void>> logout() async {
    await _clearGuestCache();
    await _prefs.remove('local_user_profile');
    _currentUser = null;
    _authStateController.add(null);
    return const Result.success(null);
  }

  @override
  Future<Result<void>> deleteAccount() async {
    await _clearGuestCache();
    await _prefs.remove('local_user_profile');
    _currentUser = null;
    _authStateController.add(null);
    return const Result.success(null);
  }

  @override
  Future<Result<void>> resetPassword(String email) async {
    return const Result.success(null);
  }

  @override
  Future<Result<UserProfile>> continueAsGuest() async {
    final guestId = _prefs.getString('guest_user_id') ?? const Uuid().v4();
    await _prefs.setString('guest_user_id', guestId);
    
    final profile = UserProfile(
      userId: guestId,
      displayName: 'Guest User',
      email: '',
      language: _prefs.getString('selected_language') ?? 'en',
      themeMode: 'system',
      preferredUnit: 'metric',
      isGuest: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    
    final mapData = {
      'userId': profile.userId,
      'displayName': profile.displayName,
      'email': profile.email,
      'language': profile.language,
      'themeMode': profile.themeMode,
      'preferredUnit': profile.preferredUnit,
      'createdAt': profile.createdAt.toIso8601String(),
      'updatedAt': profile.updatedAt.toIso8601String(),
    };
    
    final queryStr = Uri(queryParameters: mapData).query;
    await _prefs.setString('guest_user_profile', queryStr);
    
    _currentUser = profile;
    _authStateController.add(profile);
    return Result.success(profile);
  }

  @override
  Future<UserProfile?> getCurrentUser() async {
    return _currentUser;
  }

  @override
  Stream<UserProfile?> authStateChanges() {
    return _authStateController.stream;
  }

  Future<void> _clearGuestCache() async {
    await _prefs.remove('guest_user_id');
    await _prefs.remove('guest_user_profile');
  }

  Future<void> _saveUserLocal(UserProfile profile) async {
    final mapData = {
      'userId': profile.userId,
      'displayName': profile.displayName,
      'email': profile.email,
      'phone': profile.phone ?? '',
      'language': profile.language,
      'themeMode': profile.themeMode,
      'preferredUnit': profile.preferredUnit,
      'createdAt': profile.createdAt.toIso8601String(),
      'updatedAt': profile.updatedAt.toIso8601String(),
    };
    final queryStr = Uri(queryParameters: mapData).query;
    await _prefs.setString('local_user_profile', queryStr);
  }
}
