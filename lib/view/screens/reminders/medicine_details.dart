// ignore_for_file: prefer_const_constructors, must_be_immutable, non_constant_identifier_names, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/medicine_controller.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/core/functions/alertDeleteMedicine.dart';
import 'package:pfa_application_1/models/medicine.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  MedicineController medicineController = Get.find();
  late Future<Medicine> futureCard;
  @override
  void initState() {
    futureCard = medicineController.getMedicine("id");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 40.0, 0, 40),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios)),
              Padding(
                padding: const EdgeInsets.only(left: 108.0),
                child: Center(
                  child: Text(
                    "Details",
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
        FutureBuilder<Medicine>(
            future: futureCard,
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MedicineInfo(
                          med_name: "${snapshot.data!.name}",
                          med_dosage: "${snapshot.data!.dosage}",
                          med_pic: "assets/piills.jpgh"),
                      MidSectionInfo(
                          med_type: "${snapshot.data!.type}",
                          dosage_interval: "${snapshot.data!.interval}",
                          start_time: "14h"),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: AppColor.mainColor),
                          child: TextButton(
                              onPressed: () {
                                alertDeleteMedicine();
                                medicineController.deleteMedicine("id");
                                //Get.back();
                              },
                              child: Center(
                                  child: Text(
                                "Delete",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins",
                                ),
                              ))),
                        ),
                      ),
                    ]);
              } else {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MedicineInfo(
                          med_name: "Doliprane",
                          med_dosage: "500mg",
                          med_pic: "assets/piills.jpgh"),
                      MidSectionInfo(
                          med_type: "Pill",
                          dosage_interval: "Every 6 hours",
                          start_time: "14h"),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: AppColor.mainColor),
                          child: TextButton(
                              onPressed: () {
                                alertDeleteMedicine();
                                medicineController.deleteMedicine("id");
                                //Get.back();
                              },
                              child: Center(
                                  child: Text(
                                "Delete",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins",
                                ),
                              ))),
                        ),
                      ),
                    ]);
                /* return Padding(
                  padding: const EdgeInsets.only(top: 250.0),
                  child: Center(
                      child: Text("Request failed",
                          style: TextStyle(
                              fontSize: 20,
                              color: AppColor.mainColor,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins"))),
                );*/
              }
            }))
      ],
    ));
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
