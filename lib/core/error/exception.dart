import 'package:equatable/equatable.dart';

class UnknownException extends Equatable implements Exception {
  UnknownException({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
