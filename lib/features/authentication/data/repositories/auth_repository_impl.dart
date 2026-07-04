import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/result.dart';
import '../../../../core/services/logging_service.dart';
import '../../domain/models/user_profile.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final fb.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;
  final SharedPreferences _prefs;
  final LoggingService _logger;
  
  final _authStateController = StreamController<UserProfile?>.broadcast();
  UserProfile? _currentUser;
  
  AuthRepositoryImpl(
    this._firebaseAuth,
    this._firestore,
    this._prefs,
    this._logger,
  ) {
    // Monitor authentication states
    _initAuthState();
  }

  void _initAuthState() {
    try {
      _firebaseAuth.authStateChanges().listen((fb.User? fbUser) async {
        if (fbUser == null) {
          // Check if local guest session is active
          final guestJson = _prefs.getString('guest_user_profile');
          if (guestJson != null) {
            try {
              final Map<String, dynamic> guestMap = Map<String, dynamic>.from(
                Uri.splitQueryString(guestJson),
              );
              // splitQueryString helper fallback or parsing
              final profile = UserProfile(
                userId: guestMap['userId'] ?? '',
                displayName: guestMap['displayName'] ?? 'Guest',
                email: guestMap['email'] ?? '',
                phone: guestMap['phone'],
                photoUrl: guestMap['photoUrl'],
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
            _currentUser = null;
            _authStateController.add(null);
          }
        } else {
          // Fetch Cloud Profile from Firestore
          final profile = await _fetchFirestoreProfile(fbUser.uid);
          if (profile != null) {
            _currentUser = profile;
            _authStateController.add(profile);
          } else {
            // Create fallback profile if missing in firestore
            final newProfile = UserProfile(
              userId: fbUser.uid,
              displayName: fbUser.displayName ?? 'User',
              email: fbUser.email ?? '',
              phone: fbUser.phoneNumber,
              photoUrl: fbUser.photoURL,
              language: _prefs.getString('selected_language') ?? 'en',
              themeMode: 'system',
              preferredUnit: 'metric',
              isGuest: false,
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            );
            await _saveFirestoreProfile(newProfile);
            _currentUser = newProfile;
            _authStateController.add(newProfile);
          }
        }
      });
    } catch (e) {
      _logger.warning('Firebase not initialized. Defaulting to Local Session Store: $e');
      // Local session init if Firebase not configured
      final guestJson = _prefs.getString('guest_user_profile');
      if (guestJson != null) {
        _continueGuestFromCache();
      }
    }
  }

  void _continueGuestFromCache() {
    final cachedId = _prefs.getString('guest_user_id') ?? const Uuid().v4();
    final profile = UserProfile(
      userId: cachedId,
      displayName: 'Guest User',
      email: '',
      language: _prefs.getString('selected_language') ?? 'en',
      themeMode: 'system',
      preferredUnit: 'metric',
      isGuest: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    _currentUser = profile;
    _authStateController.add(profile);
  }

  Future<UserProfile?> _fetchFirestoreProfile(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      if (doc.exists && doc.data() != null) {
        return UserProfile.fromJson(doc.data()!);
      }
    } catch (e) {
      _logger.error('Error fetching Firestore Profile: $e');
    }
    return null;
  }

  Future<void> _saveFirestoreProfile(UserProfile profile) async {
    try {
      await _firestore.collection('users').doc(profile.userId).set(profile.toJson());
    } catch (e) {
      _logger.error('Error saving Firestore Profile: $e');
    }
  }

  Failure _mapFirebaseException(dynamic e) {
    if (e is fb.FirebaseAuthException) {
      switch (e.code) {
        case 'weak-password':
          return const AuthFailure('The password provided is too weak.');
        case 'email-already-in-use':
          return const AuthFailure('An account already exists for this email.');
        case 'invalid-email':
          return const AuthFailure('The email address is badly formatted.');
        case 'user-not-found':
          return const AuthFailure('No user found for that email.');
        case 'wrong-password':
          return const AuthFailure('Incorrect password.');
        case 'user-disabled':
          return const AuthFailure('This user account has been disabled.');
        case 'too-many-requests':
          return const AuthFailure('Too many requests. Try again later.');
        case 'network-request-failed':
          return const NetworkFailure('Network connectivity error.');
        case 'invalid-verification-code':
          return const AuthFailure('Invalid OTP verification code entered.');
        case 'invalid-verification-id':
          return const AuthFailure('OTP session expired. Please retry resending code.');
        default:
          return AuthFailure(e.message ?? 'Authentication error occurred.');
      }
    }
    return AuthFailure(e.toString());
  }

  @override
  Future<Result<UserProfile>> loginWithEmail(String email, String password) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        // Clear local guest cache
        await _clearGuestCache();
        final profile = await _fetchFirestoreProfile(credential.user!.uid);
        if (profile != null) {
          return Result.success(profile);
        }
        final fallback = UserProfile(
          userId: credential.user!.uid,
          displayName: credential.user!.displayName ?? 'User',
          email: credential.user!.email ?? email,
          phone: credential.user!.phoneNumber,
          language: _prefs.getString('selected_language') ?? 'en',
          themeMode: 'system',
          preferredUnit: 'metric',
          isGuest: false,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        await _saveFirestoreProfile(fallback);
        return Result.success(fallback);
      }
      return const Result.failure(AuthFailure('Login returned empty credentials'));
    } catch (e) {
      return Result.failure(_mapFirebaseException(e));
    }
  }

  @override
  Future<Result<UserProfile>> register({
    required String name,
    required String email,
    required String password,
    String? phone,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        // Clear local guest cache
        await _clearGuestCache();
        
        await credential.user!.updateDisplayName(name);
        
        final profile = UserProfile(
          userId: credential.user!.uid,
          displayName: name,
          email: email,
          phone: phone ?? credential.user!.phoneNumber,
          photoUrl: credential.user!.photoURL,
          language: _prefs.getString('selected_language') ?? 'en',
          themeMode: 'system',
          preferredUnit: 'metric',
          isGuest: false,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        await _saveFirestoreProfile(profile);
        return Result.success(profile);
      }
      return const Result.failure(AuthFailure('Registration returned empty user'));
    } catch (e) {
      return Result.failure(_mapFirebaseException(e));
    }
  }

  @override
  Future<Result<UserProfile>> loginWithGoogle() async {
    // In actual production app, this delegates to google_sign_in package
    // For this architecture phase, we prepare mock/firebase link flows
    return const Result.failure(AuthFailure('Google Sign-In requires google_sign_in native configuration.'));
  }

  @override
  Future<Result<void>> loginWithPhone({
    required String phone,
    required void Function(String verificationId, int? resendToken) codeSent,
    required void Function(Exception e) verificationFailed,
  }) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (fb.PhoneAuthCredential credential) async {
          await _firebaseAuth.signInWithCredential(credential);
        },
        verificationFailed: (fb.FirebaseAuthException e) {
          verificationFailed(Exception(e.message ?? 'Phone verification failed'));
        },
        codeSent: codeSent,
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      return const Result.success(null);
    } catch (e) {
      return Result.failure(_mapFirebaseException(e));
    }
  }

  @override
  Future<Result<UserProfile>> verifyOtp({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      final credential = fb.PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      final userCredential = await _firebaseAuth.signInWithCredential(credential);
      if (userCredential.user != null) {
        await _clearGuestCache();
        final profile = await _fetchFirestoreProfile(userCredential.user!.uid);
        if (profile != null) {
          return Result.success(profile);
        }
        final newProfile = UserProfile(
          userId: userCredential.user!.uid,
          displayName: 'User',
          email: userCredential.user!.email ?? '',
          phone: userCredential.user!.phoneNumber,
          language: _prefs.getString('selected_language') ?? 'en',
          themeMode: 'system',
          preferredUnit: 'metric',
          isGuest: false,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        await _saveFirestoreProfile(newProfile);
        return Result.success(newProfile);
      }
      return const Result.failure(AuthFailure('OTP verification credential empty'));
    } catch (e) {
      return Result.failure(_mapFirebaseException(e));
    }
  }

  @override
  Future<Result<void>> logout() async {
    try {
      await _firebaseAuth.signOut();
      await _clearGuestCache();
      return const Result.success(null);
    } catch (e) {
      return Result.failure(_mapFirebaseException(e));
    }
  }

  @override
  Future<Result<void>> deleteAccount() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).delete();
        await user.delete();
      }
      await _clearGuestCache();
      return const Result.success(null);
    } catch (e) {
      return Result.failure(_mapFirebaseException(e));
    }
  }

  @override
  Future<Result<void>> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(_mapFirebaseException(e));
    }
  }

  @override
  Future<Result<UserProfile>> continueAsGuest() async {
    try {
      // Check if guest profile exists or generate new
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
      
      // Save query string mock profile for persistence
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
    } catch (e) {
      return Result.failure(CacheFailure('Failed to cache guest profile: $e'));
    }
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
}
