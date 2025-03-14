import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RegisterController extends GetxController {
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
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;
    Get.snackbar("Success", "Akun berhasil dibuat!",
        snackPosition: SnackPosition.TOP);
  }
}
