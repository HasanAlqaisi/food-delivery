import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:karrishni/bindings/home_binding.dart';
import 'package:karrishni/bindings/phone_verification_binding.dart';
import 'package:karrishni/representation/auth/pages/phone_verificatoin_page.dart';
import 'package:karrishni/representation/auth/pages/sms_code_page.dart';
import 'package:karrishni/representation/main/home/pages/home_page.dart';
import 'package:karrishni/representation/main/home/pages/restaurant_page.dart';

import 'app_routes.dart';

abstract class AppPages {
  static const initial = Routes.phoneVerificationPage;

  static final routes = [
    GetPage(
      name: Routes.phoneVerificationPage,
      page: () => PhoneVerifictionPage(),
      binding: PhoneVerificationBinding(),
      children: [
        GetPage(
          name: Routes.smsCodePage,
          page: () => SmsCodePage(),
        ),
      ],
    ),
    GetPage(
      name: Routes.homePage,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(name: Routes.restaurantPage, page: () => RestaurantPage())
  ];
}
