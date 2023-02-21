// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, camel_case_types, avoid_unnecessary_containers

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/blog_controller.dart';
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
  BlogController blogController = Get.find();
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
          Padding(
            padding: const EdgeInsets.only(top: 32, left: 25),
            child: Text("Search for your medicines",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins")),
          ),
          SizedBox(
            height: 40,
          ),
          Container( height: 105,
            color:Colors.white ,
            child: MaterialButton(
              onPressed: () {
                blogController.createArticle("blog333", "neww", "newww");
              },
              child: Text("Click here"),
            ),
          )
        ]));
  }
}
