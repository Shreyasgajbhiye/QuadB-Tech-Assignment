import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quadb/constant/colors.dart';
import 'package:quadb/controller/navigation_controller.dart';

class BottomNavBar extends StatelessWidget {
  final NavigationController controller = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        backgroundColor: AppColor.bg_color,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        currentIndex: controller.selectedIndex.value,
        onTap: controller.changeIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}
