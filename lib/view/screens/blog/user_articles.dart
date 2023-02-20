// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/core/constants/routes.dart';

class UserArticle extends StatefulWidget {
  const UserArticle({super.key});

  @override
  State<UserArticle> createState() => _UserArticleState();
}

class _UserArticleState extends State<UserArticle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            textButton(context, "Drug Experience", "blog", Colors.grey),
            textButton(context, "Missing Drug", "missingBlog", Colors.grey),
            textButton(context, "Seeking Help", "helpBlog", Colors.grey),
            textButton(
                context, "Your Articles", "userArticle", AppColor.mainColor),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
          child: Text(
            "Your Articles ",
            style: TextStyle(
              color: AppColor.mainColor,
              fontWeight: FontWeight.w700,
              fontSize: 20,
              fontFamily: "Poppins",
            ),
          ),
        ),
        Container(
          height: 560,
          padding: EdgeInsets.only(top: 35),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: 4,
              itemBuilder: ((context, index) {
                return MedCard(
                    med_name: "Doliprane",
                    med_pic: "assets/image/sirop.jpg",
                    med_interval: "Every 8 hours");
              })),
        ),
      ]),
    );
  }
}

class MedCard extends StatelessWidget {
  const MedCard(
      {Key? key,
      required this.med_name,
      required this.med_pic,
      required this.med_interval})
      : super(key: key);
  final String med_name;
  final String med_pic;
  final String med_interval;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.toNamed(AppRoute.details);
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  blurRadius: 6,
                  spreadRadius: 1,
                  color: Color.fromARGB(255, 207, 207, 207),
                )
              ]),
          width: 200,
          height: 600,
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Image.asset(
                med_pic,
                width: 100,
                height: 100,
              )),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Text(
                  med_name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Text(
                  med_interval,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ));
  }
}

textButton(BuildContext context, String title, String route, Color couleur) {
  return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: TextButton(
        onPressed: () {
          Get.toNamed(route);
        },
        child: Text(title, style: TextStyle(fontSize: 12, color: couleur)),
      ));
}

class BlogCard extends StatelessWidget {
  const BlogCard(
      {super.key, required this.blogTitle, required this.blogPicture});
  final String blogTitle;
  final String blogPicture;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.offNamed(AppRoute.blogdetails);
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  blurRadius: 6,
                  spreadRadius: 1,
                  color: Color.fromARGB(255, 207, 207, 207),
                )
              ]),
          width: 200,
          height: 200,
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset(
                    blogPicture,
                    width: 150,
                    height: 100,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Text(
                  blogTitle,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ));
  }
}

class PopularCard extends StatelessWidget {
  const PopularCard(
      {super.key,
      required this.blogTitle,
      required this.blogPicture,
      required this.route});
  final String blogTitle;
  final String blogPicture;
  final String route;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
        onTap: () {
          Get.toNamed(route);
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  blurRadius: 6,
                  spreadRadius: 1,
                  color: Color.fromARGB(255, 207, 207, 207),
                )
              ]),
          width: 600,
          height: 150,
          margin: EdgeInsets.all(16),
          child: Row(
            //  crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Image.asset(
                    blogPicture,
                    width: 150,
                    height: 100,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Text(
                  blogTitle,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      )
    ]);
    /*  GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed("/blog/details");
        },*/
  }
}
