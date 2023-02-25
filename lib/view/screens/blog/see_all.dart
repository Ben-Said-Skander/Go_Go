// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, recursive_getters, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/blog_controller.dart';
import 'package:pfa_application_1/core/constants/colors.dart';

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
  @override
  void initState() {
    futureCard = blogController.fetchArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SafeArea(
          child: Container(
              height: 120,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 16, 152, 170),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(80),
                      bottomRight: Radius.circular(80))),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 25),
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
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 55.0, top: 40),
                          child: Text("Drug Experience ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Poppins",
                              )),
                        ),
                      )
                    ],
                  ),
                ],
              )),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 0, 0),
          child: Text(
            "All Articles  ",
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
            padding: EdgeInsets.only(top: 10),
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
                              blogTitle: "${snapshot.data![index].title}",
                              blogPicture: "assets/image/piills.jpg");
                        }));
                  } else {
                    return GridView.builder(
                        itemCount: 4,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: ((context, index) {
                          return BlogCard(
                              blogTitle: "My experience with Doliprane",
                              blogPicture: "assets/image/piills.jpg");
                        }));
                    /*
                    return Center(
                        child: Text("No Articles found",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Poppins")));*/
                  }
                }))),
      ]),
    );
  }
}
