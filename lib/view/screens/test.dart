// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pfa_application_1/controllers/blog_controller.dart';
import 'package:pfa_application_1/controllers/pharmacyController.dart';
import 'package:pfa_application_1/models/pharmacy.dart';

class ImageScreen extends StatefulWidget {
  ImageScreen();

  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  //late Future<Uint8List>? image;
  Future<List<Pharmacy>>? _pharmaciesFuture;
  PharmacyController pharmController = Get.find();
  @override
  void initState() {
    _pharmaciesFuture = pharmController.getAllPharmacies();

    // image = blogController.getImage("64245abd22d5463cfa4c9d2a");
    //  print(image);
    super.initState();
  }

  List<double> distances = [];
  double calculateDistance(
      double lat1, double long1, double lat2, double long2) {
    const int earthRadius = 6371; // in km
    double dLat = (lat2 - lat1) * pi / 180;
    double dLon = (long2 - long1) * pi / 180;
    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(lat1 * pi / 180) *
            cos(lat2 * pi / 180) *
            sin(dLon / 2) *
            sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    double distance = earthRadius * c;
    // distances.add(distance);
    return distance;
  }

  int nearestPharmacy(List<double> distances) {
    double minDistance = double.infinity;
    int nearestIndex = 0;
    for (int i = 0; i < distances.length; i++) {
      if (distances[i] < minDistance) {
        minDistance = distances[i];
        nearestIndex = i;
      }
    }
    return nearestIndex;
  }

  List<int> pharmacyIndexes(List distances) {
    List<int> indexes = distances.asMap().keys.toList();
    indexes.sort((a, b) => distances[a].compareTo(distances[b]));
    print(indexes);
    return indexes;
  }

  List<String> pharmacyName = [];
  List<double> pharmacyLat = [];
  List<double> pharmacyLong = [];
  List<double> pharmacyDistances = [];
  // List<String> pharmacyName = [];
  String med = "Doliprane";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pharmacy List'),
      ),
      body: Center(
        child: FutureBuilder<List<Pharmacy>>(
          future: _pharmaciesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              var pharmacy = snapshot.data!;
              for (int i = 0; i < pharmacy.length; i++) {
                pharmacyName.add(pharmacy[i].name!);
                pharmacyLat.add(pharmacy[i].latitude!);
                pharmacyLong.add(pharmacy[i].longitude!);
                final pharmDist = calculateDistance(
                    100.0, 120.0, pharmacyLat[i], pharmacyLong[i]);
                pharmacyDistances.add(pharmDist);
              }
              final pharmIndex = pharmacyIndexes(pharmacyDistances);

              /*
              for(int i=0;i<=pharmIndex.length;i++){
                if(pharmacy[i].drugs![searchController.text]==true){
                showRoute()
                break
              }
              if(pharmacy[2].drugs![searchController.text]==true){
                showRoute()
              }
              */

              return ListTile(title: Text(pharmIndex.toString()));
              /*ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  
                  final pharmacy = snapshot.data![index];
                  final pharmName = pharmacy.name;
                  pharmacyName=pharmacyName+pharmacyName;
                  final pharmLat = pharmacy.latitude;
                  final pharmLong = pharmacy.longitude;
                  final pharmDist =
                      calculateDistance(100.0, 120.0, pharmLat!, pharmLong!);
                  print(pharmDist);
                  final pharmIndex = nearestPharmacy(pharmDist);

                  return ListTile(title: Text(pharmIndex.toString()));
                },
                //pharmacy.drugs!["${med}"].toString()
              );*/
            }
          },
        ),
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
}
*/
