import 'package:firebase_auth/firebase_auth.dart';
import 'package:karrishni/domain/entities/auth/user.dart' as entity;

abstract class AuthDataSource {
  Future<void> verifyByPhoneNumber(
    String phoneNumber,
    void Function(String verificationId, int? resendToken) codeSent,
    void Function(String verificationId) codeAutoRetrievalTimeout,
    void Function(PhoneAuthCredential) verificationCompleted,
    void Function(FirebaseAuthException exception) verificationFailed,
  );

  PhoneAuthCredential createPhoneAuthCredential(
    String smsCode,
    String verificationId,
  );

  Future<User?> loginWithCredential(AuthCredential authCredential);

  Stream<User?> authStateChangesStream();

  Future<void> addNewUser(entity.User user);
}
