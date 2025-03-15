import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pesanbuku_app/Controllers/bottom_nav_bar_controller.dart';

class BottomNavBar extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25), 
        topRight: Radius.circular(25), 
      ),
      child: Container(
        color: const Color.fromARGB(183, 212, 182, 101), 
        child: Obx(() => BottomNavigationBar(
              currentIndex: controller.selectedIndex.value,
              onTap: controller.changeTab,
              selectedItemColor: const Color.fromARGB(255, 255, 255, 255), 
              unselectedItemColor: const Color.fromARGB(255, 18, 16, 16), 
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
                  icon: _buildIconWithCircle(2, Icons.person_outline_outlined),
                  label: "",
                ),
              ],
            )),
      ),
    );
  }


  Widget _buildIconWithCircle(int index, IconData iconData) {
    return Container(
      padding: EdgeInsets.all(8), 
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: controller.selectedIndex.value == index
            ? const Color.fromARGB(255, 7, 5, 4)
            : Colors.transparent, 
      ),
      child: Icon(iconData),
    );
  }
}