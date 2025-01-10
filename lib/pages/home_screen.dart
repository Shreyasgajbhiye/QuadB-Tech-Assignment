import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quadb/constant/colors.dart';
import 'package:quadb/controller/fetch_all.controller.dart';
import 'package:quadb/controller/navigation_controller.dart';
import 'package:quadb/widget/bottom_nav_bar.dart';
import 'package:quadb/widget/card.dart';

class HomePage extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  final NavigationController navigationController = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
        var mq = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.bg_color,
        title: Text("Home Screen", style: TextStyle(
          color: AppColor.title_color
        )),),
     
      backgroundColor: AppColor.bg_color,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(mq.width * 0.02),
          child: Obx(
            () => homeController.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: homeController.showsList.length,
                    itemBuilder: (context, index) {
                      final show = homeController.showsList[index].show;
                      return ShowCard(show: show);
                    },
                  ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
