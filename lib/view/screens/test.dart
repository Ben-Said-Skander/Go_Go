// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, camel_case_types, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/blog_controller.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;
//import 'package:pfa_application_1/controllers/blog_controller.dart';

import 'package:pfa_application_1/models/blog.dart';
import 'package:pfa_application_1/view/widgets/component/blog_card.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  List<Blog> articles = [];
  List<Blog> filteredArticles = [];
  late TextEditingController searchController;
  BlogController blogController = Get.find();
  /* late final Future<List<Pharmacy>> futureLocations =
      pharmacyController.getAllPharmacies();*/
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    fetchArticles().then((articleFromServer) {
      setState(() {
        articles = articleFromServer;
        filteredArticles = articles;
      });
    });
    searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      SafeArea(
        child: Stack(
          children: [
            Container(
                height: 200,
                width: 450,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30)),
                    color: Color.fromARGB(255, 16, 152, 170)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 32, left: 25),
                      child: Text("Locate your medicines",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins")),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 40, left: 20),
                      width: 400,
                      child: TextFormField(
                        onChanged: (titleEntered) {
                          filteredArticles = articles
                              .where((article) => article.title!
                                  .toLowerCase()
                                  .contains(titleEntered.toLowerCase()))
                              .toList();
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Locate your medicines",
                          hintStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass,
                              color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        controller: searchController,
                        cursorColor: Color.fromARGB(255, 16, 152, 170),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
      GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: filteredArticles.length,
          itemBuilder: ((context, index) {
            return BlogCard(
                blogTitle: filteredArticles[index].title!,
                blogPicture: 'blogPicture');
          }))
    ]));
  }
}

Future<List<Blog>> fetchArticles() async {
  List<Blog> totalArticles = [];
  final response =
      await http.get(Uri.parse('http://192.168.101.161:3600/blog'));

  if (response.statusCode == 200) {
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    totalArticles = parsed.map<Blog>((e) => Blog.fromJson(e)).toList();
    ;
    print(totalArticles);
    return totalArticles;
  } else {
    throw Exception('Failed to load Articles');
  }
}
