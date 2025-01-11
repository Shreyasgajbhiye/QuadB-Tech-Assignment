import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quadb/main.dart';
import 'package:quadb/pages/main_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToMain();
  }

  navigateToMain() async {
    await Future.delayed(Duration(seconds: 3));
    Get.off(() => MainScreen());
  }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: mq.height * 0.3,
              width: mq.width * 0.6,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('asset/logo.jpg'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              color: Colors.red,
            ),
            SizedBox(height: 20),
            Text(
              'QuadB-Tech Assignment',
              style: TextStyle(
                color: Colors.white,
                fontSize: mq.width * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
