import 'package:equatable/equatable.dart';
import 'choice.dart';

class Addition extends Equatable {
  Addition({
    required this.id,
    required this.name,
    required this.oneShot,
    required this.choices,
  });

  final String id;
  final String name;
  final String oneShot;
  final List<Choice> choices;

  @override
  List<Object?> get props => [id, name, oneShot, choices];
}
