import 'package:equatable/equatable.dart';

class User extends Equatable {
  User({
    required this.id,
    required this.name,
    required this.image,
    required this.phoneNumber,
  });

  final String id;
  final String? name;
  final String? image;
  final String? phoneNumber;

  @override
  List<Object?> get props => [id, name, image, phoneNumber];
}
