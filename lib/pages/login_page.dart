import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pesanbuku_app/controllers/auth/login_controller.dart';
import 'package:pesanbuku_app/Widgets/custom_painter_background.dart';

class LoginPage extends StatelessWidget {
  final String userType;

  LoginPage({Key? key, required this.userType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: BackgroundPainter(),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                    onPressed: () => Get.offAllNamed('/onboarding'),
                  ),
                  SizedBox(height: 50),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "Login to Account",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Welcome back you’ve\nbeen missed!",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 120),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          buildTextField(controller.phoneController, "Nama"),
                          buildTextField(controller.passwordController, "Password", isPassword: true),
                          SizedBox(height: 25),
                          Obx(() => ElevatedButton(
                                onPressed: controller.isLoading.value ? null : controller.login,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.amber,
                                  minimumSize: Size(double.infinity, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: controller.isLoading.value
                                    ? CircularProgressIndicator(color: Colors.white)
                                    : Text("Login", style: TextStyle(color: Colors.white)),
                              )),
                          SizedBox(height: 35),
                          Center(
                            child: Text.rich(
                              TextSpan(
                                text: "Don't have an account? ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  WidgetSpan(
                                    child: GestureDetector(
                                      onTap: () {
                                        if (userType == 'sekolah') {
                                          Get.toNamed('/registerSekolah');
                                        } else {
                                          Get.toNamed('/registerDistributor');
                                        }
                                      },
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String hint, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }
}
