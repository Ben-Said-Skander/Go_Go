// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_new

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/core/constants/routes.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late PageController pageController;

  @override
  void initState() {
    pageController = new PageController(initialPage: 0, viewportFraction: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: ListView(children: [
        Container(
          height: 250,
          decoration: BoxDecoration(
              color: AppColor.mainColor, borderRadius: BorderRadius.only()),
          child: Center(
              child: Image.asset(
            "assets/image/go.png",
            width: 200,
            height: 230,
          )),
        ),
        Container(
            height: 590,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(250),
                )),
            child: Column(
              children: [
                Container(
                  height: 590,
                  child: PageView(
                    controller: pageController,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        height: 600,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 180,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 45, right: 15),
                              child: Text(
                                "Go & Gp: Your Carpool Companion",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Poppins"),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 40, right: 15),
                              child: Text(
                                "Go & Go simplifies your travels by connecting you with other users to share your rides. Economical, eco-friendly, and sociable, easily find carpoolers for your daily or occasional trips.",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: Color.fromARGB(255, 130, 130, 130),
                                    fontFamily: "Poppins"),
                              ),
                            ),
                            Image.asset(
                              "assets/image/dot3.jpg",
                              width: 100,
                              height: 100,
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColor.mainColor),
                              child: MaterialButton(
                                onPressed: () {
                                  Get.toNamed(AppRoute.userType);
                                },
                                child: Text("Get Started",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Poppins")),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ]),
    );
  }
}
