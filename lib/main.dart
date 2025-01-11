import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quadb/controller/navigation_controller.dart';
import 'package:quadb/pages/home_screen.dart';
import 'package:quadb/pages/search_page.dart';
import 'package:quadb/pages/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final NavigationController navigationController =
      Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
