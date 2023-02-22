// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, camel_case_types, avoid_unnecessary_containers

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/blog_controller.dart';

import 'package:pfa_application_1/controllers/medicine_controller.dart';
//import 'package:pfa_application_1/controllers/blog_controller.dart';
import 'package:pfa_application_1/core/constants/colors.dart';

import 'package:pfa_application_1/core/functions/alertDeleteMedicine.dart';
import 'package:pfa_application_1/models/blog.dart';

import 'package:pfa_application_1/models/medicine.dart';


class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  BlogController blogController = Get.find();
  late TextEditingController med_nameController;
  late TextEditingController med_dosageController;
  late TextEditingController starting_timeController;
  late Future<Blog> futureCard;
  @override
  void initState() {
    futureCard = blogController.getArticle("id");
    med_nameController = TextEditingController();
    med_dosageController = TextEditingController();
    starting_timeController = TextEditingController();
    super.initState();
  }

  String dropdownvalue = "Every 2 hours";
  var intervals = [
    "Every 1 hour",
    "Every 2 hours",
    "Every 4 hours",
    "Every 6 hours",
    "Every 8 hours",
    "Every 12 hours",
    "Every 24 hours",
  ];
  int selectedIndex = 0;

  @override
  void dispose() {
    med_nameController.dispose();
    med_dosageController.dispose();
    starting_timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: futureCard,
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return ListView(children: [
                  Stack(
                    children: [
                      Image.asset(
                        "assets/image/doliprane.jpg",
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 12, top: 5),
                          child: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                              ))),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 190, 0, 0),
                        child: Container(
                          height: 622,
                          width: double.infinity,
                          //   height: 800,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 240, 240, 240),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 12,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(22, 10, 0, 10),
                                  child: Text("Blog Title",
                                      style: TextStyle(
                                          color: AppColor.mainColor,
                                          fontFamily: "Poppins",
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 40),
                                  child: Text("Blog body is here",
                                      style: TextStyle(
                                        fontSize: 16,
                                      )),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  )
                ]);
              } else {
                return Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Center(
                      child: Text("No Reminders found",
                          style: TextStyle(
                              fontSize: 20,
                              color: AppColor.mainColor,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins"))),
                );
              }
            })));
  }
}

class MidSectionInfo extends StatelessWidget {
  const MidSectionInfo(
      {super.key,
      required this.med_type,
      required this.dosage_interval,
      required this.start_time});
  final String med_type;
  final String dosage_interval;
  final String start_time;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
            child: Text(
              "Medicine Type",
              style: TextStyle(
                color: AppColor.mainColor,
                fontSize: 18,
                fontFamily: "Poppins",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 25),
            child: Text(
              med_type,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
            child: Text(
              "Dosage Interval",
              style: TextStyle(
                color: AppColor.mainColor,
                fontSize: 18,
                fontFamily: "Poppins",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 25),
            child: Text(
              dosage_interval,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
            child: Text(
              "Start Time",
              style: TextStyle(
                color: AppColor.mainColor,
                fontSize: 18,
                fontFamily: "Poppins",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
            child: Text(
              start_time,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      )
    ]);
  }
}

class MedicineInfo extends StatelessWidget {
  const MedicineInfo(
      {super.key,
      required this.med_name,
      required this.med_dosage,
      required this.med_pic});

  final String med_name;
  final String med_dosage;
  final String med_pic;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 30, 0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6,
                    spreadRadius: 1,
                    color: Color.fromARGB(255, 207, 207, 207),
                  )
                ]),
            width: 180,
            height: 250,
            margin: EdgeInsets.all(16),
            child: Image.asset(
              "assets/image/piills.jpg",
              width: 100,
              height: 100,
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "Medicine Name",
                style: TextStyle(
                  color: AppColor.mainColor,
                  fontSize: 15,
                  fontFamily: "Poppins",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                med_name,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text(
                "Dosage",
                style: TextStyle(
                  color: AppColor.mainColor,
                  fontSize: 15,
                  fontFamily: "Poppins",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                med_dosage,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        )
      ],
    );
  }
}

