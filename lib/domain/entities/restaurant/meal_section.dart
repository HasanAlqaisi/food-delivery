import 'package:equatable/equatable.dart';
import 'package:karrishni/domain/entities/restaurant/meal.dart';

class MealSection extends Equatable {
  MealSection({required this.id, required this.name, required this.meals});
  
  final String id;
  final String name;
  final List<Meal> meals;

  @override
  List<Object?> get props => [id, name, meals];
}
