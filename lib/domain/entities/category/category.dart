import 'package:equatable/equatable.dart';

class Category extends Equatable {
  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.restaurants,
  });

  final String id;
  final String name;
  final String? image;
  final List<String>? restaurants;

  @override
  List<Object?> get props => [id, name, image, restaurants];
}
