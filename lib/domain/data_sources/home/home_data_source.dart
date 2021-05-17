import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:karrishni/domain/entities/category/category.dart';
import 'package:karrishni/domain/entities/restaurant/meal_section.dart';
import 'package:karrishni/domain/entities/restaurant/restaurant.dart';

abstract class HomeDataSource {
  Stream<QuerySnapshot<Category>> watchCategories();

  Stream<QuerySnapshot<Restaurant>> watchRestaurants();

  Stream<QuerySnapshot<MealSection>> watchMealsFor(String restaurantId);
}
