// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:pfa_application_1/core/constants/colors.dart';

class AddBlog extends StatefulWidget {
  const AddBlog({super.key});

  @override
  State<AddBlog> createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  late TextEditingController titleController;
  late TextEditingController bodyController;
  String dropdownvalue = "Drug Experience";
  var categories = [
    "Drug Experience",
    "In need of a missing drug",
    "Questions about a drug",
  ];

  @override
  void initState() {
    titleController = TextEditingController();
    bodyController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 10.0, 0, 40),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios)),
              Padding(
                padding: const EdgeInsets.only(left: 95.0),
                child: Center(
                  child: Text(
                    "Add New Article",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 15),
                child: Column(
                  children: [
                    Container(
                      color: Color.fromARGB(255, 215, 215, 215),
                      width: 150,
                      height: 150,
                      child: Icon(
                        Icons.add_a_photo,
                        color: AppColor.mainColor,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      decoration: BoxDecoration(
                          color: AppColor.mainColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: TextButton(
                          onPressed: () {
                            //image picker
                          },
                          child: Text(
                            "Add a photo",
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                  ],
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 20, 50, 0),
                  child: Text(
                    "Category",
                    style: TextStyle(
                        color: AppColor.mainColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(18, 15, 0, 0),
                    child: DropdownButton(
                        iconEnabledColor: AppColor.mainColor,
                        dropdownColor: Color.fromARGB(255, 255, 255, 255),
                        hint: Text("Select a Category"),
                        elevation: 4,
                        value: dropdownvalue, // initial value
                        items: categories.map((String items) {
                          return DropdownMenuItem(
                              value: items, child: Text(items));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        })),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 20, 50, 0),
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
            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
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
              padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
              child: TextFormField(
                minLines: null,
                maxLines: 20,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: "Write something here...",
                ),
              ),
            )),
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
