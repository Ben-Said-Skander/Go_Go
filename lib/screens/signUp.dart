// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:pfa_application_1/constants/colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;
  late TextEditingController nameController;
  late TextEditingController confirmPasswordController;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    nameController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    emailController = TextEditingController();
    phoneController = TextEditingController();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
            decoration: BoxDecoration(
                color: AppColor.mainColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).popAndPushNamed("signIn");
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 40, 0, 0),
                      child: Text(
                        "Hey , get on board",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(73, 8, 0, 0),
                  child: Text(
                    "Sign Up to continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            )),
        Container(
          height: 650,
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 60, 0, 0),
              child: Text("Full Name",
                  style: TextStyle(
                    color: Color.fromARGB(255, 16, 152, 170),
                  )),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: 350,
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Full Name", prefixIcon: Icon(Icons.person)),
                controller: nameController,
                cursorColor: Color.fromARGB(255, 16, 152, 170),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
              child: Text("Email",
                  style: TextStyle(
                    color: Color.fromARGB(255, 16, 152, 170),
                  )),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: 350,
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Email", prefixIcon: Icon(Icons.mail)),
                controller: emailController,
                cursorColor: Color.fromARGB(255, 16, 152, 170),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
              child: Text(
                "Phone Number",
                style: TextStyle(color: Color.fromARGB(255, 16, 152, 170)),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: 350,
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Phone Number", prefixIcon: Icon(Icons.phone)),
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
                  )),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: 350,
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Password", prefixIcon: Icon(Icons.password)),
                controller: passwordController,
                cursorColor: Color.fromARGB(255, 16, 152, 170),
                obscureText: true,
              ),
            ),
            /*
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
              child: Text(
                "Confirm password",
                style: TextStyle(
                  color: Color.fromARGB(255, 16, 152, 170),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: 350,
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Confirm password",
                    prefixIcon: Icon(Icons.password)),
                controller: confirmPasswordController,
                cursorColor: Color.fromARGB(255, 16, 152, 170),
                obscureText: true,
              ),
            ),
            */
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 35, 20, 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromARGB(255, 16, 152, 170),
                ),
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("signIn");
                    },
                    child: Center(
                        child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white),
                    ))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 80),
              child: Row(
                children: [
                  Text(
                    "Already have an account ?",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                      child: Text("Sign In",
                          style: TextStyle(color: AppColor.mainColor)),
                      onPressed: () {
                        Navigator.of(context).popAndPushNamed("signIn");
                      }),
                ],
              ),
            )
          ]),
        )
      ]),
    );
  }
}
