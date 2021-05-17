import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:karrishni/core/usecases/base_usecase.dart';
import 'package:karrishni/domain/entities/restaurant/meal_section.dart';
import 'package:karrishni/domain/repos/home/home_repo.dart';

class WatchMealsFor
    extends BaseUsecase<Stream<QuerySnapshot<MealSection>>, String> {
  WatchMealsFor({required this.homeRepo});

  final HomeRepo homeRepo;

  @override
  Stream<QuerySnapshot<MealSection>> call(String restaurantId) {
    return homeRepo.watchMealsFor(restaurantId);
  }
}
