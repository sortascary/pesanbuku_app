import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pesanbuku_app/controllers/test_register_controller.dart';

class TestRegisterPage extends StatelessWidget {
  const TestRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TestRegisterController registerController = Get.find();

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
              "Please enter your phone number",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 60.0,),
            TextField(
              controller: registerController.PhoneController,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                hintText: "Enter phone number here",
                filled: true,
                fillColor: const Color(0xFFDFDFDF),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide.none
                  ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide.none
                  ),
              ),
            ),
            SizedBox(height: 30.0,),
            ElevatedButton(
              onPressed: () {
                registerController.SendOTP();
              }, 
              child: Text(
                "Sign up",
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