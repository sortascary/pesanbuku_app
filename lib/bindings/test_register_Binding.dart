import 'package:get/get.dart';
import 'package:pesanbuku_app/controllers/test_register_controller.dart';

class TestRegisterBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => TestRegisterController());
  }
} 