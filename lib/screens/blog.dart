// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:pfa_application_1/constants/colors.dart';

class Blog extends StatefulWidget {
  const Blog({super.key});

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColor.mainColor,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(65, 50, 0, 40),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 115.0),
                  child: Center(
                    child: Text(
                      "Blog",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 28, 0, 15),
            child: Text(
              "Drug Experience",
              style: TextStyle(
                  color: AppColor.mainColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Container(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                BlogCard(
                    blogTitle: "My experience with Doliprane",
                    blogPicture: "IMAGE/piills.jpg"),
                BlogCard(
                    blogTitle: "My experience with Doliprane",
                    blogPicture: "IMAGE/piills.jpg"),
                BlogCard(
                    blogTitle: "My experience with Doliprane",
                    blogPicture: "IMAGE/piills.jpg"),
                BlogCard(
                    blogTitle: "My experience with Doliprane",
                    blogPicture: "IMAGE/piills.jpg"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 40, 0, 15),
            child: Text(
              "In need of a missing Drug",
              style: TextStyle(
                  color: AppColor.mainColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Container(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                BlogCard(
                    blogTitle: "In need of a missing Drug",
                    blogPicture: "IMAGE/sirop.jpg"),
                BlogCard(
                    blogTitle: "In need of a missing Drug",
                    blogPicture: "IMAGE/sirop.jpg"),
                BlogCard(
                    blogTitle: "In need of a missing Drug",
                    blogPicture: "IMAGE/sirop.jpg"),
                BlogCard(
                    blogTitle: "In need of a missing Drug",
                    blogPicture: "IMAGE/sirop.jpg"),
                BlogCard(
                    blogTitle: "In need of a missing Drug",
                    blogPicture: "IMAGE/sirop.jpg"),
              ],
            ),
          ),
        ]));
  }
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
          Navigator.of(context).pushNamed("blog/details");
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
                child: Hero(
                  tag: "tag1",
                  child: Image.asset(
                    blogPicture,
                    width: 150,
                    height: 100,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13),
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
