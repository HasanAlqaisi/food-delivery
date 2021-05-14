import 'package:equatable/equatable.dart';
import 'package:karrishni/domain/entities/restaurant/restaurant.dart';

class Category extends Equatable {
  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.restaurants,
  });

  final String id;
  final String name;
  final String image;
  final List<Restaurant> restaurants;

  @override
  List<Object?> get props => [id, name, image, restaurants];
}
