// ignore_for_file: prefer_const_constructors, must_be_immutable, non_constant_identifier_names, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:pfa_application_1/constants/colors.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 40.0, 0, 40),
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
                    "Details",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        MedicineInfo(
            med_name: "Doliprane",
            med_dosage: "500mg",
            med_pic: "IMAGE/piills.jpgh"),
        MidSectionInfo(
            med_type: "Pill",
            dosage_interval: "Every 6 hours",
            start_time: "14h"),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 130, 20, 0),
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
                  "Delete",
                  style: TextStyle(color: Colors.white),
                ))),
          ),
        ),
      ])),
    );
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
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Text(
              "Medicine Type",
              style: TextStyle(color: AppColor.mainColor, fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
            child: Text(
              med_type,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
            child: Text(
              "Dosage Interval",
              style: TextStyle(color: AppColor.mainColor, fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
            child: Text(
              dosage_interval,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
            child: Text(
              "Start Time",
              style: TextStyle(color: AppColor.mainColor, fontSize: 18),
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
          padding: const EdgeInsets.fromLTRB(20, 0, 100, 0),
          child: Image.asset(
            "IMAGE/piills.jpg",
            width: 130,
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "Medicine Name",
                style: TextStyle(color: AppColor.mainColor, fontSize: 15),
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
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                "Dosage",
                style: TextStyle(color: AppColor.mainColor, fontSize: 15),
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
