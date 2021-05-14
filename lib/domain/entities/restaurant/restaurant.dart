import 'package:equatable/equatable.dart';
import 'package:karrishni/domain/entities/auth/user.dart';
import 'package:karrishni/domain/entities/restaurant/meal_section.dart';

import 'promo.dart';

class Restaurant extends Equatable {
  Restaurant({
    required this.id,
    required this.owner,
    required this.name,
    required this.image,
    required this.deliveryPrice,
    required this.address,
    required this.city,
    required this.mealSections,
    required this.promos,
  });

  final String id;
  final User owner;
  final String name;
  final String image;
  final String deliveryPrice;
  final String address;
  final String city;
  final List<MealSection> mealSections;
  final List<Promo> promos;

  @override
  List<Object?> get props => [
        id,
        owner,
        name,
        image,
        deliveryPrice,
        address,
        city,
        mealSections,
        promos,
      ];
}
