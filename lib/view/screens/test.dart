// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pfa_application_1/controllers/blog_controller.dart';

import 'package:pfa_application_1/models/image.dart';

class ImageScreen extends StatefulWidget {
  ImageScreen();

  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  //late Future<Uint8List>? image;
  //Future<List<Pharmacy>>? _pharmaciesFuture;
  BlogController blogController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Grid'),
      ),
      body: FutureBuilder<List<Picture>>(
     //   future: blogController.getAllImages(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final images = snapshot.data!;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: images.length,
              itemBuilder: (context, index) {
                final image = images[index];
                return Image.memory(image.data!);
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
/*
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
*/
/*
class ImageScreen extends StatefulWidget {
  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  List<Uint8List> _images = [];
  BlogController blogController = Get.find();
  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    try {
      final images = await blogController.getAllImagesXXX();
      setState(() {
        _images = images;
        print(_images);
      });
    } catch (e) {
      // Handle error
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Images'),
      ),
      body: _images.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: _images.length,
              itemBuilder: (context, index) {
                final image = _images[index];
                return Image.memory(image);
              },
            ),
    );
  }
}*/

