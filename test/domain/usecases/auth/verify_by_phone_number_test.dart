import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:karrishni/domain/repos/auth/auth_repo.dart';
import 'package:karrishni/domain/usecases/auth/verify_by_phone_number.dart';
import 'package:mockito/mockito.dart';

import 'verify_by_phone_number_test.mocks.dart';

@GenerateMocks([AuthRepo])
void main() {
  late MockAuthRepo authRepo;
  late VerifyByPhoneNumber verifyByPhoneNumber;

  setUp(() {
    authRepo = MockAuthRepo();
    verifyByPhoneNumber = VerifyByPhoneNumber(authRepo: authRepo);
  });

  group('VerifyByPhoneNumber', () {
    test('should call VerifyByPhoneNumber method', () async {
      // Arrange
      VerifyParams params = VerifyParams(
        phoneNumber: '',
        codeSent: (d, s) {},
        codeAutoRetrievalTimeout: (v) {},
        verificationCompleted: (credential) {},
        verificationFailed: (exception) {},
      );
      when(authRepo.verifyByPhoneNumber('', (d, s) {}, (s) {}, (s) {}, (s) {}))
          .thenAnswer((_) async => Right(null));

      // Act
      await verifyByPhoneNumber(params);

      // Assert
      verify(
          authRepo.verifyByPhoneNumber('', (d, s) {}, (s) {}, (s) {}, (s) {}));
    });
  });
}
