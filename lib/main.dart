// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/core/constants/routes.dart';
import 'package:pfa_application_1/routes.dart';

import 'view/screens/add_new_medicine.dart';
import 'view/screens/blog/add_new_blog.dart';
import 'view/screens/blog/blog.dart';
import 'view/screens/blog/help_blog.dart';
import 'view/screens/blog/missing_drug_blog.dart';
import 'view/screens/blog/see_all.dart';
import 'view/screens/blog_details.dart';
import 'view/screens/home.dart';
import 'view/screens/medicine_details.dart';
import 'view/screens/reminder.dart';
import 'view/screens/settings.dart';
import 'view/screens/signIn.dart';
import 'view/screens/signUp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: routes,
      initialRoute: AppRoute.signIn,
      /* routes: {
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
      },*/
    );
  }
}


//Get.offandtonamed = pop and push named
//get.toNamed
//Get.toNamed(AppRoute.myfavroite);
//getPages: routes,
//rest ful api : returns JSON