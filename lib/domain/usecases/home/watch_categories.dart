import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:karrishni/core/usecases/base_usecase.dart';
import 'package:karrishni/domain/entities/category/category.dart';
import 'package:karrishni/domain/repos/home/home_repo.dart';

class WatchCategories
    extends BaseUsecase<Stream<QuerySnapshot<Category>>, void> {
  WatchCategories({required this.homeRepo});

  final HomeRepo homeRepo;

  @override
  Stream<QuerySnapshot<Category>> call(void params) {
    return homeRepo.watchCategories();
  }
}