/*
Scaffold(
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 18.0, 0, 28),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios)),
              Padding(
                padding: const EdgeInsets.only(left: 80.0),
                child: Center(
                  child: Text(
                    "Add New Medicine",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Titles(title: "Medicine name"),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          width: 350,
          child: TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.secondryColor)),
                hintText: "Medicine name",
                prefixIcon: Icon(FontAwesomeIcons.pills)),
            controller: med_nameController,
            cursorColor: Color.fromARGB(255, 16, 152, 170),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 25, 20, 0),
          child: Titles(title: "Dosage in mg"),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          width: 350,
          child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.secondryColor)),
                hintText: "Dosage",
                prefixIcon: Icon(FontAwesomeIcons.pills)),
            controller: med_dosageController,
            cursorColor: Color.fromARGB(255, 16, 152, 170),
          ),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(30, 50, 20, 0),
            child: Text("Medicine Type",
                style: TextStyle(
                    color: AppColor.mainColor,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600))),
        MedicineType(),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Row(
            children: [
              Text("Remind me every",
                  style: TextStyle(
                      color: AppColor.mainColor,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600)),
              SizedBox(
                width: 20,
              ),
              DropdownButton(
                  iconEnabledColor: AppColor.mainColor,
                  hint: Text("Select Interval"),
                  elevation: 4,
                  value: dropdownvalue, // initial value
                  items: intervals.map((String items) {
                    return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                          style: TextStyle(fontFamily: "Poppins"),
                        ));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  })
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(25, 13, 0, 0),
          child: Row(
            children: [
              Text(
                "Starting Time",
                style: TextStyle(
                    color: AppColor.mainColor,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                width: 200,
                child: TextFormField(
                  controller: starting_timeController,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColor.secondryColor)),
                      hintText: "16:05:00"),
                  cursorColor: Color.fromARGB(255, 16, 152, 170),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColor.mainColor),
            child: TextButton(
                onPressed: () {
                  //   medicineController.fetchMedicines();                               WORKING
                  //   medicineController.deleteMedicine("63f0b81b2b2c0d040edfc10c");     WORKING
                  //   medicineController.getMedicine("63f0b82e2b2c0d040edfc10e");        WORKING
                      medicineController.addMedicine(
                      "ska", "500", "xxx", "startingTime", "6");
                  Get.back();
                },
                child: Center(
                    child: Text(
                  "Confirm",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600),
                ))),
          ),
        ),
      ]),
    );
  }
}

class Titles extends StatelessWidget {
  const Titles({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
      child: Container(
        child: Text(
          title,
          style: TextStyle(
              color: AppColor.mainColor,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class MedicineType extends StatefulWidget {
  const MedicineType({super.key});

  @override
  State<MedicineType> createState() => _MedicineTypeState();
}

class _MedicineTypeState extends State<MedicineType> {
  int bottleIndex = 0;
  int pillsIndex = 0;
  int syringeIndex = 0;

  Color bottleColor = Colors.grey;
  Color pillsColor = Colors.grey;
  Color syringeColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.bottleDroplet,
                ),
                iconSize: 70,
                onPressed: () {
                  setState(() {
                    bottleIndex = 1;
                    pillsIndex = 0;
                    syringeIndex = 0;
                  });
                  if (bottleIndex == 1) {
                    bottleColor = Color.fromARGB(255, 4, 107, 120);
                    pillsColor = Colors.grey;
                    syringeColor = Colors.grey;
                  }
                },
                color: bottleColor,
              ),
              Text("Bottle")
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    pillsIndex = 1;
                    bottleIndex = 0;
                    syringeIndex = 0;
                  });
                  if (pillsIndex == 1) {
                    pillsColor = Color.fromARGB(255, 4, 107, 120);
                    syringeColor = Colors.grey;
                    bottleColor = Colors.grey;
                  }
                },
                icon: Icon(FontAwesomeIcons.pills, color: pillsColor),
                iconSize: 70,
              ),
              Text("Pills")
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    syringeIndex = 1;
                    pillsIndex = 0;
                    bottleIndex = 0;
                  });
                  if (syringeIndex == 1) {
                    syringeColor = Color.fromARGB(255, 4, 107, 120);
                    bottleColor = Colors.grey;
                    pillsColor = Colors.grey;
                  }
                },
                icon: Icon(FontAwesomeIcons.syringe, color: syringeColor),
                iconSize: 70,
              ),
              Text("Syringe")
            ],
          ),
        ],
      ),
    );
  }
}
*/