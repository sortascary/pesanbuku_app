import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pesanbuku_app/Widgets/custom_painter_background.dart';

class RegisterPage extends StatelessWidget {
  final String userType;

  RegisterPage({Key? key, required this.userType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                    onPressed: () => Get.offAllNamed('/onboarding'),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "Create Account",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Create an account so you can\nexplore all the items available",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          if (userType == 'distributor') ...[
                            buildTextField("Nama"),
                            buildTextField("Password", isPassword: true),
                            buildTextField("Confirm Password", isPassword: true),
                            buildTextField("Distributor Key"),
                          ] else if (userType == 'sekolah') ...[
                            buildTextField("Nama sekolah"),
                            buildTextField("Kepala/Perwakilan sekolah"),
                            buildTextField("Password", isPassword: true),
                            buildTextField("Confirm Password", isPassword: true),
                            buildTextField("Nomor Telp/WA"),
                            buildDropdown(),
                          ],
                          SizedBox(height: 25),
                          ElevatedButton(
                            onPressed: () {
                              if (userType == 'sekolah') {
                                Get.offNamed('/loginSekolah');
                              } else {
                                Get.offNamed('/loginDistributor');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber,
                              minimumSize: Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text("Sign up", style: TextStyle(color: Colors.white)),
                          ),
                          SizedBox(height: 35),
                          Center(
                            child: Text.rich(
                              TextSpan(
                                text: "Already have an account? ",
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
                                          Get.toNamed('/loginSekolah');
                                        } else {
                                          Get.toNamed('/loginDistributor');
                                        }
                                      },
                                      child: Text(
                                        "Login",
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

  Widget buildTextField(String hint, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextField(
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

  Widget buildDropdown() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: DropdownButtonFormField<String>(
        items: ["Kudus", "Jepara", "Demak"].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {},
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
          hintText: "Daerah",
        ),
      ),
    );
  }
}
