import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:karrishni/domain/entities/category/category.dart';
import 'package:karrishni/domain/entities/restaurant/meal_section.dart';
import 'package:karrishni/domain/entities/restaurant/restaurant.dart';
import 'package:karrishni/domain/usecases/auth/auth_state_changes.dart';
import 'package:karrishni/domain/usecases/home/watch_categories.dart';
import 'package:karrishni/domain/usecases/home/watch_meals_for.dart';
import 'package:karrishni/domain/usecases/home/watch_restaurants.dart';
import 'package:karrishni/routes/app_routes.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find<HomeController>();

  HomeController({
    required this.watchCategories,
    required this.watchRestaurants,
    required this.watchMealsFor,
  });

  final WatchCategories watchCategories;
  late Rx<QuerySnapshot<Category>?> categoriesState =
      Rx<QuerySnapshot<Category>?>(null);

  final WatchRestaurants watchRestaurants;
  late Rx<QuerySnapshot<Restaurant>?> restaurantsState =
      Rx<QuerySnapshot<Restaurant>?>(null);

  final WatchMealsFor watchMealsFor;
  late Rx<QuerySnapshot<MealSection>?> mealsState =
      Rx<QuerySnapshot<MealSection>?>(null);

  List<QueryDocumentSnapshot<Category>>? get categoriesDocs =>
      categoriesState.value?.docs;

  List<QueryDocumentSnapshot<Restaurant>>? get restaurantsDocs =>
      restaurantsState.value?.docs;

  List<QueryDocumentSnapshot<MealSection>>? get mealSectionsDocs =>
      mealsState.value?.docs;

  @override
  void onInit() {
    super.onInit();
    _bindStreams();
  }

  void _bindStreams() {
    categoriesState.bindStream(watchCategories(NoParams()));
    restaurantsState.bindStream(watchRestaurants(NoParams()));
  }

  void onRestaurantClicked(String restaurantId) {
    mealsState.bindStream(watchMealsFor(restaurantId));
    Get.toNamed(Routes.restaurantPage);
  }
}
