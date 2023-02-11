// ignore_for_file: prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:pfa_application_1/constants/colors.dart';

class BlogDetails extends StatefulWidget {
  const BlogDetails({super.key});

  @override
  State<BlogDetails> createState() => _BlogDetailsState();
}

class _BlogDetailsState extends State<BlogDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 191, 207, 209),
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios)),*/

            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        40,
                      ),
                      bottomRight: Radius.circular(
                        40,
                      )),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      spreadRadius: 1,
                      color: Color.fromARGB(255, 207, 207, 207),
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Image.asset(
                  "IMAGE/piills.jpg",
                  width: 150,
                  height: 150,
                ),
              ),
            )
          ],
        ),
        Container(
          height: 400,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 10, 0, 10),
              child: Text("Blog Title",
                  style: TextStyle(
                      color: Colors.white,
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
        )
      ]),
    );
  }
}
