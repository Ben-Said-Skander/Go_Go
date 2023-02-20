// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, camel_case_types, avoid_unnecessary_containers

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/core/constants/routes.dart';
import 'package:pfa_application_1/view/widgets/curve_clipper.dart';
import 'package:pfa_application_1/view/widgets/wave_clipper.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  late TextEditingController searchController;

  @override
  void dispose() {
    searchController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    searchController = TextEditingController();

    super.initState();
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.mainColor,
        body: ListView(children: [
          SizedBox(
            height: 100,
          ),
          Stack(
            children: [
              Container(
                height: 800,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100.0),
                      topRight: Radius.circular(100),
                    )),
              ),
              Container(
                height: 100,
                child: ListView(children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                    width: 100,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Search for your medicines",
                        hintStyle: TextStyle(color: Colors.black),
                        prefixIcon:
                            Icon(FontAwesomeIcons.search, color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 200, 200, 200)),
                            borderRadius: BorderRadius.circular(30)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 200, 200, 200)),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      controller: searchController,
                      cursorColor: Color.fromARGB(255, 16, 152, 170),
                    ),
                  ),
                ]),
              ),
            ],
          )
        ]));
  }
}
