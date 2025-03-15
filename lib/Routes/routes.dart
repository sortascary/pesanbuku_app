import 'package:get/get.dart';
import 'package:pesanbuku_app/bindings/login_binding.dart';
import 'package:pesanbuku_app/bindings/register_binding.dart';
import 'package:pesanbuku_app/pages/login_page.dart';
import 'package:pesanbuku_app/pages/register_Page.dart';
import 'package:pesanbuku_app/Pages/Onboarding_page.dart';
import 'package:pesanbuku_app/Pages/test/test_OTP_page.dart';
import 'package:pesanbuku_app/Pages/test/test_register_page.dart';
import 'package:pesanbuku_app/Pages/Dashboard_page.dart';

class MyRoutes {
  static const String login = '/login';
  static const String loginDistributor = '/loginDistributor';
  static const String onBoarding = '/onboarding';
  static const String loginSekolah = '/loginSekolah';
  static const String registerDistributor = '/registerDistributor';
  static const String registerSekolah = '/registerSekolah';
  static const String dashboardDistributor = '/dashboard_distributor';
  static const String dashboardSekolah = '/dashboard_sekolah';
  static const String testR = '/testR';
  static const String testOTP = '/testOTP';
}

class AppPages {
  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage(
      name: MyRoutes.loginDistributor,
      page: () => LoginPage(userType: 'distributor'),
      binding: LoginBinding(),
    ),
    GetPage(
      name: MyRoutes.loginSekolah,
       page: () => LoginPage(userType: 'sekolah'),
      binding: LoginBinding(),
    ),
    GetPage(
      name: MyRoutes.registerDistributor,
      page: () => RegisterPage(userType: 'distributor'), 
      binding: RegisterBinding(),
    ),
     GetPage(
      name: MyRoutes.dashboardDistributor,
      page: () => DashboardScreen(userRole: "admin"), 
    ),
    GetPage(
      name: MyRoutes.dashboardSekolah,
      page: () => DashboardScreen(userRole: "sekolah"), 
    ),
    GetPage(
      name: MyRoutes.onBoarding,
      page: () => OnboardingScreen(), 
      binding: RegisterBinding(),
    ),
    GetPage(
      name: MyRoutes.registerSekolah,
      page: () => RegisterPage(userType: 'sekolah'), 
      binding: RegisterBinding(),
    ),
    GetPage(
      name: MyRoutes.testR,
      page: () => TestRegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: MyRoutes.testOTP,
      page: () => TestOtpPage(),
      binding: RegisterBinding(),
    ),
  ];
}
