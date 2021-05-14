import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:karrishni/core/error/faillure.dart';
import 'package:karrishni/domain/entities/auth/user.dart' as entity;

abstract class AuthRepo {
  Future<Either<Failure, void>> verifyByPhoneNumber(
    String phoneNumber,
    void Function(String verificationId, int? resendToken) codeSent,
    void Function(String verificationId) codeAutoRetrievalTimeout,
    void Function(PhoneAuthCredential) verificationCompleted,
    void Function(FirebaseAuthException exception) verificationFailed,
  );

  Future<Either<Failure, entity.User?>> loginWithCredential(
    AuthCredential authCredential,
  );

  PhoneAuthCredential createPhoneAuthCredential(
    String smsCode,
    String verificationId,
  );

  Stream<User?> authStateChangesStream();

  Future<Either<Failure, void>> addNewUser(entity.User user);
}
