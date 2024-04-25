import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PassengerCard extends StatelessWidget {
  const PassengerCard({
    Key? key,
    required this.passengerName,
  }) : super(key: key);

  final String passengerName;

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
          height: 120,
          margin: const EdgeInsets.only(top: 20, left: 10, right: 20),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 20), // Adjusted left padding here
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Passenger Name:",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width:
                          20, // Adjusted width to add more space between "Passenger Name" and the name itself
                    ),
                    Text(
                      passengerName,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.black,
                        fontSize: 14,
                        // Set font weight to bold for passenger name
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 90), // Adjusted width to align buttons
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.times,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(width: 20),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.check,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
