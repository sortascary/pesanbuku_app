import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pesanbuku_app/API/auth/auth_service.dart';

class RegisterController extends GetxController {
  final AuthService auth = AuthService();

  var userType = ''.obs;
  var isLoading = false.obs;

  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var keyController = TextEditingController();
  var schoolNameController = TextEditingController();
  var headNameController = TextEditingController();
  var phoneController = TextEditingController();
  var selectedRegion = ''.obs;

  Future<void> register() async {
    // isLoading.value = true;
    // await Future.delayed(Duration(seconds: 2));
    // isLoading.value = false;
    // Get.snackbar("Success", "Akun berhasil dibuat!",
    //     snackPosition: SnackPosition.TOP);
    try{
      isLoading.value = true;
      final fcmToken = await FirebaseMessaging.instance.getToken()?? "";
      if (phoneController.text.isEmpty || passwordController.text.isEmpty) {
        Get.snackbar("Error", "Phone and password are required");
        return;
      }

      final response = await auth.register(
        nameController.text,
        phoneController.text,
        selectedRegion.value,
        schoolNameController.text.isEmpty ? null : schoolNameController.text,
        userType.value,
        passwordController.text,
        fcmToken
      );

    } catch (e){
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
