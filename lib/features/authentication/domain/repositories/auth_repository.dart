import '../../../../core/errors/result.dart';
import '../models/user_profile.dart';

abstract class AuthRepository {
  Future<Result<UserProfile>> loginWithEmail(String email, String password);
  
  Future<Result<UserProfile>> register({
    required String name,
    required String email,
    required String password,
    String? phone,
  });
  
  Future<Result<UserProfile>> loginWithGoogle();
  
  Future<Result<void>> loginWithPhone({
    required String phone,
    required void Function(String verificationId, int? resendToken) codeSent,
    required void Function(Exception e) verificationFailed,
  });
  
  Future<Result<UserProfile>> verifyOtp({
    required String verificationId,
    required String smsCode,
  });
  
  Future<Result<void>> logout();
  
  Future<Result<void>> deleteAccount();
  
  Future<Result<void>> resetPassword(String email);
  
  Future<Result<UserProfile>> continueAsGuest();
  
  Future<UserProfile?> getCurrentUser();
  
  Stream<UserProfile?> authStateChanges();
}
