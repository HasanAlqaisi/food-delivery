import 'package:equatable/equatable.dart';

import 'addition.dart';

class Meal extends Equatable {
  Meal({
    required this.id,
    required this.name,
    required this.desc,
    required this.image,
    required this.price,
    required this.sale,
    required this.additions,
  });

  final String id;
  final String name;
  final String desc;
  final String image;
  final double price;
  final int sale;
  final List<Addition> additions;

  @override
  List<Object?> get props => [id, name, desc, image, price, sale, additions];
}
