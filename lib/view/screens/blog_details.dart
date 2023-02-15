// ignore_for_file: prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/core/constants/colors.dart';

class BlogDetails extends StatefulWidget {
  const BlogDetails({super.key});

  @override
  State<BlogDetails> createState() => _BlogDetailsState();
}

class _BlogDetailsState extends State<BlogDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   backgroundColor: Colors.white,
      body: ListView(children: [
        /*
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios)),*/

        ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            child: Stack(
              children: [
                Image.asset(
                  "assets/image/doliprane.jpg",
                  //     height: 400,
                ),
                Positioned(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: IconButton(
                            onPressed: () {
                                   Get.back() ;
                            
                            },
                            icon: Icon(Icons.arrow_back_ios))))
              ],
            )),
        Container(
          height: 800,
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 10, 0, 10),
              child: Text("Blog Title",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("Blog body is here",
                  style: TextStyle(
                    fontSize: 16,
                  )),
            )
          ]),
        ),
      ]),
    );
  }
}
