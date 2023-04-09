// ignore_for_file: prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/blog_controller.dart';
import 'package:pfa_application_1/controllers/user_controller.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/models/blog.dart';
import 'package:pfa_application_1/models/image.dart';
import 'package:pfa_application_1/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BlogDetails extends StatefulWidget {
  const BlogDetails({super.key});

  @override
  State<BlogDetails> createState() => _BlogDetailsState();
}

class _BlogDetailsState extends State<BlogDetails> {
  BlogController blogController = Get.find();
  UserController userController = Get.put(UserController());
  late Future<Blog> futureCard;
  late Future<Picture> futureImage;
  late Future<User> user;
  final articleId = Get.arguments["articleId"] as String;
  final imageId = Get.arguments["imageId"] as String;
  late String? userId;
  String username = "";

  @override
  void initState() {
    futureCard = blogController.getArticle(articleId);
    futureImage = blogController.getImage(imageId);

    getUserId().then((value) {
      setState(() {
        userId = value;
      });
    });
    super.initState();
  }

  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = await prefs.getString('userID');
    print("****************************************");
    print(userId);
    print("****************************************");
    return userId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<Blog>(
            future: futureCard,
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                username = snapshot.data!.userId!;
                print(username);

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
                              return Center(child: CircularProgressIndicator());
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
                              ]),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 18.0, top: 750),
                            child: Text('Posted by : ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.mainColor,
                                  fontSize: 16,
                                )),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.only(left: 18.0, top: 750),
                              child: FutureBuilder<User>(
                                future: userController.getUser(username),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                          ConnectionState.done &&
                                      snapshot.hasData) {
                                    return Text(
                                      snapshot.data!.fullname!,
                                      style: TextStyle(
                                          fontSize: 16, fontFamily: "Poppins"),
                                    );
                                  } else {
                                    return CircularProgressIndicator();
                                  }
                                },
                              ))
                        ],
                      )
                    ],
                  ),
                ]);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            })));
  }
}
