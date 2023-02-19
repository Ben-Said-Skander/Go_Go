// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/models/medicine.dart';

class AddMedicine extends StatefulWidget {
  const AddMedicine({super.key});

  @override
  State<AddMedicine> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  late TextEditingController med_nameController;
  late TextEditingController med_dosageController;
  late TextEditingController starting_timeController;
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
  void initState() {
    med_nameController = TextEditingController();
    med_dosageController = TextEditingController();
    starting_timeController = TextEditingController();
    super.initState();
  }

  FocusNode myFocusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    return DropdownMenuItem(value: items, child: Text(items));
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
                  Get.back();

                  /*
                Medicine newEntryMedicine = Medicine(
                  notificationID: notificationIDs,
                  medicineName: medicineName ,
                  dosage: dosage,
                  medicineType: medicineType,
                  startingTime: startingTime
                ),*/
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
