import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/user_controller.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/core/constants/routes.dart';

class UpdateDestination extends StatefulWidget {
  const UpdateDestination({super.key});

  @override
  State<UpdateDestination> createState() => _UpdateDestinationState();
}

class _UpdateDestinationState extends State<UpdateDestination> {
  UserController userController = Get.find();
  final id = Get.arguments as String;
  final _formKey = GlobalKey<FormState>();
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
        body: Form(
            key: _formKey,
            child: ListView(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 0, 30),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_back_ios)),
                    Padding(
                      padding: const EdgeInsets.only(left: 90.0),
                      child: Center(
                        child: Text(
                          "Update Profile",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                  child: CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/image/user.png",
                ),
                radius: 40,
              )),
              SizedBox(
                height: 15,
              ),
              SettingFormField(
                title: "Destination",
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                width: 350,
                child: TextFormField(
                 
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "Destination", prefixIcon: Icon(Icons.mail)),
                  controller: emailController,
                  cursorColor: AppColor.mainColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 55, 20, 0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColor.mainColor,
                    ),
                    child: TextButton(
                      onPressed: () async {
                        final form = _formKey.currentState;
                        if (form != null && form.validate()) {
                          if (await userController.updateDestination(
                              id, emailController.text)) {
                            // registration was successful
                            AwesomeDialog(
                              context: context,
                              animType: AnimType.leftSlide,
                              headerAnimationLoop: false,
                              dialogType: DialogType.success,
                              showCloseIcon: true,
                              title: 'Succes',
                              desc: 'Profile update completed successfully',
                              btnOkOnPress: () {
                                Get.offAndToNamed(AppRoute.settings);
                              },
                              btnOkIcon: Icons.check_circle,
                              onDismissCallback: (type) {
                                debugPrint(
                                    'Dialog Dissmiss from callback $type');
                              },
                            ).show();
                          } else {
                            print("registration failed");
                          }
                        }
                      },
                      child: Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.white, fontFamily: "Poppins"),
                        ),
                      ),
                    )),
              ),
            ])));
  }
}

class SettingFormField extends StatelessWidget {
  const SettingFormField({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(15, 40, 0, 15),
        child: Text(
          title,
          style: TextStyle(
              color: AppColor.mainColor,
              fontWeight: FontWeight.w800,
              fontFamily: "Poppins",
              fontSize: 14),
        ),
      ),
    ]);
  }
}
