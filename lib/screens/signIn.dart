// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:pfa_application_1/constants/colors.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(children: [
        Container(
            height: 120,
            width: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(80)),
              color: Color.fromARGB(255, 16, 152, 170),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                  child: Text("Welcome back ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child: Text("Sign In to continue ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      )),
                ),
              ],
            )),
        Container(
          margin: EdgeInsets.fromLTRB(20, 100, 20, 0),
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
                    fontSize: 23),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 0, 0),
              child: Text("Email"),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: 350,
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "Email", prefixIcon: Icon(Icons.mail)),
                controller: emailController,
                cursorColor: Color.fromARGB(255, 16, 152, 170),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
              child: Text("Password"),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(120, 15, 0, 0),
              child: Center(
                child: InkWell(
                  child: Text('Forgot your Password ?',
                      style: TextStyle(
                          color: Color.fromARGB(255, 16, 152, 170),
                          fontSize: 14)),
                  onTap: () {
                    // to the forgot password pages
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
                      color: Color.fromARGB(255, 16, 152, 170),
                    ),
                    child: MaterialButton(
                      child: Text(
                        "Log In",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.of(context).popAndPushNamed("home");
                      },
                    ))),
            Padding(
              padding: EdgeInsets.only(left: 110),
              child: Row(
                children: [
                  Text(
                    "New user ?",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                      child: Text("Sign Up",
                          style: TextStyle(color: AppColor.mainColor)),
                      onPressed: () {
                        Navigator.of(context).pushNamed("signUp");
                      }),
                ],
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
