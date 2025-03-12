import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pesanbuku_app/Contollers/login_controller.dart';
import 'package:pesanbuku_app/Widgets/custom_painter_background.dart';

class LoginPage extends StatelessWidget {
  final String userType;

  LoginPage({Key? key, required this.userType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          if (userType == 'sekolah') {
            Get.offNamed('/registerSekolah');
          } else {
            Get.offNamed('/registerDistributor');
          }
        }
      },
      child: Scaffold(
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
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          if (userType == 'sekolah') {
                            Get.offNamed('/registerSekolah');
                          } else {
                            Get.offNamed('/registerDistributor');
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Login to Account",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Welcome back you’ve been missed!",
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                          SizedBox(height: 30),
                          TextField(
                            onChanged: (value) =>
                                controller.username.value = value,
                            decoration: InputDecoration(
                              labelText: "Nama",
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                          SizedBox(height: 15),
                          TextField(
                            obscureText: true,
                            onChanged: (value) =>
                                controller.password.value = value,
                            decoration: InputDecoration(
                              labelText: "Password",
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                          SizedBox(height: 20),
                          Obx(() => ElevatedButton(
                                onPressed: controller.isLoading.value
                                    ? null
                                    : controller.login,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.amber,
                                  minimumSize: Size(double.infinity, 50),
                                ),
                                child: controller.isLoading.value
                                    ? CircularProgressIndicator(
                                        color: Colors.white)
                                    : Text("Login",
                                        style: TextStyle(color: Colors.white)),
                              )),
                          SizedBox(height: 10),
                          Obx(() => controller.userType.value.isNotEmpty
                              ? Text(
                                  "Anda login sebagai: ${controller.userType.value}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              : SizedBox()),
                          SizedBox(height: 10),
                          TextButton(
                            onPressed: () {
                              if (userType == 'sekolah') {
                                Get.toNamed('/registerSekolah');
                              } else {
                                Get.toNamed('/registerDistributor');
                              }
                            },
                            child: Text(
                              "Don't have an account? Sign up",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
