import 'package:get/get.dart';
import 'package:pesanbuku_app/Contollers/test_register_controller.dart';

class TestRegisterBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => TestRegisterController());
  }
} 