// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, use_full_hex_values_for_flutter_colors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/core/functions/alertExit.dart';
import 'package:pfa_application_1/view/screens/chat/chat.dart';

import 'package:pfa_application_1/view/screens/search%20drivers/search_drivers.dart';
//import 'package:pfa_application_1/view/screens/medicine%20description/medicine_description.dart';
import 'package:pfa_application_1/view/screens/carpool%20request/carpool_request.dart';
import 'package:pfa_application_1/view/screens/search%20page/search_page.dart';
import 'package:pfa_application_1/view/screens/settings.dart';

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
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CurvedNavigationBar(
              height: 55,
              buttonBackgroundColor: Color(0x46A569),
              items: [
                Icon(
                  FontAwesomeIcons.car,
                  size: 20,
                ),
                Icon(
                  FontAwesomeIcons.locationDot,
                  size: 20,
                ),
                Icon(
                  FontAwesomeIcons.peopleGroup,
                  size: 20,
                ),
                Icon(
                  FontAwesomeIcons.comment,
                  size: 20,
                ),
                Icon(
                  FontAwesomeIcons.user,
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
            child: IndexedStack(index: selectedIndex, children: [
              CarpoolRequest(),
              SearchPage(),
              SearchDriversPage(),
              Chat(),
              Settings()
            ]),
            onWillPop: alertExit));
  }
}
