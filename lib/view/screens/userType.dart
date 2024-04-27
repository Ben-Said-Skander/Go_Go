// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';


import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/core/constants/routes.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';

class UserType extends StatefulWidget {
  const UserType({super.key});

  @override
  State<UserType> createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        ClipPath(
          clipper: ProsteThirdOrderBezierCurve(
            position: ClipPosition.bottom,
            list: [
              ThirdOrderBezierCurveSection(
                p1: Offset(0, 100),
                p2: Offset(0, 210),
                p3: Offset(MediaQuery.of(context).size.width, 100),
                p4: Offset(MediaQuery.of(context).size.width, 200),
              ),
            ],
          ),
          child: Container(
            height: 200,
            color: AppColor.mainColor,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 48.0),
              child: Center(
                  child: Text(
                "Sign Up",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Poppins"),
              )),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 35, 0, 0),
          child: Text(
            "Choose your profile",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontFamily: "Poppins",
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 48.0, top: 110, right: 40),
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    IconButton(
                        icon: Icon(
                          FontAwesomeIcons.car,
                          size: 100,
                        ),
                        onPressed: () {
                          Get.toNamed(AppRoute.driverSignUp);
                        }),
                    SizedBox(height: 80),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        'Driver',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ])),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 58.0, top: 110),
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    IconButton(
                        icon: Icon(
                          FontAwesomeIcons.person,
                          size: 100,
                        ),
                        onPressed: () {
                          Get.toNamed(AppRoute.signup);
                        }),
                    SizedBox(height: 80),
                    Text(
                      'Passenger',
                      style: TextStyle(fontSize: 20),
                    ),
                  ])),
            ),
          ],
        )
      ],
    ));
  }
}
