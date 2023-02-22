// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, recursive_getters, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:pfa_application_1/controllers/medicine_controller.dart';
import 'package:pfa_application_1/core/constants/colors.dart';

import 'package:pfa_application_1/core/constants/routes.dart';
import 'package:pfa_application_1/view/widgets/component/reminder_med_card.dart';
//import 'package:pfa_application_1/models/medicine.dart';
import 'package:pfa_application_1/view/widgets/curve_clipper.dart';



class Reminders extends StatefulWidget {
  const Reminders({super.key});

  @override
  State<Reminders> createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
 // MedicineController medicineController = Get.find();
  //late final Future<List<Medicine>> futureCard;
  @override
  void initState() {
  //  futureCard = medicineController.fetchMedicines();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.addMedicine);
        },
        backgroundColor: Color.fromARGB(255, 16, 152, 170),
        child: Icon(
          Icons.add,
          color: Color.fromARGB(255, 251, 251, 251),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 170,
          child: ClipPath(
              clipper: CurveClipper(),
              child: Container(
                color: AppColor.mainColor,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Text(
                      "Reminder",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontFamily: "Poppins"),
                    ),
                  ),
                ),
              )),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 35, 0, 0),
            child: Text(" Worry less , Live healthier ",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Poppins"))),
        Container(
          height: 500,
          //padding: EdgeInsets.only(top: 15),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: 4,
              itemBuilder: ((context, index) {
                return ReminderMedCard(
                    med_name: "Doliprane",
                    med_pic: "assets/image/sirop.jpg",
                    med_interval: "Every 8 hours");
              })),
        ),
      ]),
    );
  }
}

//Get medicines test
/*
Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.addMedicine);
        },
        backgroundColor: Color.fromARGB(255, 16, 152, 170),
        child: Icon(
          Icons.add,
          color: Color.fromARGB(255, 251, 251, 251),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 170,
          child: ClipPath(
              clipper: CurveClipper(),
              child: Container(
                color: AppColor.mainColor,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Text(
                      "Reminder",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontFamily: "Poppins"),
                    ),
                  ),
                ),
              )),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 35, 0, 0),
            child: Text(" Worry less , Live healthier ",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Poppins"))),
        Container(
          height: 500,
          //padding: EdgeInsets.only(top: 15),
          child: FutureBuilder<List<Medicine>>(
              future: futureCard,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: snapshot.data?.length,
                      itemBuilder: ((context, index) {
                        return ReminderMedCard(
                            med_name: "Doliprane",
                            med_pic: "assets/image/sirop.jpg",
                            med_interval: "Every 8 hours");
                      }));
                } else {
                  return Center(
                    child: Text("No Reminders found",
                        style: TextStyle(
                            fontSize: 20,
                            color: AppColor.mainColor,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Poppins")),
                  );
                }
              }),
        )

        /* */
      ]),
    );
*/
