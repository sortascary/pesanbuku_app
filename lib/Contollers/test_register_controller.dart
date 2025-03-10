import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pesanbuku_app/Routes/Routes.dart';

class TestRegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final PhoneController = TextEditingController();
  final OTPController = TextEditingController();

  final isLoading = false.obs;

  var verifyID = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> SendOTP() async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: PhoneController.text,
        verificationCompleted: (phoneAuthCredential) async {
          // Auto sign-in if verification is completed automatically.
          await _auth.signInWithCredential(phoneAuthCredential);
          Get.offAllNamed(MyRoutes.login); // Navigate to home on success.
        },
        verificationFailed: (error) {
          log(error.toString());
          Get.snackbar("Verification Failed", error.message ?? "Unknown error");
        },
        codeSent: (verificationId, forceResendingToken) {
          verifyID.value = verificationId;
          Get.toNamed(MyRoutes.testOTP);
        },
        codeAutoRetrievalTimeout: (verificationId) {
          log("Auto retrieval timed out");
        },
      );
    } catch (e) {
      log("Error sending OTP: $e");
      Get.snackbar("Error", "Failed to send OTP");
    }
  }

  Future<void> VerifyOTP() async {
    try {
      final cred = PhoneAuthProvider.credential(
        verificationId: verifyID.value, 
        smsCode: OTPController.text
      );
      UserCredential userCredential = await _auth.signInWithCredential(cred);
      Get.snackbar(
        'login',
        'tis was a success',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } catch (e) {
      print('sumthin aint right: $e');
    }
  }
}
