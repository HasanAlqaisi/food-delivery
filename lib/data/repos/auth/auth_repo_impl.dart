import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:karrishni/core/error/exception.dart';
import 'package:karrishni/core/error/faillure.dart';
import 'package:karrishni/core/mappers/entity_mappers/user_entity.dart';
import 'package:karrishni/domain/data_sources/auth/auth_data_source.dart';
import 'package:karrishni/domain/entities/auth/user.dart' as entity;
import 'package:karrishni/domain/repos/auth/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthDataSource authDataSource;

  AuthRepoImpl({required this.authDataSource});

  @override
  Future<Either<Failure, void>> verifyByPhoneNumber(
    String phoneNumber,
    void Function(String verificationId, int? resendToken) codeSent,
    void Function(String verificationId) codeAutoRetrievalTimeout,
    void Function(PhoneAuthCredential) verificationCompleted,
    void Function(FirebaseAuthException exception) verificationFailed,
  ) async {
    try {
      await authDataSource.verifyByPhoneNumber(
        phoneNumber,
        codeSent,
        codeAutoRetrievalTimeout,
        verificationCompleted,
        verificationFailed,
      );
      return Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(
          FirebaseFailure(codeFailure: e.code, messageFailure: e.message));
    } on UnknownException catch (e) {
      return Left(UnknownFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, entity.User?>> loginWithCredential(
      AuthCredential authCredential) async {
    try {
      final user = await authDataSource.loginWithCredential(authCredential);
      final userEntity = UserMapper.toEntity(user!);
      return Right(userEntity);
    } on FirebaseAuthException catch (e) {
      return Left(
          FirebaseFailure(codeFailure: e.code, messageFailure: e.message));
    } on UnknownException catch (e) {
      return Left(UnknownFailure(message: e.message));
    }
  }

  @override
  PhoneAuthCredential createPhoneAuthCredential(
    String smsCode,
    String verificationId,
  ) {
    return authDataSource.createPhoneAuthCredential(smsCode, verificationId);
  }

  @override
  Stream<User?> authStateChangesStream() {
    return authDataSource.authStateChangesStream();
  }

  @override
  Future<Either<Failure, void>> addNewUser(entity.User user) async {
    try {
      await authDataSource.addNewUser(user);
      return Right(null);
    } on FirebaseException catch (e) {
      return Left(
          FirebaseFailure(codeFailure: e.code, messageFailure: e.message));
    } on Exception catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
