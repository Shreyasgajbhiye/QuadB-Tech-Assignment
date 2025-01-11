import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quadb/constant/colors.dart';
import 'package:quadb/controller/fetch_all.controller.dart';
import 'package:quadb/controller/navigation_controller.dart';
import 'package:quadb/widget/bottom_nav_bar.dart';
import 'package:quadb/widget/card.dart';
import 'package:quadb/pages/search_page.dart'; 

class HomePage extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  final NavigationController navigationController =
      Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.bg_color,
        title: Text(
          "Home Screen", 
          style: TextStyle(color: AppColor.title_color)
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: AppColor.title_color),
            onPressed: () => navigationController.changeIndex(1),
          ),
        ],
      ),
      backgroundColor: AppColor.bg_color,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(mq.width * 0.02),
          child: Obx(
            () => homeController.isLoading.value
                ? Center(
                    child: Container(
                      height: mq.height * 0.35,
                      width: double.infinity,
                      color: Colors.black12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            color: Colors.red,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Loading...',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: mq.width * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ))
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