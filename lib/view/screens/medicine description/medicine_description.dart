// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, camel_case_types, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/medicine_description_controller.dart';

import 'package:pfa_application_1/core/constants/colors.dart';

import 'package:proste_bezier_curve/proste_bezier_curve.dart';

class MedicineDescriptionPage extends StatefulWidget {
  const MedicineDescriptionPage({super.key});

  @override
  State<MedicineDescriptionPage> createState() => _MedicineDescriptionState();
}

class _MedicineDescriptionState extends State<MedicineDescriptionPage> {
  late TextEditingController searchController;
  DescriptionController descriptionController = Get.find();
  var description = "";
  var user = "";
  var how = "";
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
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: ListView(children: [
      Container(
          height: 150,
          width: double.infinity,
          child: ClipPath(
            clipper: ProsteBezierCurve(
              position: ClipPosition.bottom,
              list: [
                BezierCurveSection(
                  start: Offset(0, 125),
                  top: Offset(screenWidth / 4, 150),
                  end: Offset(screenWidth / 2, 125),
                ),
                BezierCurveSection(
                  start: Offset(screenWidth / 2, 125),
                  top: Offset(screenWidth / 4 * 3, 100),
                  end: Offset(screenWidth, 150),
                ),
              ],
            ),
            child: Container(
              color: AppColor.mainColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Padding(
                    padding:
                        const EdgeInsets.only(top: 0.0, left: 0, bottom: 30),
                    child: Row(
                      children: [
                        Text("Search for your medicine",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Poppins")),
                      ],
                    )),
              ),
            ),
          )),
      Container(
        padding: EdgeInsets.only(top: 60, left: 20, right: 20),
        width: 400,
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: "Search for an medicine",
            hintStyle: TextStyle(color: Colors.black),
            prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass,
                color: AppColor.mainColor),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.mainColor),
                borderRadius: BorderRadius.circular(30)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.mainColor),
                borderRadius: BorderRadius.circular(30)),
          ),
          controller: searchController,
          cursorColor: Color.fromARGB(255, 16, 152, 170),
        ),
      ),
      Padding(
          padding: EdgeInsets.only(left: 100, right: 100, top: 20),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.mainColor),
            child: MaterialButton(
              onPressed: () async {
                var data = await descriptionController
                    .getMedicine(searchController.text);
                setState(() {
                  description = data["mainEntityOfPage"][0]["description"];
                  user = data["mainEntityOfPage"][2]["description"];
                  how = data["mainEntityOfPage"][3]["description"];
                });
                print("*******************************");
                print(description);
                print(user);
                print(how);
                print("*******************************");
              },
              child: Text("Search", style: TextStyle(color: Colors.white)),
            ),
          )),
      Padding(
        padding: const EdgeInsets.only(left: 28.0, top: 40),
        child: Text(
          "Name",
          style: TextStyle(
              color: AppColor.mainColor,
              fontSize: 18,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 28.0, top: 20),
        child: Text(
          searchController.text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: "Poppins",
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 28.0, top: 40),
        child: Text(
          "Description",
          style: TextStyle(
              color: AppColor.mainColor,
              fontSize: 18,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 28.0, top: 20),
        child: Text(
          description,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: "Poppins",
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 28.0, top: 40),
        child: Text(
          "Who can use it",
          style: TextStyle(
              color: AppColor.mainColor,
              fontSize: 18,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 28.0, top: 20),
        child: Text(
          user,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: "Poppins",
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 28.0, top: 40),
        child: Text(
          "How to use it",
          style: TextStyle(
              color: AppColor.mainColor,
              fontSize: 18,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 28.0, top: 20),
        child: Text(
          how,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: "Poppins",
          ),
        ),
      ),
      SizedBox(
        height: 60,
      )
    ]));
  }
}
