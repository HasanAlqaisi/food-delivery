import 'package:firebase_auth/firebase_auth.dart';
import 'package:karrishni/core/usecases/base_usecase.dart';
import 'package:karrishni/domain/repos/auth/auth_repo.dart';

class CreatePhoneAuthCredential
    extends BaseUsecase<PhoneAuthCredential, CredentialParams> {
  CreatePhoneAuthCredential({required this.authRepo});

  final AuthRepo authRepo;

  @override
  PhoneAuthCredential call(CredentialParams params) {
    return authRepo.createPhoneAuthCredential(
      params.smsCode,
      params.verificationId,
    );
  }
}

class CredentialParams {
  CredentialParams({required this.smsCode, required this.verificationId});

  final String smsCode;
  final String verificationId;
}
