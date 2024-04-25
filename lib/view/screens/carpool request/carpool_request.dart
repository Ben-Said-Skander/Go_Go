// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, recursive_getters, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/post_controller.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/core/constants/routes.dart';
import 'package:pfa_application_1/models/post.dart';

import 'package:pfa_application_1/models/user.dart';
import 'package:pfa_application_1/view/widgets/component/passengersCard.dart';

import 'package:pfa_application_1/view/widgets/curve_clipper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controllers/user_controller.dart';

class CarpoolRequest extends StatefulWidget {
  const CarpoolRequest({Key? key}) : super(key: key);

  @override
  State<CarpoolRequest> createState() => _CarpoolRequestState();
}

class _CarpoolRequestState extends State<CarpoolRequest> {
  bool isLoading = false;
  bool isDifferentUser = true;

  PostController postController = Get.find();

  late String? userId;

  @override
  void initState() {
    super.initState();
    getUserId().then((value) {
      setState(() {
        userId = value;
      });
    });
  }

  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = await prefs.getString('userID');
    print("****************************************");
    print(userId);
    print("****************************************");
    return userId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 170,
            child: ClipPath(
              clipper: CurveClipper(),
              child: Container(
                color: AppColor.mainColor,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "My car",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 35, 0, 30),
            child: Text(
              " My passengers",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontFamily: "Poppins",
              ),
            ),
          ),
          FutureBuilder<List<Post>>(
            future: postController.fetchPosts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 40),
                        child: Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 40),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 198, 198, 198),
                                    borderRadius: BorderRadius.circular(18),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                        color:
                                            Color.fromARGB(255, 169, 169, 169),
                                      )
                                    ],
                                  ),
                                  width: 600,
                                  height: 120,
                                  margin: const EdgeInsets.only(
                                      top: 20, left: 10, right: 20),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20,
                                        left: 20), // Adjusted left padding here
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Passenger Name:",
                                              style: TextStyle(
                                                fontFamily: "Poppins",
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              width:
                                                  20, // Adjusted width to add more space between "Passenger Name" and the name itself
                                            ),
                                            Text(
                                              "passengerName",
                                              style: TextStyle(
                                                fontFamily: "Poppins",
                                                color: Colors.black,
                                                fontSize: 14,
                                                // Set font weight to bold for passenger name
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            SizedBox(
                                                width:
                                                    90), // Adjusted width to align buttons
                                            IconButton(
                                              onPressed: () {
                                                postController.deletePost("id");
                                              },
                                              icon: Icon(
                                                FontAwesomeIcons.times,
                                                color: Colors.red,
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                FontAwesomeIcons.check,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )));
                  },
                );
              }

              return Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 40),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 198, 198, 198),
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 1,
                              spreadRadius: 1,
                              color: Color.fromARGB(255, 169, 169, 169),
                            )
                          ],
                        ),
                        width: 600,
                        height: 120,
                        margin:
                            const EdgeInsets.only(top: 20, left: 10, right: 20),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20), // Adjusted left padding here
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Passenger Name:",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        20, // Adjusted width to add more space between "Passenger Name" and the name itself
                                  ),
                                  Text(
                                    "passengerName",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: Colors.black,
                                      fontSize: 14,
                                      // Set font weight to bold for passenger name
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  SizedBox(
                                      width:
                                          90), // Adjusted width to align buttons
                                  IconButton(
                                    onPressed: () {
                                      //postController.deletePost("id");
                                    },
                                    icon: Icon(
                                      FontAwesomeIcons.times,
                                      color: Colors.red,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      FontAwesomeIcons.check,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ));
            },
          ),
        ],
      ),
    );
  }
}
