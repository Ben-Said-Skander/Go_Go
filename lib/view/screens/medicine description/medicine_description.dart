// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, camel_case_types, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pfa_application_1/core/constants/colors.dart';

class MedicineDescription extends StatefulWidget {
  const MedicineDescription({super.key});

  @override
  State<MedicineDescription> createState() => _MedicineDescriptionState();
}

class _MedicineDescriptionState extends State<MedicineDescription> {
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
                            Icon(FontAwesomeIcons.magnifyingGlass, color: Colors.black),
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
              Padding(
                padding: const EdgeInsets.only(top: 130.0, left: 25),
                child: Text("Medicine name",
                    style: TextStyle(
                        color: AppColor.mainColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins")),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 270.0, left: 25),
                child: Text("Description",
                    style: TextStyle(
                        color: AppColor.mainColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins")),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 420.0, left: 25),
                child: Text("How to use it",
                    style: TextStyle(
                        color: AppColor.mainColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins")),
              )
            ],
          )
        ]));
  }
}
