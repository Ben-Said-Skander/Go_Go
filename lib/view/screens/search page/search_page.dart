// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/models/medicine_desciption.dart';
import 'package:pfa_application_1/service/remote.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
RemoteService remoteService=Get.find() ;
  late Future<List<MedicineDescription>> drugsList;
  late TextEditingController searchController;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    drugsList = remoteService.getMedicines();
    searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        FutureBuilder(
            future: drugsList,
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return SafeArea(
                  child: Stack(
                    children: [
                      Container(
                          height: 200,
                          width: 450,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30)),
                              color: Color.fromARGB(255, 16, 152, 170)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 32, left: 25),
                                child: Text("Locate your medicines",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Poppins")),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 40, left: 20),
                                width: 400,
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Locate your medicines",
                                    hintStyle: TextStyle(color: Colors.black),
                                    prefixIcon: Icon(
                                        FontAwesomeIcons.magnifyingGlass,
                                        color: Colors.black),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  ),
                                  controller: searchController,
                                  cursorColor:
                                      Color.fromARGB(255, 16, 152, 170),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                );
              } else {
                return SafeArea(
                  child: Stack(
                    children: [
                      Container(
                          height: 200,
                          width: 450,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30)),
                              color: Color.fromARGB(255, 16, 152, 170)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 32, left: 25),
                                child: Text("Locate your medicines",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Poppins")),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 40, left: 20),
                                width: 400,
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Locate your medicines",
                                    hintStyle: TextStyle(color: Colors.black),
                                    prefixIcon: Icon(
                                        FontAwesomeIcons.magnifyingGlass,
                                        color: Colors.black),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  ),
                                  controller: searchController,
                                  cursorColor:
                                      Color.fromARGB(255, 16, 152, 170),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                );
              }
            }))
      ],
    ));
  }
}
