import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';
import 'package:karrishni/data/data_sources/auth/auth_data_srouce_impl.dart';
import 'package:karrishni/data/repos/auth/auth_repo_impl.dart';
import 'package:karrishni/domain/data_sources/auth/auth_data_source.dart';
import 'package:karrishni/domain/repos/auth/auth_repo.dart';
import 'package:karrishni/domain/usecases/auth/add_new_user.dart';
import 'package:karrishni/domain/usecases/auth/auth_state_changes.dart';
import 'package:karrishni/domain/usecases/auth/create_phone_auth_credential.dart';
import 'package:karrishni/domain/usecases/auth/login_with_credential.dart';
import 'package:karrishni/domain/usecases/auth/verify_by_phone_number.dart';
import 'package:karrishni/representation/auth/controller/phone_verification_controller.dart';

class PhoneVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirebaseAuth.instance, fenix: true);
    Get.lazyPut(() => FirebaseFirestore.instance, fenix: true);
    Get.lazyPut<AuthDataSource>(
        () => AuthDataSourceImpl(auth: Get.find(), store: Get.find()));
    Get.lazyPut<AuthRepo>(() => AuthRepoImpl(authDataSource: Get.find()));
    Get.lazyPut(() => VerifyByPhoneNumber(authRepo: Get.find()));
    Get.lazyPut(() => LoginWithCredential(authRepo: Get.find()), fenix: true);
    Get.lazyPut(() => CreatePhoneAuthCredential(authRepo: Get.find()),
        fenix: true);
    Get.lazyPut(() => AuthStateChanges(authRepo: Get.find()), fenix: true);
    Get.lazyPut(() => AddNewUser(authRepo: Get.find()), fenix: true);
    Get.put(
      PhoneVerifController(
        verifyByPhoneNumber: Get.find(),
        loginWithCredential: Get.find(),
        createPhoneAuthCredential: Get.find(),
        addNewUser: Get.find(),
        authStateChanges: Get.find(),
      ),
      permanent: true,
    );
  }
}
