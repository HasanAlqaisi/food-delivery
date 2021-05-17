import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:karrishni/core/mappers/entity_mappers/meal_entity.dart';
import 'package:karrishni/domain/entities/restaurant/meal.dart';
import 'package:karrishni/domain/entities/restaurant/meal_section.dart';

abstract class MealSectionEntity {
  static MealSection fromSnapShot(
      DocumentSnapshot<Map<String, dynamic?>> snapshot) {
    var json = snapshot.data()!;
    var id = snapshot.id;
    var meals = <Meal>[];
    if (json['meals'] != null) {
      json['meals']!.forEach((v) {
        meals.add(MealEntity.fromSnapShot(v));
      });
    }
    return MealSection(
      id: id,
      name: json['name'] as String,
      meals: meals,
    );
  }
}
