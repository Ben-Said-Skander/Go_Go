import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/core/constants/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double imageOpacity = 0;
  double _opacity = 0;

  @override
  void initState() {
    Timer(Duration(seconds: 3), () => Get.offAndToNamed(AppRoute.onBoarding));
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1;
      });
    });
     Timer(Duration(seconds: 3), () => Get.offAndToNamed(AppRoute.onBoarding));
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        imageOpacity = 1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Center(
        child: Padding(
        padding: const EdgeInsets.only(top: 160.0),
        child: AnimatedOpacity(
          opacity: imageOpacity,
          duration: Duration(milliseconds:1500), // Set the duration of the fade animation
          child: Image.asset(
            "assets/image/logo.png",
            width: 200,
            height: 200,
          ),
        ),),),
      Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 300.0),
          child: Text("By ",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  color: AppColor.mainColor)),
        ),
      ),
      Center(
          child: AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(milliseconds:1500), // Set the duration of the fade animation
          child: Text(" Ben Said Skander",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold))),
    
      
    )]));
  }
}
