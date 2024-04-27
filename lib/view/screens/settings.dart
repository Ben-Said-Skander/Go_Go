// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_this, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/user_controller.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/core/constants/routes.dart';
import 'package:pfa_application_1/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  UserController userController = Get.find();
  late String? userId;

  @override
  void initState() {
    super.initState();
    getUserId().then((value) {
      setState(() {
        userId = value;
      });
    });
  }

  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = await prefs.getString('userID');
    print("****************************************");
    print(userId);
    print("****************************************");
    return userId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(15, 40, 0, 40),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios)),
            Padding(
              padding: const EdgeInsets.only(left: 110.0),
              child: Center(
                child: Text(
                  "Settings",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontFamily: "Poppins"),
                ),
              ),
            ),
          ],
        ),
      ),
      FutureBuilder<User>(
          future: userController.getUser(userId ?? ""),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return Column(children: [
                Column(
                  children: [
                    Center(
                        child: CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/image/user.png",
                      ),
                      radius: 40,
                    )),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "${snapshot.data!.fullname}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontFamily: "Poppins"),
                    ),
                  ],
                ),
                settingFormField("${snapshot.data!.fullname}", "Fullname",
                    "${snapshot.data!.id}", "Name"),
                settingFormField("${snapshot.data!.email}", "Email",
                    "${snapshot.data!.id}", "Email"),
                settingFormField("${snapshot.data!.phoneNumber}",
                    "Phone Number", "${snapshot.data!.id}", "Phone"),
                settingFormField(
                    "${snapshot.data!.isAvailable}",
                    "Are you a driver",
                    "${snapshot.data!.isAvailable}",
                    "Driver"),
                settingFormField("${snapshot.data!.carModel}", "Car Model",
                    "${snapshot.data!.carModel}", "Car"),
                settingFormField("${snapshot.data!.destination}", "Destination",
                    "${snapshot.data!.destination}", "Destination"),
              ]);
            } else {
              return CircularProgressIndicator();
            }
          }))
    ]));
  }
}

settingFormField(String title, String fieldData, String id, String route) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Padding(
      padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
      child: Text(
        fieldData,
        style: TextStyle(
            color: AppColor.mainColor,
            fontWeight: FontWeight.w800,
            fontFamily: "Poppins",
            fontSize: 14),
      ),
    ),
    Container(
        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
        height: 70,
        width: 350,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                spreadRadius: 1,
                color: Color.fromARGB(255, 207, 207, 207),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontFamily: "Poppins", fontSize: 14),
              ),
              IconButton(
                onPressed: () {
                  if (route == "Name") {
                    Get.toNamed(AppRoute.updateName, arguments: id);
                  } else if (route == "Email") {
                    Get.toNamed(AppRoute.updateEmail, arguments: id);
                  } else if (route == "Phone") {
                    Get.toNamed(AppRoute.updatePhone, arguments: id);
                  } else if (route == "Available") {
                    Get.toNamed(AppRoute.updateAvailable, arguments: id);
                  } else if (route == "Destination") {
                    Get.toNamed(AppRoute.updateDestination, arguments: id);
                  } else if (route == "Car") {
                    Get.toNamed(AppRoute.updateCar, arguments: id);
                  }
                },
                icon: Icon(Icons.edit),
                color: AppColor.mainColor,
              ),
            ],
          ),
        )),
  ]);
}
