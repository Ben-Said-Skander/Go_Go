// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      backgroundColor: Colors.grey.shade200,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 40.0, 0, 40),
          child: Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
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
            cursorColor: Colors.green,
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
          padding: const EdgeInsets.only(top: 15.0),
          child: TextButton(
              onPressed: () {}, child: Center(child: Text("Select Time"))),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: TextButton(
              onPressed: () {}, child: Center(child: Text("Confirm"))),
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
                  iconSize: 70,
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.bottleDroplet)),
              Text("Bottle")
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(FontAwesomeIcons.pills),
                iconSize: 70,
              ),
              Text("Pills")
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(FontAwesomeIcons.syringe),
                iconSize: 70,
              ),
              Text("Syringe")
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(FontAwesomeIcons.tablets),
                iconSize: 70,
              ),
              Text("Tablet")
            ],
          ),
        ],
      ),
    );
  }
}
