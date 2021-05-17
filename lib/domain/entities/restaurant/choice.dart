import 'package:equatable/equatable.dart';

class Choice extends Equatable {
  Choice({required this.name, required this.price});

  final String name;
  final double price;

  @override
  List<Object?> get props => [name, price];
}
