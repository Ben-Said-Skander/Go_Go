import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/user_controller.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/core/constants/routes.dart';
import 'package:pfa_application_1/models/user.dart';

class VerifyCode extends StatefulWidget {
  const VerifyCode({super.key});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  late TextEditingController codeController;
  final _formKey = GlobalKey<FormState>();
  UserController userController = Get.find();
  Future<User>? user ;

  @override
  void dispose() {
    codeController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    codeController = TextEditingController();
    user=userController.getUser("id") ;


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: ListView(children: [
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
                        "Enter the verification code sent to you by email",
                        style: TextStyle(
                            color: Colors.black,
                            //  fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: "Poppins"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
                      child: Text("Verification Code",
                          style: TextStyle(
                            color: AppColor.mainColor,
                            fontFamily: "Poppins",
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      width: 350,
                      child: TextFormField(
                        validator: ((value) {
                          if (value!.isEmpty 
                                 ) {
                            return 'Enter a valid code!';
                          }
                        }),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "Code", prefixIcon: Icon(Icons.numbers)),
                        controller: codeController,
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
                                "Submit",
                                style: TextStyle(
                                    color: Colors.white, fontFamily: "Poppins"),
                              ),
                              onPressed: () async {
                                final form = _formKey.currentState;
                                if (form != null && form.validate()) {
                               /*   if (user.verificationCode==codeController.text) {
                                    Get.offAndToNamed(AppRoute.resetPasswrod);
                                  }*/
                                }
                                Get.offAndToNamed(AppRoute.resetPasswrod);
                              },
                            ))),
                  ],
                ),
              )
            ])));
  }
}
