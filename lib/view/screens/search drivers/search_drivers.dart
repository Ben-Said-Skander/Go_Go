// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, camel_case_types, avoid_unnecessary_containers

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/post_controller.dart';
import 'package:pfa_application_1/controllers/user_controller.dart';

import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/models/user.dart';

import 'package:proste_bezier_curve/proste_bezier_curve.dart';


class SearchDriversPage extends StatefulWidget {
  const SearchDriversPage({super.key});

  @override
  State<SearchDriversPage> createState() => _SearchDriversState();
}

class _SearchDriversState extends State<SearchDriversPage> {
  UserController userController = Get.find();
  PostController postController = Get.find();
  late TextEditingController searchController;

  @override
  void dispose() {
    searchController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(children: [
      Container(
          height: 150,
          width: double.infinity,
          child: ClipPath(
            clipper: ProsteBezierCurve(
              position: ClipPosition.bottom,
              list: [
                BezierCurveSection(
                  start: Offset(0, 125),
                  top: Offset(screenWidth / 4, 150),
                  end: Offset(screenWidth / 2, 125),
                ),
                BezierCurveSection(
                  start: Offset(screenWidth / 2, 125),
                  top: Offset(screenWidth / 4 * 3, 100),
                  end: Offset(screenWidth, 150),
                ),
              ],
            ),
            child: Container(
              color: AppColor.mainColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Padding(
                    padding:
                        const EdgeInsets.only(top: 0.0, left: 0, bottom: 30),
                    child: Row(
                      children: [
                        Text("Search for a an active driver",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Poppins")),
                      ],
                    )),
              ),
            ),
          )),
      Container(
        padding: EdgeInsets.only(top: 60, left: 20, right: 20),
        width: 400,
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: "Search for a driver",
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
      FutureBuilder<List<User>>(
        future: userController.getAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Filter users based on isAvailable field
            final availableUsers = snapshot.data!
                .where((user) => user.isAvailable == "true")
                .toList();

            return SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.4, // Adjust height as needed
              child: ListView.builder(
                itemCount: availableUsers.length,
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
                                  color: Color.fromARGB(255, 169, 169, 169),
                                )
                              ],
                            ),
                            width: 600,
                            height: 150,
                            margin: const EdgeInsets.only(
                                top: 20, left: 10, right: 20),
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 20, right: 40, left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildRichText('Driver:',
                                      "${availableUsers[index].fullname}"),
                                  buildRichText('Car model:',
                                      "${availableUsers[index].carModel}"),
                                  buildRichText('Destination:',
                                      "${availableUsers[index].destination}"),
                                  SizedBox(height: 20),
                                  Center(
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColor.mainColor,
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          postController.createPost(
                                            "${availableUsers[index].fullname}",
                                            "${availableUsers[index].carModel}",
                                            "${availableUsers[index].destination}",
                                          );
                                          AwesomeDialog(
                                            context: context,
                                            animType: AnimType.leftSlide,
                                            headerAnimationLoop: false,
                                            dialogType: DialogType.success,
                                            showCloseIcon: true,
                                            title: 'Succes',
                                            desc:
                                                'A carpool request is sucessfully added',
                                            btnOkOnPress: () {
                                              print("Sucessfull request");
                                            },
                                            btnOkIcon: Icons.check_circle,
                                            onDismissCallback: (type) {
                                              debugPrint(
                                                  'Dialog Dissmiss from callback $type');
                                            },
                                          ).show();
                                        },
                                        icon: Icon(
                                          FontAwesomeIcons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return Text("This doesn't work", style: TextStyle(fontSize: 15));
        },
      ),
      SizedBox(
        height: 60,
      )
    ]));
  }

  RichText buildRichText(String label, String value) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontFamily: "Poppins",
          color: Colors.black,
          fontSize: 14,
        ),
        children: [
          TextSpan(
            text: label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: ' $value'),
        ],
      ),
    );
  }
}
