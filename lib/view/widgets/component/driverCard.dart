import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pfa_application_1/core/constants/colors.dart';

class DriverCard extends StatelessWidget {
  const DriverCard({
    Key? key,
    required this.driverName,
    required this.carModel,
    required this.destination,
  }) : super(key: key);

  final String driverName;
  final String carModel;
  final String destination;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          margin: const EdgeInsets.only(top: 20, left: 10, right: 20),
          child: Container(
            padding: const EdgeInsets.only(
                top: 20, right: 40, left: 20), // Adjusted padding here
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildRichText('Driver:', driverName),
                buildRichText('Car model:', carModel),
                buildRichText('Destination:', destination),
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
                        // add a new post
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
    );
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
