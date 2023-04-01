// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/register_controller.dart';

import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/core/constants/routes.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  RegisterController registerController = Get.find();
  final _formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;
  late TextEditingController nameController;
  bool registrationSuccessful = false;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    nameController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    emailController = TextEditingController();
    phoneController = TextEditingController();
    nameController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: ListView(children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 43.0),
            child: Center(
                child: Text(
              "Sign Up",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Poppins"),
            )),
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 50),
            height: 700,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(80),
                topRight: Radius.circular(80),
              ),
            ),
            child: Container(
                height: 650,
                child: Form(
                  key: _formKey,
                  child: ListView(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35, 30, 0, 0),
                      child: Text("Create an account",
                          style: TextStyle(
                              color: Color.fromARGB(255, 16, 152, 170),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins")),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 45, 0, 0),
                      child: Text("Full Name",
                          style: TextStyle(
                              color: Color.fromARGB(255, 16, 152, 170),
                              fontFamily: "Poppins")),
                    ),
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
                            hintText: "Full Name",
                            prefixIcon: Icon(Icons.person)),
                        controller: nameController,
                        cursorColor: Color.fromARGB(255, 16, 152, 170),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
                      child: Text("Email",
                          style: TextStyle(
                              color: Color.fromARGB(255, 16, 152, 170),
                              fontFamily: "Poppins")),
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
                        decoration: InputDecoration(
                            hintText: "Email", prefixIcon: Icon(Icons.mail)),
                        controller: emailController,
                        cursorColor: Color.fromARGB(255, 16, 152, 170),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
                      child: Text("Phone Number",
                          style: TextStyle(
                              color: Color.fromARGB(255, 16, 152, 170),
                              fontFamily: "Poppins")),
                    ),
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
                            hintText: "Phone Number",
                            prefixIcon: Icon(Icons.phone)),
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        cursorColor: Color.fromARGB(255, 16, 152, 170),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
                      child: Text("Password",
                          style: TextStyle(
                              color: Color.fromARGB(255, 16, 152, 170),
                              fontFamily: "Poppins")),
                    ),
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
                            hintText: "Password",
                            prefixIcon: Icon(Icons.password)),
                        controller: passwordController,
                        cursorColor: Color.fromARGB(255, 16, 152, 170),
                        obscureText: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 55, 20, 0),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color.fromARGB(255, 16, 152, 170),
                          ),
                          child: TextButton(
                            onPressed: () async {
                              final form = _formKey.currentState;
                              if (form != null && form.validate()) {
                                if (await registerController.register(
                                    nameController.text,
                                    emailController.text,
                                    passwordController.text,
                                    phoneController.text)) {
                                  // registration was successful
                                  Get.offAndToNamed(AppRoute.signIn);
                                } else {
                                  print("registration failed");
                                }
                              }
                            },
                            child: Center(
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Colors.white, fontFamily: "Poppins"),
                              ),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 75),
                      child: Row(
                        children: [
                          Text(
                            "Already have an account ?",
                            style: TextStyle(
                                color: Colors.grey, fontFamily: "Poppins"),
                          ),
                          TextButton(
                              child: Text("Sign In",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.mainColor,
                                      fontFamily: "Poppins")),
                              onPressed: () {
                                Get.offAndToNamed(AppRoute.signIn);
                              }),
                        ],
                      ),
                    )
                  ]),
                )))
      ]),
    );
  }
}
