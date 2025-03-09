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
    _auth.verifyPhoneNumber(
      phoneNumber: PhoneController.text,
      verificationCompleted: (phoneAuthCredential) {},
      verificationFailed: (error) {
        log(error.toString());
      },
      codeSent: (verificationId, forceResendingToken) {
        Get.toNamed(MyRoutes.testOTP);
        verifyID.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        print("auto retrival timed out");
      },
    );
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
