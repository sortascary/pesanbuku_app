import 'package:get/get.dart';
import 'package:pesanbuku_app/Bindings/test_register_Binding.dart';
import 'package:pesanbuku_app/Pages/Login_page.dart';
import 'package:pesanbuku_app/Pages/test_OTP_page.dart';
import 'package:pesanbuku_app/Pages/test_register_page.dart';

class MyRoutes {
  static const String login = '/';
  static const String register = '/register';
  static const String dash = '/dash';
  static const String notif = '/notif';

  //this is just for testing
  static const String testR = '/testR';
  static const String testOTP = '/testOTP';
}

class AppPages{
  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage(
      name: MyRoutes.login,
      page: () => LoginPage(),
      //TODO: add binding
    ),
    GetPage(
      name: MyRoutes.testR,
      page: () => TestRegisterPage(),
      binding: TestRegisterBinding(),
    ),
    GetPage(
      name: MyRoutes.testOTP,
      page: () => TestOtpPage(),
      binding: TestRegisterBinding(),
    ),
  ];
}