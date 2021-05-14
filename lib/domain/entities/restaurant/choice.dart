import 'package:equatable/equatable.dart';

class Choice extends Equatable {
  Choice({required this.id, required this.name, required this.price});

  final String id;
  final String name;
  final double price;

  @override
  List<Object?> get props => [id, name, price];
}
