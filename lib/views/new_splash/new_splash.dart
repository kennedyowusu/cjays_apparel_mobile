import 'dart:async';

import 'package:cjays/constants/images.dart';
import 'package:cjays/routes/routes_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewSplashScreen extends StatefulWidget {
  const NewSplashScreen({super.key});

  @override
  State<NewSplashScreen> createState() => _NewSplashScreenState();
}

class _NewSplashScreenState extends State<NewSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<double> opacity;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..forward();
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    );
    Timer(
      Duration(seconds: 3),
      () {
        Get.offAllNamed(
          RouteHelper.getInitialRoute(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ScaleTransition(
                scale: animation,
                child: Image.asset(
                  ProjectImages.kCart,
                  height: height * 0.3,
                  width: width * 0.3,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.001,
            ),
            Center(
              child: Text(
                "Welcome to CJays".toUpperCase(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
