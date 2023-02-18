// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, recursive_getters, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/core/constants/colors.dart';

import 'package:pfa_application_1/core/constants/routes.dart';
import 'package:pfa_application_1/view/widgets/curve_clipper.dart';

class Reminders extends StatefulWidget {
  const Reminders({super.key});

  @override
  State<Reminders> createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.addMedicine);
        },
        backgroundColor: Color.fromARGB(255, 16, 152, 170),
        child: Icon(
          Icons.add,
          color: Color.fromARGB(255, 251, 251, 251),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 170,
          child: ClipPath(
              clipper: CurveClipper(),
              child: Container(
                color: AppColor.mainColor,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Text(
                      "Reminder",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 35, 0, 0),
            child: Text(" Worry less , Live healthier ",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w700))),
        Container(
          height: 500,
          //padding: EdgeInsets.only(top: 15),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: 4,
              itemBuilder: ((context, index) {
                return MedCard(
                    med_name: "Doliprane",
                    med_pic: "assets/image/sirop.jpg",
                    med_interval: "Every 8 hours");
              })),
        ),
      ]),
    );
  }
}

class MedCard extends StatelessWidget {
  const MedCard(
      {Key? key,
      required this.med_name,
      required this.med_pic,
      required this.med_interval})
      : super(key: key);
  final String med_name;
  final String med_pic;
  final String med_interval;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.toNamed(AppRoute.details);
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  blurRadius: 6,
                  spreadRadius: 1,
                  color: Color.fromARGB(255, 207, 207, 207),
                )
              ]),
          width: 200,
          height: 600,
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Image.asset(
                med_pic,
                width: 100,
                height: 100,
              )),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Text(
                  med_name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Text(
                  med_interval,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ));
  }
}
