import 'package:equatable/equatable.dart';
import 'choice.dart';

class Addition extends Equatable {
  Addition({
    required this.name,
    required this.oneShot,
    required this.choices,
  });

  final String name;
  final bool oneShot;
  final List<Choice> choices;

  @override
  List<Object?> get props => [name, oneShot, choices];
}
