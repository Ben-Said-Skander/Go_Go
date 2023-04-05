// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/blog_controller.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/core/constants/routes.dart';
import 'package:pfa_application_1/models/blog.dart';
import 'package:pfa_application_1/models/image.dart';


class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  BlogController blogController = Get.find();

  late Future<List<Blog>> futureCard;
  late Future<List<Picture>> futurePicture;

  List imagesID = [];
  List articlesID = [];
  List<Map<String, String>> combinedList = [];

  @override
  void initState() {
    futureCard = blogController.fetchArticles();
    futurePicture = blogController.getAllImages();

    super.initState();
  }

  List<String> blogID = []; // create an empty list to hold the ids

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
        body: FutureBuilder<List<dynamic>>(
            future: Future.wait([futureCard, futurePicture]),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                List<Blog> articles = snapshot.data![0];
                List<Picture> images = snapshot.data![1];
                for (int i = 0; i < articles.length; i++) {
                  articlesID.add(articles[i].id);
                }
                ;
                for (int i = 0; i < images.length; i++) {
                  imagesID.add(imagesID[i].id);
                }
                for (int i = 0; i < articlesID.length; i++) {
                  Map<String, String> item = {
                    "id": articlesID[i],
                    "value": imagesID[i]
                  };
                  combinedList.add(item);
                }

                return Text("combinedList");
              } else {
                return Center(child: CircularProgressIndicator());
              }
            })));
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
