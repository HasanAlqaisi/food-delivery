import 'package:dartz/dartz.dart';
import 'package:karrishni/core/error/faillure.dart';
import 'package:karrishni/core/usecases/base_usecase.dart';
import 'package:karrishni/domain/repos/auth/auth_repo.dart';
import 'package:karrishni/domain/entities/auth/user.dart' as entity;

class AddNewUser
    extends BaseUsecase<Future<Either<Failure, void>>, entity.User> {
  AddNewUser({required this.authRepo});

  final AuthRepo authRepo;

  @override
  Future<Either<Failure, void>> call(entity.User user) async {
    return await authRepo.addNewUser(user);
  }
}
