import 'package:firebase_auth/firebase_auth.dart';
import 'package:karrishni/core/usecases/base_usecase.dart';
import 'package:karrishni/domain/repos/auth/auth_repo.dart';

class AuthStateChanges extends BaseUsecase<Stream<User?>, NoParams> {
  AuthStateChanges({required this.authRepo});

  final AuthRepo authRepo;

  @override
  Stream<User?> call(NoParams noParams) {
    return authRepo.authStateChangesStream();
  }
}

class NoParams {}
