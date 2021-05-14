import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure extends Equatable {
  final List properties;
  Failure(this.properties);

  @override
  List<Object?> get props => properties;
}

class UnknownFailure extends Failure {
  final String? message;

  UnknownFailure({required this.message}) : super([message]);
}

class FirebaseFailure extends FirebaseAuthException implements Failure {
  FirebaseFailure({required this.codeFailure, required this.messageFailure})
      : super(code: codeFailure, message: messageFailure);

  final String codeFailure;
  final String? messageFailure;

  @override
  List get properties => [codeFailure, messageFailure];

  @override
  List<Object?> get props => [codeFailure, messageFailure];

  @override
  bool? get stringify => throw true;
}
