// ignore_for_file: unused_import

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/core/constants/routes.dart';

Future<bool> alertDeleteMedicine() {
  Get.defaultDialog(
      contentPadding: EdgeInsets.only(top: 20, bottom: 20),
      radius: 30,
      title: " Warning ",
      titleStyle: const TextStyle(
          color: AppColor.mainColor,
          fontWeight: FontWeight.bold,
          fontFamily: "Poppins"),
      middleText: "Are you sure you want to delete the reminder ",
      middleTextStyle: const TextStyle(fontFamily: "Poppins"),
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColor.mainColor)),
            onPressed: () {
              Get.offAndToNamed(AppRoute.home);
            },
            child: const Text(
              "Yes",
              style: TextStyle(fontFamily: "Poppins"),
            )),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColor.mainColor)),
            onPressed: () {
              Get.back();
            },
            child: const Text("No", style: TextStyle(fontFamily: "Poppins"))),
      ]);
  return Future.value(true);
}
