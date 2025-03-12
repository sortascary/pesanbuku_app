import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pesanbuku_app/Contollers/register_controller.dart';
import 'package:pesanbuku_app/Widgets/custom_painter_background.dart';

class RegisterPage extends StatelessWidget {
  final String userType;

  RegisterPage({Key? key, required this.userType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.find<RegisterController>();

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          Get.offAllNamed('/onboarding');
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
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Get.offAllNamed('/onboarding'),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Create Account",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Create an account so you can explore all the items available",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                          SizedBox(height: 30),
                          if (userType == 'distributor') ...[
                            buildTextField(controller.nameController, "Nama"),
                            buildTextField(
                                controller.passwordController, "Password",
                                isPassword: true),
                            buildTextField(
                                controller.keyController, "Distributor Key"),
                          ] else if (userType == 'sekolah') ...[
                            buildTextField(controller.schoolNameController,
                                "Nama Sekolah"),
                            buildTextField(controller.headNameController,
                                "Kepala Sekolah"),
                            buildTextField(
                                controller.passwordController, "Password",
                                isPassword: true),
                            buildTextField(
                                controller.phoneController, "Nomor Telepon/WA"),
                          ],
                          buildDropdown(controller),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1),
                          Obx(() => ElevatedButton(
                                onPressed: controller.isLoading.value
                                    ? null
                                    : () async {
                                        await controller.register();
                                        if (userType == 'sekolah') {
                                          Get.offNamed('/loginSekolah');
                                        } else {
                                          Get.offNamed('/loginDistributor');
                                        }
                                      },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.amber,
                                  minimumSize: Size(double.infinity, 50),
                                ),
                                child: controller.isLoading.value
                                    ? CircularProgressIndicator(
                                        color: Colors.white)
                                    : Text("Sign up",
                                        style: TextStyle(color: Colors.white)),
                              )),
                          SizedBox(height: 10),
                          TextButton(
                            onPressed: () {
                              if (userType == 'sekolah') {
                                Get.toNamed('/loginSekolah');
                              } else {
                                Get.toNamed('/loginDistributor');
                              }
                            },
                            child: Text(
                              "Already have an account? Login",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String hint,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }

  Widget buildDropdown(RegisterController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: DropdownButtonFormField<String>(
        value: controller.selectedRegion.value.isNotEmpty
            ? controller.selectedRegion.value
            : null,
        items: ["Kudus", "Jepara", "Demak"].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          controller.selectedRegion.value = value!;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.grey[200],
          hintText: "Daerah",
        ),
      ),
    );
  }
}
