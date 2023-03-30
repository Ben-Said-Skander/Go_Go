import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pfa_application_1/controllers/blog_controller.dart';

import 'package:pfa_application_1/models/image.dart';

/*
class ImageScreen extends StatefulWidget {
  ImageScreen();

  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  late Future<Picture>? image;
  BlogController blogController = Get.find();
  @override
  void initState() {
    image = blogController.getImage("64245abd22d5463cfa4c9d2a");
  //  print(image);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        FutureBuilder<Picture>(
            future: image,
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data!.data!);
                return Center(child: Image.memory(snapshot.data!.data!));
              } else {
                return Center(
                    child: CircularProgressIndicator(
                  backgroundColor: Color.fromARGB(255, 16, 152, 170),
                  value: 5,
                ));
              }
            }))
      ]),
    );
  }
}*/
class ImageScreen extends StatefulWidget {
  ImageScreen();

  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  BlogController blogController = Get.find();
  late Future<Uint8List> image;

  @override
  void initState() {
    super.initState();
    image = blogController.getImage("64245d61cc7d51fe06a7e45b");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Uint8List>(
        future: image,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Image.memory(snapshot.data!),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
