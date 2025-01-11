import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quadb/controller/navigation_controller.dart';
import 'package:quadb/pages/home_screen.dart';
import 'package:quadb/pages/search_page.dart';


class MainScreen extends StatelessWidget {
  final NavigationController navigationController = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => navigationController.selectedIndex.value == 0
        ? HomePage()
        : SearchPage());
  }
}