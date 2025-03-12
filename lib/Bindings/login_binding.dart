import 'package:get/get.dart';
import 'package:pesanbuku_app/Contollers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
