import 'package:karrishni/domain/data_sources/home/home_data_source.dart';
import 'package:karrishni/domain/entities/category/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:karrishni/domain/entities/restaurant/meal_section.dart';
import 'package:karrishni/domain/entities/restaurant/restaurant.dart';
import 'package:karrishni/domain/repos/home/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  HomeRepoImpl({required this.homeDataSource});

  final HomeDataSource homeDataSource;

  @override
  Stream<QuerySnapshot<Category>> watchCategories() {
    return homeDataSource.watchCategories();
  }

  @override
  Stream<QuerySnapshot<Restaurant>> watchRestaurants() {
    return homeDataSource.watchRestaurants();
  }

  @override
  Stream<QuerySnapshot<MealSection>> watchMealsFor(String restaurantId) {
    return homeDataSource.watchMealsFor(restaurantId);
  }
}
