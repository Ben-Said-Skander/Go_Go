// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pfa_application_1/screens/add_medicine.dart';
import 'package:pfa_application_1/screens/details.dart';
import 'package:pfa_application_1/screens/reminder.dart';
import 'package:pfa_application_1/screens/settings.dart';
import 'package:pfa_application_1/screens/signIn.dart';
import 'package:pfa_application_1/screens/signUp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddMedicine(),
      routes: {
        // "/": ((context) => Home()),
        "details": ((context) => Details()),
        "addMedicine": ((context) => AddMedicine()),
        "reminder": ((context) => Reminders()),
        "signIn": ((context) => SignIn()),
        "signUp": ((context) => SignUp()),
        "settings": ((context) => Settings()),
      },
    );
  }
}
