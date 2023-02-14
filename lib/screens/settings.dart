// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_this, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:pfa_application_1/constants/colors.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(15, 40, 0, 40),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                      Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios)),
            Padding(
              padding: const EdgeInsets.only(left: 115.0),
              child: Center(
                child: Text(
                  "Profile",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
      Center(
          child: CircleAvatar(
        backgroundImage: AssetImage(
          "IMAGE/me2.jpg",
        ),
        radius: 40,
      )),
      SettingFormField(fieldData: "Fullname", title: "Skander Ben Said"),
      SettingFormField(fieldData: "Email", title: "bensaid303@gmail.com"),
      SettingFormField(fieldData: "Phone Number", title: "99 549 510 "),
    ]));
  }
}

class SettingFormField extends StatelessWidget {
  const SettingFormField(
      {super.key, required this.fieldData, required this.title});
  final String fieldData;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: Text(
          fieldData,
          style: TextStyle(
              color: AppColor.mainColor,
              fontWeight: FontWeight.w800,
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
                  blurRadius: 6,
                  spreadRadius: 1,
                  color: Color.fromARGB(255, 207, 207, 207),
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title),
                IconButton(
                  onPressed: () {
                    //     Navigator.of(context).pushNamed("/");
                  },
                  icon: Icon(Icons.edit),
                  color: AppColor.mainColor,
                ),
              ],
            ),
          )),
    ]);
  }
}
