import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pesanbuku_app/Contollers/test_register_controller.dart';

class TestOtpPage extends StatelessWidget {
  const TestOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TestRegisterController otpController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text("Testing in progress"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "we have sent sms to ur phone plz verify nigga",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 60.0,),
            TextField(
              controller: otpController.OTPController,
              decoration: InputDecoration(
                hintText: "enter OTP here",
                filled: true,
                fillColor: Colors.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide.none
                  ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide.none
                  ),
              ),
            ),
            SizedBox(height: 30.0,),
            ElevatedButton(
              onPressed: () {
                otpController.VerifyOTP();
              }, 
              child: Text(
                "verify",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}