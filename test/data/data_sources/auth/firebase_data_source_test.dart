// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:karrishni/core/constants/firebase_paths.dart';
// import 'package:karrishni/core/mappers/entity_mappers/user_entity.dart';
// import 'package:karrishni/data/data_sources/auth/auth_data_srouce_impl.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:karrishni/domain/entities/auth/user.dart' as entity;
// // import 'package:karrishni/data/data_sources/auth/firebase_data_srouce.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// import 'firebase_data_source_test.mocks.dart';

//   /*
//     I haven't tested auth part because I'm having issue with firebase auth
//     A problem with toString method of FirebaseAuth!!
//     type 'Null' is not a subtype of type 'String' in type cast
//     MockFirebaseAuth.toString
//     */

//   /*
//     I haven't tested firestore part because I'm having issues with mocks
//     and the packages in pub are not up-to-date
//     */

// @GenerateMocks(
//   [],
//   customMocks: [MockSpec<FirebaseAuth>(returnNullOnMissingStub: true)],
// )
// void main() {
//   late AuthDataSourceImpl authDataSource;
//   late MockFirebaseAuth mockFirebaseAuth;
  // late MockFire mockFirebaseFirestore;

  // setUp(() {
  //   mockFirebaseAuth = MockFirebaseAuth();
  //   mockFirebaseFirestore = MockFirebaseFirestore();
  //   authDataSource = AuthDataSourceImpl(
  //     auth: mockFirebaseAuth,
  //     store: mockFirebaseFirestore,
  //   );
  // });

  // group('verifyByPhoneNumber', () {
  //   test('should call the method with firebase', () async {
  //     // Act
  //     await firebaseAuth.verifyByPhoneNumber('');
  //     // Assert
  //     verify(mockFirebaseAuth.verifyPhoneNumber());
  //   });
  // });

  // group('loginWithCredential', () {
  //   test('should call signInWithCredential and pass the credential', () async {
  //     // Arrange
  //     var mockCredential = MockAuthCredential();
  //     when(mockFirebaseAuth.signInWithCredential(mockCredential));

  //     // Act
  //     await firebaseAuth.loginWithCredential(mockCredential);

  //     // Assert
  //     verify(mockFirebaseAuth.signInWithCredential(mockCredential));
  //   });
  // });

//   group('addNewUser', () {
//     test('should add new user to store', () {
//       // Arrange
//       when(mockFirebaseFirestore.collection(any))
//           .thenReturn(mockCollectionReference);
//       when(mockCollectionReference.doc(any)).thenReturn(mockDocumentReference);
//       when(mockDocumentReference.get())
//           .thenAnswer((_) async => mockDocumentSnapshot);
//       when(mockDocumentSnapshot.data()).thenReturn({});
//       final user =
//           entity.User(id: 'user_token', name: '', image: '', phoneNumber: '');
//       when(mockFirebaseFirestore
//               .collection(FirebasePaths.userCollection)
//               .withConverter(
//                 fromFirestore: (snap, _) =>
//                     UserMapper.fromJson(snap.data()!, 'user_token'),
//                 toFirestore: (entity.User user, _) => UserMapper.toJson(user),
//               )
//               .add(user))
//           .thenAnswer((_) async => null);
//     });
//   });
// }
