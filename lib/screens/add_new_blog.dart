// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:pfa_application_1/constants/colors.dart';

class AddBlog extends StatefulWidget {
  const AddBlog({super.key});

  @override
  State<AddBlog> createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  late TextEditingController titleController;

  @override
  void initState() {
    titleController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 18.0, 0, 40),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios)),
              Padding(
                padding: const EdgeInsets.only(left: 100.0),
                child: Center(
                  child: Text(
                    "Add New Blog",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                //image picker
              },
              child: Container(
                color: Color.fromARGB(255, 215, 215, 215),
                width: 150,
                height: 150,
                child: Icon(
                  Icons.add_a_photo,
                  color: AppColor.mainColor,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 50, 0),
                  child: Text(
                    "Title",
                    style: TextStyle(
                        color: AppColor.mainColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
                  width: 200,
                  height: 120,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: "Title", prefixIcon: Icon(Icons.mail)),
                    controller: titleController,
                    cursorColor: Color.fromARGB(255, 16, 152, 170),
                  ),
                ),
              ],
            )
          ],
        ),
        Container(
          margin: EdgeInsets.fromLTRB(20, 60, 20, 0),
          height: 500,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  blurRadius: 6,
                  spreadRadius: 1,
                  color: Color.fromARGB(255, 207, 207, 207),
                  // offset: Offset(2, 1),
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 0, 0),
            child: Text("Write down here"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 60, 20, 60),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColor.mainColor),
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Center(
                    child: Text(
                  "Add",
                  style: TextStyle(color: Colors.white),
                ))),
          ),
        ),
      ],
    ));
  }
}
