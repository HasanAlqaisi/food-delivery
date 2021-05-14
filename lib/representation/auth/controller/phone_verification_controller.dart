import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karrishni/core/error/faillure.dart';
import 'package:karrishni/core/mappers/map_failure_to_String.dart';
import 'package:karrishni/domain/usecases/auth/add_new_user.dart';
import 'package:karrishni/domain/usecases/auth/auth_state_changes.dart';
import 'package:karrishni/domain/usecases/auth/create_phone_auth_credential.dart';
import 'package:karrishni/domain/usecases/auth/login_with_credential.dart';
import 'package:karrishni/domain/usecases/auth/verify_by_phone_number.dart';
import 'package:karrishni/routes/app_routes.dart';

class PhoneVerifController extends GetxController {
  PhoneVerifController({
    required this.verifyByPhoneNumber,
    required this.loginWithCredential,
    required this.createPhoneAuthCredential,
    required this.addNewUser,
    required this.authStateChanges,
  });

  static PhoneVerifController get to => Get.find<PhoneVerifController>();

  final VerifyByPhoneNumber verifyByPhoneNumber;
  final LoginWithCredential loginWithCredential;
  final CreatePhoneAuthCredential createPhoneAuthCredential;
  final AddNewUser addNewUser;
  final AuthStateChanges authStateChanges;

  late FocusNode nameFocus;
  late FocusNode phoneFocus;
  late FocusNode smsNode;

  var nameLabelColor = Colors.grey;
  var phoneLabelColor = Colors.grey;
  var name = '';
  var phoneNumber = '';
  var verificationId = '';
  var smsCode = '';

  var userState = Rx<User?>(null);
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    nameFocus = FocusNode();
    phoneFocus = FocusNode();
    smsNode = FocusNode();

    bindStreams();

    ever(userState, checkUserAuthState);
  }

  void bindStreams() {
    userState.bindStream(listenToAuthStateChanges());
  }

  void checkUserAuthState(User? user) {
    if (user == null) {
      if (Get.currentRoute != Routes.phoneVerificationPage)
        Get.offAllNamed(Routes.phoneVerificationPage);
    } else {
      Get.offAllNamed(Routes.homePage);
    }
  }

  Stream<User?> listenToAuthStateChanges() => authStateChanges(NoParams());

  void onNextPressed() async {
    if (name.trim().isNotEmpty && phoneNumber.trim().isNotEmpty) {
      isLoading.value = true;

      verifyByPhoneNumber(
        VerifyParams(
          phoneNumber: phoneNumber,
          codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout,
          codeSent: _codeSent,
          verificationCompleted: _verificationCompleted,
          verificationFailed: _verificationFailed,
        ),
      ).then((result) {
        result.fold((failure) {
          isLoading.value = false;
          _showErrorMessage(failure);
        }, (_) => null);
      });
    }
  }

  void onSignInPressed() async {
    if (smsCode.trim().isNotEmpty) {
      isLoading(true);

      final credential = _createPhoneCredential();

      final loginResponse = await loginWithCredential(credential);

      loginResponse.fold(
        (failure) => _showErrorMessage(failure),
        (user) async => await addNewUser(user!),
      );

      isLoading.value = false;
    }
  }

  PhoneAuthCredential _createPhoneCredential() {
    final credential = createPhoneAuthCredential(CredentialParams(
      smsCode: smsCode,
      verificationId: verificationId,
    ));
    return credential;
  }

  void _codeAutoRetrievalTimeout(String verificationId) {
    this.verificationId = verificationId;
    if (Get.currentRoute == Routes.smsCodePage)
      Get.rawSnackbar(
          isDismissible: false,
          message: "Haven't got the code?",
          icon: Text('RESEND'),
          duration: Duration(days: 365));
  }

  void _codeSent(String verificationId, int? resendToken) {
    isLoading(false);
    this.verificationId = verificationId;
    Get.offNamed(Routes.smsCodePage);
    Get.rawSnackbar(
        message: 'Please check your phone for the verification code.');
  }

  void _verificationCompleted(phoneCredential) async {
    final result = await loginWithCredential(phoneCredential);
    result.fold(
      (failure) => _showErrorMessage(failure),
      (user) => null,
    );
  }

  void _verificationFailed(exception) {
    isLoading.value = false;
    Failure failure = FirebaseFailure(
        codeFailure: exception.code, messageFailure: exception.message);
    _showErrorMessage(failure);
  }

  void onFocusChange(bool hasFocus) {
    nameLabelColor = hasFocus ? Colors.red : Colors.grey;
    update();
  }

  void _showErrorMessage(Failure failure) {
    Get.rawSnackbar(message: mapFailureToString(failure));
  }

  @override
  void dispose() {
    super.dispose();
    nameFocus.dispose();
    phoneFocus.dispose();
    smsNode.dispose();
  }
}
