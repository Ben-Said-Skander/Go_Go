// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, recursive_getters, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/medicine_controller.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/core/constants/routes.dart';
import 'package:pfa_application_1/models/medicine.dart';
import 'package:pfa_application_1/view/widgets/component/reminder_med_card.dart';

import 'package:pfa_application_1/view/widgets/curve_clipper.dart';

class Reminders extends StatefulWidget {
  const Reminders({super.key});

  @override
  State<Reminders> createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
  final medicineController = Get.put(MedicineController());
  //MedicineController medicineController = Get.find();
  late List<Medicine> medicineList = [];
  String medTypeImage = "pills.jpg";
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshData();
  }

  Future<void> refreshData() async {
    setState(() {
      isLoading = true;
    });
    try {
      final List<Medicine> medicines =
          await medicineController.fetchMedicines();
      setState(() {
        medicineList = medicines;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: 'btn1',
        onPressed: () {
          Get.toNamed(AppRoute.addMedicine);
        },
        backgroundColor: Color.fromARGB(255, 16, 152, 170),
        child: Icon(
          Icons.add,
          color: Color.fromARGB(255, 251, 251, 251),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: refreshData,
        child: ListView(
          children: [
            Container(
              height: 170,
              child: ClipPath(
                clipper: CurveClipper(),
                child: Container(
                  color: AppColor.mainColor,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Reminder",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 35, 0, 30),
              child: Text(
                " Worry less, Live healthier",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Poppins",
                ),
              ),
            ),
            Container(
              height: 500,
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : medicineList.isNotEmpty
                      ? GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemCount: medicineList.length,
                          itemBuilder: ((context, index) {
                            return GestureDetector(
                              onTap: () {
                                var id = "${medicineList[index].id}";
                                Get.toNamed(
                                  AppRoute.details,
                                  arguments: id,
                                );
                              },
                              child: ReminderMedCard(
                                med_name: "${medicineList[index].name}",
                                med_pic:
                                    "assets/image/${medicineList[index].type}.jpg",
                                med_interval: "${medicineList[index].interval}",
                              ),
                            );
                          }),
                        )
                      : Center(
                          child: Text(
                            "No medicines found.",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColor.mainColor,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
