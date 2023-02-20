import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/core/constants/routes.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late TextEditingController emailController;

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    emailController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      SafeArea(
          child: Container(
        margin: EdgeInsets.only(left: 40, right: 40),
        height: 250,
        width: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(200.0),
                bottomRight: Radius.circular(200)),
            color: Color.fromARGB(255, 16, 152, 170)),
        child: Center(
            child: Icon(
          FontAwesomeIcons.lock,
          size: 80,
          color: Colors.white,
        )),
      )),
      SizedBox(
        height: 30,
      ),
      Container(
        margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
        height: 400,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                spreadRadius: 1,
                color: Color.fromARGB(255, 207, 207, 207),
                // offset: Offset(2, 1),
              )
            ]),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Forgot your Password !",
                style: TextStyle(
                    color: AppColor.mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: "Poppins"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
              child: Text(
                "Enter the email associated to your account",
                style: TextStyle(
                    color: Colors.black,
                    //  fontWeight: FontWeight.bold,
                    fontSize: 14,
                    fontFamily: "Poppins"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 60, 0, 0),
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
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "Email", prefixIcon: Icon(Icons.mail)),
                controller: emailController,
                cursorColor: Color.fromARGB(255, 16, 152, 170),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(80, 80, 80, 0),
                child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromARGB(255, 16, 152, 170),
                    ),
                    child: MaterialButton(
                      child: Text(
                        "Send",
                        style: TextStyle(
                            color: Colors.white, fontFamily: "Poppins"),
                      ),
                      onPressed: () {
                        Get.offAndToNamed(AppRoute.resetPasswrod);
                      },
                    ))),
          ],
        ),
      )
    ]));
  }
}
