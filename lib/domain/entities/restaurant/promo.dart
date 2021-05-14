import 'package:equatable/equatable.dart';

class Promo extends Equatable {
  Promo({required this.id, required this.name, required this.amount});

  final String id;
  final String name;
  final String amount;

  @override
  List<Object?> get props => [id, name, amount];
}
