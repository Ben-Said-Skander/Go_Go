// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../constants/colors.dart';

class Reminders extends StatefulWidget {
  const Reminders({super.key});

  @override
  State<Reminders> createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: backgroundColor,
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.green,
          child: Icon(
            Icons.add,
            color: Colors.white,
            
            ),
        ),
    );
  }
}