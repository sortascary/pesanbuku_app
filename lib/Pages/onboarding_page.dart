import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pesanbuku_app/Widgets/custom_painter_background.dart';
import 'package:pesanbuku_app/Widgets/option_card.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            painter: BackgroundPainter(),
            child: SizedBox.expand(),
          ),
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Image.asset(
                  'assets/Images/logo_maestro.png',
                  height: 140,
                ),
                const SizedBox(height: 5),
                const Text(
                  "Penerbit : CV. Hasan Pratama",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 30),
                const Text(
                  "WELCOME!",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Pilih tipe pihak yang sesuai dengan kebutuhan Anda:",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 250),
              child: Wrap(
                spacing: 30,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  OptionCard(
                      imagePath: 'assets/Images/distributor.png',
                      title: 'Distributor',
                      onTap: () => Get.toNamed('/registerDistributor')),
                  OptionCard(
                      imagePath: 'assets/Images/sekolah.png',
                      title: 'Sekolah',
                      onTap: () => Get.toNamed('/registerSekolah')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
