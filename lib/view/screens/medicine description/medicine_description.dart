// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, camel_case_types, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/models/medicine_desciption.dart';
import 'package:pfa_application_1/service/remote.dart';

class MedicineDescriptionPage extends StatefulWidget {
  const MedicineDescriptionPage({super.key});

  @override
  State<MedicineDescriptionPage> createState() => _MedicineDescriptionState();
}

class _MedicineDescriptionState extends State<MedicineDescriptionPage> {
  late List<MedicineDescription> allMedicines = [];
  late List<MedicineDescription> filteredMedicines = [];
  late TextEditingController searchController;
  RemoteService remoteService = Get.find();
  late Future<List<MedicineDescription>> futureCard;
  @override
  void dispose() {
    searchController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    searchController = TextEditingController();
    remoteService.getMedicines().then((medicines) {
      setState(() {
        allMedicines = medicines;
        filteredMedicines = allMedicines;
      });
    });
    super.initState();
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: [
          SafeArea(
            child: Stack(
              children: [
                Container(
                    height: 150,
                    width: 450,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40.0),
                            bottomRight: Radius.circular(40)),
                        color: Color.fromARGB(255, 16, 152, 170)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 25),
                          child: Text("Search for your medicines",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins")),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 18, left: 20),
                          width: 400,
                          child: TextFormField(
                            onChanged: (string) {
                              filteredMedicines = allMedicines
                                  .where((medicine) => medicine.generic_name
                                      .toString()
                                      .toLowerCase()
                                      .contains(string.toLowerCase()))
                                  .toList();
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Search for your medicines",
                              hintStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass,
                                  color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(30)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                            controller: searchController,
                            cursorColor: Color.fromARGB(255, 16, 152, 170),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 20),
            child: Text("Medicine name",
                style: TextStyle(
                    color: AppColor.mainColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins")),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 28.0, left: 25, top: 10),
            child: Text("Data",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins")),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 30),
            child: Text("Description",
                style: TextStyle(
                    color: AppColor.mainColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins")),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 28.0, left: 25, top: 10),
            child: Text("Data",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins")),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 30),
            child: Text("How to use it",
                style: TextStyle(
                    color: AppColor.mainColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins")),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 28.0, left: 25, top: 10),
            child: Text("data",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins")),
          ),
        ]));
  }
}
