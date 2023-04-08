// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, recursive_getters, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/blog_controller.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/core/constants/routes.dart';

import 'package:pfa_application_1/models/blog.dart';
import 'package:pfa_application_1/view/widgets/component/blog_card.dart';

class SeeAll extends StatefulWidget {
  const SeeAll({super.key});

  @override
  State<SeeAll> createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  BlogController blogController = Get.find();
  late Future<List<Blog>> futureCard;
  late List<Blog> articleList = [];
  String medTypeImage = "pills.jpg";
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshData();
  }

  Future<void> refreshData() async {
    setState(() {
      isLoading = true;
    });
    try {
      final List<Blog> articles = await blogController.fetchArticles();
      setState(() {
        articleList = articles;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching data: $e');
    }
  }

  int count = 0;
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
        body: RefreshIndicator(
          onRefresh: refreshData,
          child: ListView(children: [
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
                    SizedBox(
                      width: 40,
                    ),
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                    SizedBox(
                      width: 80,
                    ),
                    Text(
                      "See All",
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    "All Articles ",
                    style: TextStyle(
                      color: AppColor.mainColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 200),
                  child: IconButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.searchArticles);
                    },
                    icon: Icon(
                      FontAwesomeIcons.magnifyingGlass,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            Container(
                height: 560,
                padding: EdgeInsets.only(top: 10),
                child: FutureBuilder<List<Blog>>(
                    future: blogController.fetchArticles(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        List<Blog> filteredData = [];
                        for (int i = 0; i < snapshot.data!.length; i++) {
                          if (snapshot.data![i].category == "Drug Experience") {
                            filteredData.add(snapshot.data![i]);
                          }
                        }
                        if (filteredData.length > 0) {
                          return GridView.builder(
                              itemCount: filteredData.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemBuilder: ((context, index) {
                                return GestureDetector(
                                    onTap: () {
                                      var articleId =
                                          "${snapshot.data![index].id}";
                                      var imageId =
                                          "${snapshot.data![index].imageId}";
                                      Get.toNamed(AppRoute.blogdetails,
                                          arguments: {
                                            'articleId': '${articleId}',
                                            'imageId': '${imageId}'
                                          });
                                    },
                                    child: BlogCard(
                                      blogTitle: "${filteredData[index].title}",
                                      blogPicture: "assets/image/hand2.jpg",
                                    ));
                              }));
                        } else {
                          return Center(
                              child: Text("No data to show",
                                  style: TextStyle(
                                      color: AppColor.mainColor,
                                      fontSize: 18,
                                      fontFamily: "Poppins")));
                        }
                      } else if (snapshot.hasError) {
                        return Text("Error loading data");
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    })))
          ]),
        ));
  }
}
