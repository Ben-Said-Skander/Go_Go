// ignore_for_file: prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/blog_controller.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/core/constants/routes.dart';
import 'package:pfa_application_1/models/blog.dart';
import 'package:pfa_application_1/models/image.dart';

class PersonalArticleDetails extends StatefulWidget {
  const PersonalArticleDetails({super.key});

  @override
  State<PersonalArticleDetails> createState() => _PersonalArticleDetailsState();
}

class _PersonalArticleDetailsState extends State<PersonalArticleDetails> {
  BlogController blogController = Get.find();
  late Future<Blog> futureCard;
  late Future<Picture> futureImage;
  final articleId = Get.arguments["articleId"] as String;
  final imageId = Get.arguments["imageId"] as String;

  @override
  void initState() {
    futureCard = blogController.getArticle(articleId);
    futureImage = blogController.getImage(imageId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<Blog>(
            future: futureCard,
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return ListView(children: [
                  Stack(
                    children: [
                      FutureBuilder<Picture>(
                          future: futureImage,
                          builder: ((context, snapshot) {
                            if (snapshot.hasData) {
                              return Image.memory(
                                snapshot.data!.data!,
                                fit: BoxFit.fill, // fill the available space
                                height: 270,
                                width: double.infinity,
                              );
                            } else {
                              return Image.asset(
                                "assets/image/med.jpg",
                                height: 220,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              );
                            }
                          })),
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
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 120, right: 20, top: 400),
                                    child: Container(
                                      width: 170,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: AppColor.mainColor),
                                      child: MaterialButton(
                                        onPressed: () {
                                          AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.warning,
                                            headerAnimationLoop: false,
                                            animType: AnimType.topSlide,
                                            showCloseIcon: true,
                                            closeIcon: const Icon(Icons
                                                .close_fullscreen_outlined),
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
                                              blogController
                                                  .deleteArticle(articleId);
                                              Get.back(result: true);
                                            },
                                          ).show();
                                        },
                                        child: Text("Delete",
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    ))
                              ]),
                        ),
                      ),
                    ],
                  )
                ]);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            })));
  }
}
