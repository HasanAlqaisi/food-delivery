import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:karrishni/domain/entities/restaurant/meal_section.dart';
import 'package:karrishni/domain/entities/restaurant/promo.dart';
import 'package:karrishni/domain/entities/restaurant/restaurant.dart';

abstract class RestaurantEntity {
  static Restaurant fromSnapShot(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    List<MealSection> mealSections,
    List<Promo> promos,
  ) {
    var json = snapshot.data()!;
    var id = snapshot.id;
    return Restaurant(
      id: id,
      name: json['name'] as String,
      owner: json['owner'] as String,
      image: json['image'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      deliveryPrice: (json['delivery_price'] as num).toDouble(),
      mealSections: mealSections,
      promos: promos,
    );
  }
}
