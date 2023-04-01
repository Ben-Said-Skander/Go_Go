// ignore_for_file: prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/blog_controller.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/core/constants/routes.dart';
import 'package:pfa_application_1/models/blog.dart';

class PersonalArticleDetails extends StatefulWidget {
  const PersonalArticleDetails({super.key});

  @override
  State<PersonalArticleDetails> createState() => _PersonalArticleDetailsState();
}

class _PersonalArticleDetailsState extends State<PersonalArticleDetails> {
  BlogController blogController = Get.find();
  late Future<Blog> futureArticle;
  final id = Get.arguments as String;
  @override
  void initState() {
    futureArticle = blogController.getArticle(id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        FutureBuilder<Blog>(
            future: futureArticle,
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return Stack(
                  children: [
                    Image.asset(
                      "assets/image/doliprane.jpg",
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 12, top: 5),
                        child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                            ))),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 190, 0, 0),
                      child: Container(
                        height: 622,
                        width: double.infinity,
                        //   height: 800,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 240, 240, 240),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 12,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(22, 10, 0, 10),
                                child: Text("${snapshot.data!.title}",
                                    style: TextStyle(
                                        color: AppColor.mainColor,
                                        fontFamily: "Poppins",
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 40),
                                child: Text("${snapshot.data!.body}",
                                    style: TextStyle(
                                      fontSize: 16,
                                    )),
                              ),
                              SizedBox(
                                height: 300,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 90, 20, 0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: AppColor.mainColor),
                                  child: TextButton(
                                      onPressed: () {
                                        AwesomeDialog(
                                          context: context,
                                          dialogType: DialogType.warning,
                                          headerAnimationLoop: false,
                                          animType: AnimType.topSlide,
                                          showCloseIcon: true,
                                          closeIcon: const Icon(
                                              Icons.close_fullscreen_outlined),
                                          title: 'Warning',
                                          desc:
                                              'Are you sure you want to delete the article',
                                          btnCancelOnPress: () {
                                            Get.back();
                                          },
                                          onDismissCallback: (type) {
                                            debugPrint(
                                                'Dialog Dismiss from callback $type');
                                          },
                                          btnOkOnPress: () {
                                            blogController.deleteArticle(id);
                                            Get.back(result: true);
                                          },
                                        ).show();

                                   
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
                            ]),
                      ),
                    ),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }))
      ]),
    );
  }
}

Future<bool> alertDeleteArticle() {
  Get.defaultDialog(
      radius: 30,
      title: " Warning ",
      titleStyle: const TextStyle(
          color: AppColor.mainColor,
          fontWeight: FontWeight.bold,
          fontFamily: "Poppins"),
      middleText: "Are you sure you want to delete the article ",
      middleTextStyle: const TextStyle(fontFamily: "Poppins"),
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColor.mainColor)),
            onPressed: () {
              // blogController.deleteArticle("id");
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
              Get.toNamed(AppRoute.home);
            },
            child: const Text("No", style: TextStyle(fontFamily: "Poppins"))),
      ]);
  return Future.value(true);
}
