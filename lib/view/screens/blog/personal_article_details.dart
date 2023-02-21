// ignore_for_file: prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/blog_controller.dart';
import 'package:pfa_application_1/core/constants/colors.dart';

class PersonalArticleDetails extends StatefulWidget {
  const PersonalArticleDetails({super.key});

  @override
  State<PersonalArticleDetails> createState() => _PersonalArticleDetailsState();
}

class _PersonalArticleDetailsState extends State<PersonalArticleDetails> {
  BlogController blogController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   backgroundColor: Colors.white,
      body: ListView(children: [
        /*
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios)),*/

        Stack(
          children: [
            Image.asset(
              "assets/image/doliprane.jpg",
              //     height: 400,
            ),
            /*  Positioned(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(Icons.arrow_back_ios)))),*/

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
                        padding: const EdgeInsets.fromLTRB(22, 10, 0, 10),
                        child: Text("Blog Title",
                            style: TextStyle(
                                color: AppColor.mainColor,
                                fontFamily: "Poppins",
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 40),
                        child: Text("Blog body is here",
                            style: TextStyle(
                              fontSize: 16,
                            )),
                      ),
                      SizedBox(
                        height: 300,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 90, 20, 0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: AppColor.mainColor),
                          child: TextButton(
                              onPressed: () {
                                blogController.deleteArticle("id");
                                Get.back();
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
        )
      ]),
    );
  }
}
