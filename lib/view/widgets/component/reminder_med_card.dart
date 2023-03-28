import 'package:flutter/material.dart';

class ReminderMedCard extends StatelessWidget {
  const ReminderMedCard({
    Key? key,
    required this.med_name,
    required this.med_pic,
    required this.med_interval,
  }) : super(key: key);
  final String med_name;
  final String med_pic;
  final String med_interval;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              spreadRadius: 1,
              color: Color.fromARGB(255, 207, 207, 207),
            )
          ]),
      width: 200,
      height: 600,
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
              child: Image.asset(
            med_pic,
            width: 100,
            height: 100,
          )),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13),
            child: Text(
              med_name,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13),
            child: Text(
              med_interval,
              style: TextStyle(
                  color: Color.fromARGB(255, 5, 115, 137),
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
