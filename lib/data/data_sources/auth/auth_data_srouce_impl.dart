import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:karrishni/core/constants/constants.dart';
import 'package:karrishni/core/constants/firebase_paths.dart';
import 'package:karrishni/core/mappers/entity_mappers/user_entity.dart';
import 'package:karrishni/domain/data_sources/auth/auth_data_source.dart';
import 'package:karrishni/domain/entities/auth/user.dart' as entity;

class AuthDataSourceImpl extends AuthDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore store;

  late CollectionReference<entity.User> userRef;

  AuthDataSourceImpl({required this.auth, required this.store}) {
    userRef = store.collection(FirebasePaths.userCollection).withConverter(
          fromFirestore: (snap, _) => UserMapper.fromJson(snap.data()!),
          toFirestore: (entity.User user, _) => UserMapper.toJson(user),
        );
  }

  @override
  Future<void> verifyByPhoneNumber(
    String phoneNumber,
    void Function(String verificationId, int? resendToken) codeSent,
    void Function(String verificationId) codeAutoRetrievalTimeout,
    void Function(PhoneAuthCredential) verificationCompleted,
    void Function(FirebaseAuthException exception) verificationFailed,
  ) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
        timeout: timeOutPhoneVerification,
        verificationFailed: verificationFailed,
      );
    } catch (exception) {
      throw exception;
    }
  }

  @override
  Future<User?> loginWithCredential(AuthCredential authCredential) async {
    try {
      final userCredential = await auth.signInWithCredential(authCredential);
      return userCredential.user;
    } catch (exception) {
      throw exception;
    }
  }

  @override
  PhoneAuthCredential createPhoneAuthCredential(
    String smsCode,
    String verificationId,
  ) {
    final PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    return credential;
  }

  @override
  Stream<User?> authStateChangesStream() {
    return auth.authStateChanges();
  }

  @override
  Future<void> addNewUser(entity.User user) async {
    try {
      await userRef.doc(user.id).set(user, SetOptions(merge: true));
    } catch (exception) {
      throw exception;
    }
  }
}
