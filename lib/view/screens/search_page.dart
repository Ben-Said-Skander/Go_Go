// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pfa_application_1/core/constants/colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      SafeArea(
        child: Container(
          height: 140,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30)),
              color: Color.fromARGB(255, 16, 152, 170)),
          child: Center(
              child: Container(
            padding: EdgeInsets.only(top: 40),
            width: 350,
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Search for your medical drug",
                hintStyle: TextStyle(color: Colors.black),
                prefixIcon:
                    Icon(FontAwesomeIcons.searchengin, color: Colors.black),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(30)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(30)),
              ),
              controller: searchController,
              cursorColor: Color.fromARGB(255, 16, 152, 170),
            ),
          )),
        ),
      ),
      SizedBox(
        height: 200,
      ),
      Center(
          child: Text(
        "MAP HERE !!!",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
        ),
      ))
    ]));
  }
}
