// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pfa_application_1/global_bloc.dart';
import 'package:pfa_application_1/screens/blog/add_new_blog.dart';
import 'package:pfa_application_1/screens/add_new_medicine.dart';
import 'package:pfa_application_1/screens/blog/blog.dart';

import 'package:pfa_application_1/screens/blog/help_blog.dart';
import 'package:pfa_application_1/screens/blog/missing_drug_blog.dart';
import 'package:pfa_application_1/screens/blog/see_all.dart';
import 'package:pfa_application_1/screens/blog_details.dart';
import 'package:pfa_application_1/screens/medicine_details.dart';
import 'package:pfa_application_1/screens/home.dart';
import 'package:pfa_application_1/screens/reminder.dart';
import 'package:pfa_application_1/screens/settings.dart';
import 'package:pfa_application_1/screens/signIn.dart';
import 'package:pfa_application_1/screens/signUp.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalBloc? globalBloc;

  @override
  void initState() {
    globalBloc = GlobalBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<GlobalBloc>.value(
        value: globalBloc!,
        child: Sizer(builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SignIn(),
            routes: {
              "home": ((context) => Home()),
              "details": ((context) => Details()),
              "addMedicine": ((context) => AddMedicine()),
              "reminder": ((context) => Reminders()),
              "signIn": ((context) => SignIn()),
              "signUp": ((context) => SignUp()),
              "settings": ((context) => Settings()),
              "blog": ((context) => Blog()),
              "helpBlog": ((context) => HelpBlog()),
              "missingBlog": ((context) => MissingBlog()),
              "blog/details": ((context) => BlogDetails()),
              "blog/addBlog": ((context) => AddBlog()),
              "seeAll": ((context) => SeeAll()),
            },
          );
        }));
  }
}
