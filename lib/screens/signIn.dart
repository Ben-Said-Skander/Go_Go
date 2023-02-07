// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

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
          height: 100,
          width: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(80)),
            color: Color.fromARGB(255, 16, 152, 170),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
            child: Text("Welcome back ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                )),
          ),
        ),
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
                    color: Color.fromARGB(255, 16, 152, 170),
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
            SizedBox(
              height: 50,
            ),
            Center(
              child: InkWell(
                child: Text('Forgot your Password ?',
                    style: TextStyle(
                        color: Color.fromARGB(255, 16, 152, 170),
                        fontSize: 14)),
                onTap: () {},
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(150, 60, 20, 0),
                child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromARGB(255, 16, 152, 170),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed("reminder");
                      },
                    ))),
          ]),
        )
      ]),
    );
  }
}
