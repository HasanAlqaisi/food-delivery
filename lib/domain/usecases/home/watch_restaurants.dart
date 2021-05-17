import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:karrishni/core/usecases/base_usecase.dart';
import 'package:karrishni/domain/entities/restaurant/restaurant.dart';
import 'package:karrishni/domain/repos/home/home_repo.dart';

class WatchRestaurants
    extends BaseUsecase<Stream<QuerySnapshot<Restaurant>>, void> {
  WatchRestaurants({required this.homeRepo});

  final HomeRepo homeRepo;

  @override
  Stream<QuerySnapshot<Restaurant>> call(void params) {
    return homeRepo.watchRestaurants();
  }
}
