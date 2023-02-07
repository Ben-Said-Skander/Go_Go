// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pfa_application_1/constants/colors.dart';

class AddMedicine extends StatefulWidget {
  const AddMedicine({super.key});

  @override
  State<AddMedicine> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  late TextEditingController med_nameController;
  late TextEditingController med_dosageController;

  @override
  void dispose() {
    med_nameController.dispose();
    med_dosageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    med_nameController = TextEditingController();
    med_dosageController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 18.0, 0, 40),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios)),
              Padding(
                padding: const EdgeInsets.only(left: 108.0),
                child: Center(
                  child: Text(
                    "Add New",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        Titles(title: "Medicine Name"),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: TextFormField(
            style: TextStyle(color: Colors.black),
            controller: med_nameController,
            cursorColor: AppColor.mainColor,
            keyboardType: TextInputType.text,
          ),
        ),
        Titles(title: "Dosage in mg"),
        TextFormField(),
        Padding(
            padding: EdgeInsets.fromLTRB(10, 50, 0, 0),
            child: Text("Medicine Type")),
        MedicineType(),
        Titles(title: "Interval Selection"),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 30, 0, 0),
          child: Row(
            children: [Text("Remind me every")],
          ),
        ),
        Titles(title: "Starting Time"),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColor.mainColor),
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("reminder");
                },
                child: Center(
                    child: Text(
                  "Confirm",
                  style: TextStyle(color: Colors.white),
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
          style: TextStyle(color: Colors.black),
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
  int selectedIndex = 0;
  Color medicineCouleur = Colors.grey;
  void changeColor() {
    if (selectedIndex == 1) {
      setState(() {
        medicineCouleur = AppColor.mainColor;
      });
    }
  }

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
                  color: AppColor.medicineColor,
                ),
                iconSize: 70,
                onPressed: () {
                  setState(() {
                    selectedIndex = 1;
                    medicineCouleur = AppColor.mainColor;
                  });
                },
              ),
              Text("Bottle")
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    selectedIndex = 1;
                    changeColor();
                  });
                },
                icon:
                    Icon(FontAwesomeIcons.pills, color: AppColor.medicineColor),
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
                    selectedIndex = 1;
                    changeColor();
                  });
                },
                icon: Icon(FontAwesomeIcons.syringe,
                    color: AppColor.medicineColor),
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
