import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:karrishni/core/mappers/entity_mappers/category_entity.dart';
import 'package:karrishni/core/mappers/entity_mappers/meal_section_entity.dart';
import 'package:karrishni/core/mappers/entity_mappers/restaurant_entity.dart';
import 'package:karrishni/core/utils/firebase_helper/collection_reference.dart';
import 'package:karrishni/core/utils/firebase_helper/firebase_paths.dart';
import 'package:karrishni/domain/data_sources/home/home_data_source.dart';
import 'package:karrishni/domain/entities/category/category.dart';
import 'package:karrishni/domain/entities/restaurant/meal_section.dart';
import 'package:karrishni/domain/entities/restaurant/restaurant.dart';

class HomeDataSourceImpl extends HomeDataSource {
  HomeDataSourceImpl({required this.store});

  final FirebaseFirestore store;

  @override
  Stream<QuerySnapshot<Category>> watchCategories() {
    final categoriesRef = CollectionRefHelper<Category>();
    return categoriesRef
        .collectoinRef(
            store: store,
            path: FirebasePaths.categoriesCollection,
            fromFirestore: (snap, _) => CategoryEntity.fromSnapShot(snap),
            toFirestore: (Category category, _) => {})
        .snapshots();
  }

  @override
  Stream<QuerySnapshot<Restaurant>> watchRestaurants() {
    final restaurantsRef = CollectionRefHelper<Restaurant>();
    return restaurantsRef
        .collectoinRef(
            store: store,
            path: FirebasePaths.restaurantsCollection,
            fromFirestore: (snap, _) =>
                RestaurantEntity.fromSnapShot(snap, [], []),
            toFirestore: (Restaurant restaurant, _) => {})
        .snapshots();
  }

  @override
  Stream<QuerySnapshot<MealSection>> watchMealsFor(String restaurantId) {
    return store
        .collection(FirebasePaths.restaurantsCollection)
        .doc(restaurantId)
        .collection(FirebasePaths.mealSectionsCollection)
        .withConverter(
            fromFirestore: (snap, _) => MealSectionEntity.fromSnapShot(snap),
            toFirestore: (MealSection mealSection, _) => {})
        .snapshots();
  }
}
