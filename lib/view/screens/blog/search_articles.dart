// ignore_for_file: unused_element, unused_local_variable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/blog_controller.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/core/constants/routes.dart';
import 'package:pfa_application_1/models/blog.dart';
import 'package:pfa_application_1/view/widgets/component/blog_card.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';

class SearchArticles extends StatefulWidget {
  const SearchArticles({Key? key}) : super(key: key);

  @override
  _SearchArticlesState createState() => _SearchArticlesState();
}

class _SearchArticlesState extends State<SearchArticles> {
  BlogController blogController = Get.find();
  Future<List<Blog>>? articles;
  List<Blog> filteredArticles = [];

  int empty = 0;

  late TextEditingController searchController;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    articles = blogController.fetchArticles();
    searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: ListView(children: [
      Container(
          height: 250,
          width: double.infinity,
          child: ClipPath(
            clipper: ProsteBezierCurve(
              position: ClipPosition.bottom,
              list: [
                BezierCurveSection(
                  start: Offset(0, 150),
                  top: Offset(screenWidth / 2, 200),
                  end: Offset(screenWidth, 150),
                ),
              ],
            ),
            child: Container(
              color: AppColor.mainColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Padding(
                    padding: const EdgeInsets.only(top: 0.0, bottom: 80),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 45.0),
                          child: Text("Search for article",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontFamily: "Poppins")),
                        ),
                      ],
                    )),
              ),
            ),
          )),
      Container(
        padding: EdgeInsets.only(top: 0, left: 20),
        width: 400,
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: "Search for an article",
            hintStyle: TextStyle(color: Colors.black),
            prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass,
                color: AppColor.mainColor),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.mainColor),
                borderRadius: BorderRadius.circular(30)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.mainColor),
                borderRadius: BorderRadius.circular(30)),
          ),
          controller: searchController,
          cursorColor: Color.fromARGB(255, 16, 152, 170),
        ),
      ),
      SizedBox(
        height: 15,
      ),
      Container(
          child: FutureBuilder<List<Blog>>(
        future: blogController.fetchArticles(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
                padding: EdgeInsets.only(left: 100, right: 100, top: 20),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.mainColor),
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        filteredArticles = snapshot.data!
                            .where((article) =>
                                article.title == searchController.text)
                            .toList();
                      });
                    },
                    child:
                        Text("Search", style: TextStyle(color: Colors.white)),
                  ),
                ));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      )),
      SizedBox(
        height: 40,
      ),
      if (filteredArticles.isNotEmpty)
        Container(
            child: GridView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: filteredArticles.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () {
                var articleId = "${filteredArticles[index].id}";
                var imageId = "${filteredArticles[index].imageId}";
                Get.toNamed(AppRoute.blogdetails, arguments: {
                  'articleId': '${articleId}',
                  'imageId': '${imageId}'
                });
              },
              child: BlogCard(
                blogTitle: "${filteredArticles[index].title}",
                blogPicture: "assets/image/hand2.jpg",
              ),
            );
          }),
        ))
    ]));
  }
}
