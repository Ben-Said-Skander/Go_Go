import 'package:flutter/material.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: ListView(children: [
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
                        Text("Chat",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Poppins")),
                      ],
                    )),
              ),
            ),
          ))
    ]));
  }
}
