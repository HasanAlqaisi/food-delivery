import 'package:karrishni/core/mappers/entity_mappers/addition_entity.dart';
import 'package:karrishni/domain/entities/restaurant/addition.dart';
import 'package:karrishni/domain/entities/restaurant/meal.dart';

abstract class MealEntity {
  static Meal fromSnapShot(Map<String, dynamic?> json) {
    var additions = <Addition>[];
    if (json['additions'] != null) {
      json['additions'].forEach((v) {
        additions.add(AdditionEntity.fromSnapShot(v));
      });
    }
    return Meal(
      name: json['name'] as String,
      sale: json['sale'] as int,
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String,
      desc: json['desc'] as String,
      additions: additions,
    );
  }
}
