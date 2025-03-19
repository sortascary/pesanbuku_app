import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pesanbuku_app/controllers/bottom_nav_bar_controller.dart';
import 'package:pesanbuku_app/Pages/dashboard_page.dart';
import 'package:pesanbuku_app/Pages/order_page.dart';
import 'package:pesanbuku_app/Pages/profile_page.dart';

class BottomNavBar extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());
  final String userRole;

  BottomNavBar({Key? key, required this.userRole}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      DashboardScreen(userRole: userRole),
      OrderPage(userRole: userRole),
      ProfilePage(userRole: userRole),
    ];

    return Scaffold(
      body: Obx(() => pages[controller.selectedIndex.value]),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: Container(
          color: const Color.fromARGB(183, 239, 236, 229),
          child: Obx(() => BottomNavigationBar(
                currentIndex: controller.selectedIndex.value,
                onTap: controller.changeTab,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.black,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                elevation: 0,
                items: [
                  BottomNavigationBarItem(
                    icon: _buildIconWithCircle(0, Icons.home_outlined),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: _buildIconWithCircle(1, Icons.shopping_cart_outlined),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon:
                        _buildIconWithCircle(2, Icons.person_outline_outlined),
                    label: "",
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget _buildIconWithCircle(int index, IconData iconData) {
    return Obx(() => Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: controller.selectedIndex.value == index
                ? Colors.black
                : Colors.transparent,
          ),
          child: Icon(iconData,
              color: controller.selectedIndex.value == index
                  ? Colors.white
                  : Colors.black),
        ));
  }
}
