import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:karrishni/domain/entities/auth/user.dart' as entity;

abstract class UserMapper {
  static entity.User toEntity(firebase.User user) {
    return entity.User(
      id: user.uid,
      name: user.displayName,
      image: user.photoURL,
      phoneNumber: user.phoneNumber,
    );
  }

  static entity.User fromJson(Map<String, Object?> json) {
    return entity.User(
      id: json['id'] as String,
      name: json['name'] as String?,
      image: json['image'] as String?,
      phoneNumber: json['phone_number'] as String?,
    );
  }

  static Map<String, Object?> toJson(entity.User user) => {
        'name': user.name,
        'image': user.image,
        'phone_number': user.phoneNumber,
      };
}
