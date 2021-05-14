import 'package:karrishni/core/error/faillure.dart';

String mapFailureToString(Failure failure) {
  if (failure is FirebaseFailure) {
    return failure.messageFailure ?? 'ERROR CODE:' + failure.codeFailure;
  } else {
    failure = (failure as UnknownFailure);
    return failure.message ?? 'Unknown Failure, try again!';
  }
}
