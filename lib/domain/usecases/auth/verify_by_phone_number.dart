import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:karrishni/core/error/faillure.dart';
import 'package:karrishni/core/usecases/base_usecase.dart';
import 'package:karrishni/domain/repos/auth/auth_repo.dart';

class VerifyByPhoneNumber
    extends BaseUsecase<Future<Either<Failure, void>>, VerifyParams> {
  VerifyByPhoneNumber({required this.authRepo});

  final AuthRepo authRepo;

  @override
  Future<Either<Failure, void>> call(VerifyParams params) async {
    return await authRepo.verifyByPhoneNumber(
      params.phoneNumber,
      params.codeSent,
      params.codeAutoRetrievalTimeout,
      params.verificationCompleted,
      params.verificationFailed,
    );
  }
}

class VerifyParams {
  VerifyParams({
    required this.phoneNumber,
    required this.codeSent,
    required this.codeAutoRetrievalTimeout,
    required this.verificationCompleted,
    required this.verificationFailed,
  });

  final String phoneNumber;
  final void Function(String verificationId, int? resendToken) codeSent;
  final void Function(String verificationId) codeAutoRetrievalTimeout;
  void Function(PhoneAuthCredential) verificationCompleted;
  void Function(FirebaseAuthException exception) verificationFailed;
}
