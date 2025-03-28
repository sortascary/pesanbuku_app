import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pesanbuku_app/Routes/Routes.dart';
import 'package:pesanbuku_app/API/auth/auth_service.dart';

class LoginController extends GetxController {
  final AuthService auth = AuthService();

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var userType = ''.obs;
  var isLoading = false.obs;

  Future<void> login() async {
    try {
      isLoading.value = true;
      final fcmToken = await FirebaseMessaging.instance.getToken()?? "";
      if (phoneController.text.isEmpty || passwordController.text.isEmpty) {
        Get.snackbar("Error", "Phone and password are required");
        return;
      }
      // if (phoneController.text == "admin" && passwordController.text == "123") {
      //   userType.value = "admin";
      //   Get.offNamed(MyRoutes.dashboardDistributor, arguments: {"userRole": userType.value});
      // } else if (phoneController.text == "sekolah" && passwordController.text == "123") {
      //   userType.value = "sekolah";
      //   Get.offNamed(MyRoutes.dashboardSekolah, arguments: {"userRole": userType.value});
      // } else {
      //   Get.snackbar("Error", "Username atau Password salah",
      //       snackPosition: SnackPosition.BOTTOM);
      // }

      final response = await auth.login(
        phoneController.text, 
        passwordController.text, 
        fcmToken
      );

      print(response.data['message']);
      print(response.data['token']);
      userType.value = response.data['data']['role'];
      Get.offNamed(MyRoutes.dashboardDistributor,
          arguments: {"userRole": userType.value});
    } catch (e) {
      isLoading(true);
      Get.snackbar(
        "Gagal",
        "Silahkan cek email dan password anda! ",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        borderRadius: 30,
        margin: EdgeInsets.all(10),
      );
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
