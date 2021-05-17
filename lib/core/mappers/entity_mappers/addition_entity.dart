import 'package:karrishni/core/mappers/entity_mappers/choice_entity.dart';
import 'package:karrishni/domain/entities/restaurant/addition.dart';
import 'package:karrishni/domain/entities/restaurant/choice.dart';

abstract class AdditionEntity {
  static Addition fromSnapShot(
      Map<String, dynamic?> json) {
    var choices = <Choice>[];
    if (json['choices'] != null) {
      json['choices'].forEach((v) {
        choices.add(ChoiceEntity.fromSnapShot(v));
      });
    }
    return Addition(
      name: json['name'] as String,
      oneShot: json['one_shot'] as bool,
      choices: choices,
    );
  }
}
