import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:karrishni/core/error/faillure.dart';
import 'package:karrishni/core/usecases/base_usecase.dart';
import 'package:karrishni/domain/repos/auth/auth_repo.dart';
import 'package:karrishni/domain/entities/auth/user.dart' as entity;

class LoginWithCredential
    extends BaseUsecase<Future<Either<Failure, entity.User?>>, AuthCredential> {
  LoginWithCredential({required this.authRepo});

  final AuthRepo authRepo;

  @override
  Future<Either<Failure, entity.User?>> call(
      AuthCredential authCredential) async {
    return await authRepo.loginWithCredential(authCredential);
  }
}
