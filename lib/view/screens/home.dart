// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, use_full_hex_values_for_flutter_colors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/view/screens/blog/blog.dart';
import 'package:pfa_application_1/view/screens/reminder.dart';
import 'package:pfa_application_1/view/screens/search_page.dart';

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
        backgroundColor: Colors.grey.shade200,
        bottomNavigationBar: CurvedNavigationBar(
          height: 55,
          buttonBackgroundColor: Color(0x46A569),
          items: [
            Icon(Icons.notifications_active_outlined),
            Icon(Icons.search),
            Icon(Icons.book_sharp),
          ],
          index: selectedIndex,
          backgroundColor: AppColor.mainColor,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
        body: IndexedStack(index: selectedIndex, children: [
          Reminders(),
          SearchPage(),
          Blog(),
        ]));
  }
}
