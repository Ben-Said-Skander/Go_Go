// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../constants/colors.dart';

class Blog extends StatefulWidget {
  const Blog({super.key});

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
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
