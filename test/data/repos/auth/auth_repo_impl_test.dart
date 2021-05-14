import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:karrishni/data/repos/auth/auth_repo_impl.dart';
import 'package:karrishni/domain/data_sources/auth/auth_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repo_impl_test.mocks.dart';
import '../../../shared_mocks.mocks.dart';

@GenerateMocks([AuthDataSource, UserCredential])
void main() {
  late MockAuthDataSource authDataSource;
  late AuthRepoImpl authRepo;

  setUp(() {
    authDataSource = MockAuthDataSource();
    authRepo = AuthRepoImpl(authDataSource: authDataSource);
  });

  group('verifyByPhoneNumber', () {
    test('should call the method from data source ', () async {
      // Arrange
      when(authDataSource.verifyByPhoneNumber(
              '', (d, s) {}, (s) {}, (s) {}, (s) {}))
          .thenAnswer((_) async => null);

      // Act
      await authRepo.verifyByPhoneNumber('', (d, s) {}, (s) {}, (s) {}, (s) {});

      // Assert
      verify(authDataSource.verifyByPhoneNumber(
          '', (d, s) {}, (s) {}, (s) {}, (s) {}));
    });
  });

  group('loginWithCredential', () {
    test('should call the method from data source ', () async {
      // Arrange
      final authCredential = MockAuthCredential();
      when(authDataSource.loginWithCredential(authCredential))
          .thenAnswer((_) async => MockUserCredential().user);

      // Act
      await authRepo.loginWithCredential(authCredential);

      // Assert
      verify(authDataSource.loginWithCredential(authCredential));
    });
  });
}
