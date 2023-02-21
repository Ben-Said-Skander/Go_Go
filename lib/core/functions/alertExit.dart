// ignore_for_file: unused_import

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/core/constants/routes.dart';

Future<bool> alertExit() {
  Get.defaultDialog(
      title: " Warning ",
      titleStyle: const TextStyle(
          color: AppColor.mainColor, fontWeight: FontWeight.bold),
      middleText: "Are you sure you want to delete the reminder ",
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColor.mainColor)),
            onPressed: () {
              exit(0);
            },
            child: const Text("Yes")),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColor.mainColor)),
            onPressed: () {
              Get.offAndToNamed(AppRoute.home);
            },
            child: const Text("No"))
      ]);
  return Future.value(true);
}
