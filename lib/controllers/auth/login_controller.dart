import 'package:get/get.dart';
import 'package:pesanbuku_app/Routes/Routes.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;
  var userType = ''.obs;
  var isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));

    if (username.value == "admin" && password.value == "123") {
      userType.value = "admin";
      Get.offNamed(MyRoutes.dashboardDistributor, arguments: {"userRole": "admin"}); 
    } else if (username.value == "sekolah" && password.value == "123") {
      userType.value = "sekolah";
      Get.offNamed(MyRoutes.dashboardSekolah, arguments: {"userRole": "sekolah"});  
    } else {
      Get.snackbar("Error", "Username atau Password salah",
          snackPosition: SnackPosition.BOTTOM);
    }

    isLoading.value = false;
  }
}
