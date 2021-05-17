import 'package:karrishni/domain/entities/restaurant/choice.dart';

abstract class ChoiceEntity {
  static Choice fromSnapShot(Map<String, Object?> json) {
    return Choice(
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
    );
  }
}
