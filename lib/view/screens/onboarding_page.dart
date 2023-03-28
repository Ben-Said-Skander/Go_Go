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
              color: Color.fromARGB(255, 16, 152, 170),
              borderRadius: BorderRadius.only()),
          child: Center(
              child: Image.asset(
            "assets/image/logo.png",
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
                        height: 700,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 180,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 23, right: 15),
                              child: Text(
                                "Locate the drug you need  ",
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
                              padding: EdgeInsets.only(left: 60, right: 15),
                              child: Text(
                                "No longer need to search , Locate the nearest pharmacy that has the drug you look for",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: Color.fromARGB(255, 130, 130, 130),
                                    fontFamily: "Poppins"),
                              ),
                            ),
                            Image.asset(
                              "assets/image/dot1.jpg",
                              width: 160,
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
                                  Get.toNamed(AppRoute.signup);
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
                      Container(
                        height: 600,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 180,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 50, right: 15),
                              child: Text(
                                "You dont have to worry about remembering your medicines ",
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
                              padding: EdgeInsets.only(left: 50, right: 15),
                              child: Text(
                                "A pill remminder system to make sure you never skip taking your medicines",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: "Poppins",
                                    color: Color.fromARGB(255, 130, 130, 130)),
                              ),
                            ),
                            Image.asset(
                              "assets/image/dot2.jpg",
                              width: 180,
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
                                  Get.toNamed(AppRoute.signup);
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
                                "A community to help you when in need",
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
                                "A place where you can discuss your health issue and where you can find help",
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
                                  Get.toNamed(AppRoute.signup);
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
