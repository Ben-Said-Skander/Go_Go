// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/auth_controller.dart';
import 'package:pfa_application_1/controllers/user_controller.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/core/constants/routes.dart';
import 'package:pfa_application_1/models/user.dart';
import 'package:pfa_application_1/view/widgets/wave_clipper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  AuthController authController = Get.find();
  UserController userController = Get.find();
  List<User>? userList;
  String userID = "";

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    getAllUsers();
    super.initState();
  }

  Future<void> getAllUsers() async {
    userList = await userController.getAllUsers();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Container(
        width: 450,
        height: 250,
        child: ClipPath(
          clipper: WaveClipper(),
          child: Container(
            color: AppColor.mainColor,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 60, 0, 0),
              child: Text("Welcome back ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      //   fontWeight: FontWeight.w600,
                      fontFamily: "Poppins")),
            ),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        height: 530,
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
        child: Form(
          key: _formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 14,
            ),
            Center(
              child: Text(
                'Sign In',
                style: TextStyle(
                    color: AppColor.mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    fontFamily: "Poppins"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 0, 0),
              child: Text("Email",
                  style: TextStyle(
                    color: AppColor.mainColor,
                    fontFamily: "Poppins",
                  )),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: 350,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                    return 'Enter a valid email!';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "Email", prefixIcon: Icon(Icons.mail)),
                controller: emailController,
                cursorColor: Color.fromARGB(255, 9, 2, 107),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
                child: Text(
                  "Password",
                  style: TextStyle(
                    color: AppColor.mainColor,
                    fontFamily: "Poppins",
                  ),
                )),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: 350,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Something";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: "Password", prefixIcon: Icon(Icons.password)),
                controller: passwordController,
                cursorColor: Color.fromARGB(255, 9, 2, 107),
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(120, 15, 0, 0),
              child: Center(
                child: InkWell(
                  child: Text('Forgot your Password ?',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 9, 2, 107),
                          fontSize: 14)),
                  onTap: () {
                    Get.toNamed(AppRoute.forgotPassword);
                  },
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(120, 60, 20, 0),
                child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromARGB(255, 9, 2, 107),
                    ),
                    child: MaterialButton(
                      child: Text(
                        "Log In",
                        style: TextStyle(
                            color: Colors.white, fontFamily: "Poppins"),
                      ),
                      onPressed: () async {
                        final form = _formKey.currentState;
                        if (form != null && form.validate()) {
                          if (await authController.login(
                              emailController.text, passwordController.text)) {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            if (userList != null) {
                              for (int i = 0; i < userList!.length; i++) {
                                if (userList![i].email ==
                                    emailController.text) {
                                  userID = userList![i].id!;
                                  prefs.setString("userID", userID);
                                }
                              }
                              print("****************************************");
                              print(userID);
                              print("****************************************");
                            }

                            // registration was successful
                            Get.offAndToNamed(AppRoute.home);
                          } else {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              headerAnimationLoop: false,
                              title: 'Error',
                              desc: 'There is no Account for this email',
                              btnOkOnPress: () {},
                              btnOkIcon: Icons.cancel,
                              btnOkColor: Colors.red,
                            ).show();
                          }
                        } else {
                          print("not ok");
                        }
                      },
                    ))),
            Padding(
              padding: EdgeInsets.only(left: 108),
              child: Row(
                children: [
                  Text(
                    "New user ?",
                    style: TextStyle(color: Colors.grey, fontFamily: "Poppins"),
                  ),
                  TextButton(
                      child: Text("Sign Up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.mainColor,
                              fontFamily: "Poppins")),
                      onPressed: () {
                        Get.toNamed(AppRoute.signup);
                      }),
                ],
              ),
            ),
          ]),
        ),
      )
    ]));
  }
}
