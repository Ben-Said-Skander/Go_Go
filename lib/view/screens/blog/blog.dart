// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/blog_controller.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/core/constants/routes.dart';
import 'package:pfa_application_1/models/blog.dart';
import 'package:pfa_application_1/view/widgets/component/blog_card.dart';
import 'package:pfa_application_1/view/widgets/component/popular_card.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
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
          heroTag: 'btn2',
          onPressed: () {
            Get.toNamed(AppRoute.addBlog);
          },
          backgroundColor: AppColor.mainColor,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: Obx((() => FutureBuilder<List<Blog>>(
            future: blogController.fetchArticles(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return ListView(children: [
                  SafeArea(
                    child: Container(
                      height: 120,
                      width: 500,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(80)),
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
                                color: Colors.white,
                                fontSize: 19,
                                fontFamily: "Poppins"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        textButton(context, "Drug Experience", "blog",
                            AppColor.mainColor),
                        textButton(context, "Missing Drug", "missingBlog",
                            Colors.grey),
                        textButton(
                            context, "Seeking Help", "helpBlog", Colors.grey),
                        textButton(context, "Your Articles", "userArticle",
                            Colors.grey),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 28, 0, 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Drug Experience",
                            style: TextStyle(
                                color: AppColor.mainColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Poppins",
                                fontSize: 18),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.toNamed(AppRoute.seeAll);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Text(
                                  "See all",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600),
                                ),
                              ))
                        ]),
                  ),
                  Container(
                      height: 220,
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                              onTap: () {
                                var id = "${snapshot.data![index].id}";
                                Get.toNamed(AppRoute.blogdetails,
                                    arguments: id);
                              },
                              child: BlogCard(
                                  blogTitle: "${snapshot.data![index].title}",
                                  blogPicture: "assets/image/piills.jpg"));
                        }),
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 28, 0, 15),
                    child: Text(
                      "Popular",
                      style: TextStyle(
                          color: AppColor.mainColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                          fontSize: 18),
                    ),
                  ),
                  Container(
                    height: 200,
                    child: ListView.builder(
                        itemCount: 3,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                              onTap: () {
                                var id = "${snapshot.data![index].id}";
                                Get.toNamed(AppRoute.blogdetails,
                                    arguments: id);
                              },
                              child: PopularCard(
                                  blogTitle: "${snapshot.data![index].title}",
                                  blogPicture: "assets/image/piills.jpg",
                                  route: "/blog/details"));
                        })),
                  )
                ]);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            })))));
  }
}

textButton(BuildContext context, String title, String route, Color couleur) {
  return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(route);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(title,
              style: TextStyle(
                  fontSize: 14,
                  color: couleur,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins")),
        ),
      ));
}
