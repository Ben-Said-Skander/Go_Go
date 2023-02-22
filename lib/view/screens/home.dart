// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, use_full_hex_values_for_flutter_colors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/core/functions/alertExit.dart';
import 'package:pfa_application_1/view/screens/blog/blog.dart';
import 'package:pfa_application_1/view/screens/medicine%20description/medicine_description.dart';
import 'package:pfa_application_1/view/screens/reminders/reminder.dart';

import 'package:pfa_application_1/view/screens/search%20page/search_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: AppColor.medicineColor,
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(14),
          //   color: AppColor.medicineColor,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CurvedNavigationBar(
              height: 55,
              buttonBackgroundColor: Color(0x46A569),
              items: [
                Icon(
                  FontAwesomeIcons.bell,
                  size: 20,
                ),
                Icon(
                  FontAwesomeIcons.locationDot,
                  size: 20,
                ),
                Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 20,
                ),
                Icon(
                  FontAwesomeIcons.book,
                  size: 20,
                ),
              ],
              index: selectedIndex,
              color: Color.fromARGB(255, 223, 223, 223),
              backgroundColor: AppColor.mainColor,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ),
        ),
        body: WillPopScope(
           child:
            IndexedStack(index: selectedIndex, children: [
              Reminders(),
              SearchPage(),
              MedicineDescription(),
              Blog(),
            ]),
          onWillPop: alertExit)
           );
  }
}
