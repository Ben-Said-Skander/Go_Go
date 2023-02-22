// ignore_for_file: prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/blog_controller.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/models/blog.dart';

class BlogDetails extends StatefulWidget {
  const BlogDetails({super.key});

  @override
  State<BlogDetails> createState() => _BlogDetailsState();
}

class _BlogDetailsState extends State<BlogDetails> {
  BlogController blogController = Get.find();
  late Future<Blog> futureCard;
  @override
  void initState() {
    futureCard = blogController.getArticle("id");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Stack(
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
                    ]),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
/*     GET Articles
Scaffold(
        body: FutureBuilder(
            future: futureCard,
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return ListView(children: [
                  Stack(
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
                                  child: Text("Blog Title",
                                      style: TextStyle(
                                          color: AppColor.mainColor,
                                          fontFamily: "Poppins",
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 40),
                                  child: Text("Blog body is here",
                                      style: TextStyle(
                                        fontSize: 16,
                                      )),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  )
                ]);
              } else {
                return Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Center(
                      child: Text("No Reminders found",
                          style: TextStyle(
                              fontSize: 20,
                              color: AppColor.mainColor,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins"))),
                );
              }
            })));
  }
}
*/