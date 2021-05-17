import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:karrishni/domain/entities/category/category.dart';

abstract class CategoryEntity {
  static Category fromSnapShot(
      DocumentSnapshot<Map<String, Object?>> snapshot) {
    var json = snapshot.data()!;
    var id = snapshot.id;
    return Category(
      id: id,
      name: json['name'] as String,
      image: json['image'] as String?,
      restaurants: List.from(json['restaurants'] as List),
    );
  }
}
