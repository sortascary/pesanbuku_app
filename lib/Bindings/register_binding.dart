import 'package:get/get.dart';
import 'package:pesanbuku_app/Controllers/auth/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
