// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/blog_controller.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/core/constants/routes.dart';
import 'package:pfa_application_1/models/blog.dart';
import 'package:pfa_application_1/view/widgets/component/blog_card.dart';

class MissingBlog extends StatefulWidget {
  const MissingBlog({super.key});

  @override
  State<MissingBlog> createState() => _MissingBlogState();
}

class _MissingBlogState extends State<MissingBlog> {
  BlogController blogController = Get.find();
  late Future<List<Blog>> futureCard;
  @override
  void initState() {
    futureCard = blogController.fetchArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: 'btn3',
        onPressed: () {
          Get.toNamed(AppRoute.addBlog);
        },
        backgroundColor: AppColor.mainColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView(children: [
        SafeArea(
          child: Container(
            height: 120,
            width: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
              color: Color.fromARGB(255, 16, 152, 170),
            ),
            child: Row(
              children: [
                Center(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoute.settings);
                        },
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            "assets/image/me2.jpg",
                          ),
                          radius: 28,
                        ),
                      )),
                ),
                SizedBox(
                  width: 22,
                ),
                Text(
                  "Ben Said Skander",
                  style: TextStyle(
                      color: Colors.white, fontSize: 19, fontFamily: "Poppins"),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                "Missing Drug ",
                style: TextStyle(
                  color: AppColor.mainColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  fontFamily: "Poppins",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 180),
              child: IconButton(
                onPressed: () {
                  // Get.back();
                },
                icon: Icon(
                  Icons.search_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        Container(
            height: 560,
            padding: EdgeInsets.only(top: 35),
            child: FutureBuilder<List<Blog>>(
                future: futureCard,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                        itemCount: snapshot.data!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: ((context, index) {
                          return BlogCard(
                              blogTitle: "My experience with Doliprane",
                              blogPicture: "assets/image/piills.jpg");
                        }));
                  } else {
                    return Center(
                        child: Text("No Articles found",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Poppins")));
                  }
                }))),
      ]),
    );
  }
}
/*
Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.addBlog);
        },
        backgroundColor: AppColor.mainColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView(children: [
        SafeArea(
          child: Container(
            height: 120,
            width: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
              color: Color.fromARGB(255, 16, 152, 170),
            ),
            child: Row(
              children: [
                Center(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoute.settings);
                        },
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            "assets/image/me2.jpg",
                          ),
                          radius: 28,
                        ),
                      )),
                ),
                SizedBox(
                  width: 22,
                ),
                Text(
                  "Ben Said Skander",
                  style: TextStyle(
                      color: Colors.white, fontSize: 19, fontFamily: "Poppins"),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                "Missing Drug ",
                style: TextStyle(
                  color: AppColor.mainColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  fontFamily: "Poppins",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 180),
              child: IconButton(
                onPressed: () {
                  // Get.back();
                },
                icon: Icon(
                  Icons.search_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        Container(
            height: 560,
            padding: EdgeInsets.only(top: 35),
            child: FutureBuilder<List<Blog>>(
                future: futureCard,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                        itemCount: snapshot.data!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: ((context, index) {
                          return BlogCard(
                    blogTitle: "My experience with Doliprane",
                    blogPicture: "assets/image/piills.jpg"));
                        }));
                  } else {
                    return Center(
                        child: Text("No Articles found",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Poppins")));
                  }
                }))
     
            ),
      ]),
    );
*/