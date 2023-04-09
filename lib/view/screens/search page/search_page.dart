// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, override_on_non_overriding_member, deprecated_member_use

import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/pharmacyController.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/models/pharmacy.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Set<Marker> markers = {};
  late PolylinePoints polylinePoints;
  List<LatLng> polylineCoordinates = [];
  Map<PolylineId, Polyline> polylines = {};
  List<Pharmacy> pharmacies = [];
  List<Pharmacy> filteredPharmacy = [];
  late TextEditingController searchController;
  late LocationPermission permission;
  late Position currentPosition;
  double currentLatitude = 0;
  double currentLongitude = 0;
  late GoogleMapController mapController;
  CameraPosition initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
  int isMedAvailable = 1;

  PharmacyController pharmacyController = Get.find();
  late final Future<List<Pharmacy>> futureLocations =
      pharmacyController.getAllPharmacies();

  getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        currentPosition = position;
        currentLatitude = position.latitude;
        currentLongitude = position.longitude;

        print("***************************************");
        print(currentLatitude);
        print(currentLongitude);
        print("***************************************");
      });
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(position.latitude, position.longitude), zoom: 40.0)));
    });
    permission = await Geolocator.requestPermission();
  }

  createMarkers(double startLatitude, double startLongitude,
      double destinationLatitude, double destinationLongitude) {
    Marker starterMarker = Marker(
      markerId: MarkerId('Marker1'),
      position: LatLng(startLatitude, startLongitude),
      icon: BitmapDescriptor.defaultMarker,
      visible: true,
    );
    Marker destinationMarker = Marker(
      markerId: MarkerId('Marker2'),
      position: LatLng(destinationLatitude, destinationLongitude),
      icon: BitmapDescriptor.defaultMarker,
      visible: true,
    );
    markers.add(starterMarker);
    markers.add(destinationMarker);
    return markers;
  }

  createPolylines(double startLatitude, double startLongitude,
      double destinationLatitude, double destinationLongitude) async {
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyC2HrUyqcy4IO9OEZ4BWEYBNe7MpobW5Us",
      PointLatLng(startLatitude, startLongitude),
      PointLatLng(destinationLatitude, destinationLongitude),
      travelMode: TravelMode.transit,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    PolylineId id = PolylineId("poly");
    //initializing Polyline
    Polyline polyline = Polyline(
        polylineId: id,
        color: AppColor.mainColor,
        points: polylineCoordinates,
        width: 3);
    // Adding the polyline to the map
    polylines[id] = polyline;
    //return polylines
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    refreshData();

    createPolylines(34.8443519, 10.7567297, 39.8443519, 16.7567297);
    pharmacyController.getAllPharmacies().then((pharmacyFromServer) {
      setState(() {
        pharmacies = pharmacyFromServer;
        filteredPharmacy = pharmacies;
      });
    });
    getCurrentLocation();
    searchController = TextEditingController();
    super.initState();
  }

  PharmacyController pharmController = Get.find();

  List<String> pharmacyName = [];
  List<double> pharmacyLat = [];
  List<double> pharmacyLong = [];
  List<double> pharmacyDistances = [];
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

  List<int> pharmacyIndexes(List distances) {
    List<int> indexes = distances.asMap().keys.toList();
    indexes.sort((a, b) => distances[a].compareTo(distances[b]));
    //print(indexes);
    return indexes;
  }

  Future<void> openGoogleMaps(double latitude, double longitude) async {
    final url =
        'https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  int pharmacyIndex = 0;
  int count = 0;
  int index = -1;
  List trueIndex = [];
  bool isLoading = false;
  late List<Pharmacy> pharmList = [];
  @override
  Future<void> refreshData() async {
    setState(() {
      isLoading = true;
    });
    try {
      final List<Pharmacy> pharm = await pharmacyController.getAllPharmacies();
      setState(() {
        pharmList = pharm;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
            onRefresh: refreshData,
            child: ListView(
              children: [
                SafeArea(
                  child: Stack(
                    children: [
                      Container(
                          padding: EdgeInsets.only(top: 0),
                          height: 800,
                          child: GoogleMap(
                            markers: createMarkers(
                                34.8443519, 10.7567297, 39.8443519, 16.7567297),
                            polylines: Set<Polyline>.of(polylines.values),
                            initialCameraPosition: initialLocation,
                            myLocationEnabled: true,
                            myLocationButtonEnabled: true,
                            mapType: MapType.normal,
                            zoomGesturesEnabled: true,
                            zoomControlsEnabled: true,
                            onMapCreated: (GoogleMapController controller) {
                              mapController = controller;
                            },
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30, left: 25),
                            child: Text("Locate your medicines",
                                style: TextStyle(
                                    color: AppColor.mainColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Poppins")),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 25, left: 20),
                            width: 400,
                            child: TextFormField(
                              onChanged: (string) {
                                filteredPharmacy = pharmacies
                                    .where((pharmacy) => pharmacy.longitude
                                        .toString()
                                        .toLowerCase()
                                        .contains(string.toLowerCase()))
                                    .toList();
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Locate your medicines",
                                hintStyle: TextStyle(color: Colors.black),
                                prefixIcon: Icon(
                                    FontAwesomeIcons.magnifyingGlass,
                                    color: Colors.black),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(30)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                              controller: searchController,
                              cursorColor: Color.fromARGB(255, 16, 152, 170),
                            ),
                          ),
                          FutureBuilder<List<Pharmacy>>(
                              future: pharmacyController.getAllPharmacies(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
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
                                        currentLatitude,
                                        currentLongitude,
                                        pharmacyLat[i],
                                        pharmacyLong[i]);
                                    pharmacyDistances.add(pharmDist);
                                  }

                                  List pharmIndex =
                                      pharmacyIndexes(pharmacyDistances);
                                  count++;

                                  return Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          140, 20, 20, 0),
                                      child: Container(
                                          height: 50,
                                          width: 130,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Color.fromARGB(
                                                255, 16, 152, 170),
                                          ),
                                          child: MaterialButton(
                                              child: Text(
                                                "Show Route",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "Poppins"),
                                              ),
                                              onPressed: () {
                                                try {
                                                  for (int i = 0;
                                                      i < pharmacy.length;
                                                      i++) {
                                                    if (pharmacy[i].drugs![
                                                            searchController
                                                                .text] ==
                                                        true) {
                                                      trueIndex.add(i);
                                                    }
                                                  }
                                                  print(
                                                      "**********************************");
                                                  print(trueIndex);
                                                  print(pharmIndex);

                                                  int index = pharmIndex
                                                      .indexWhere((element) =>
                                                          trueIndex.contains(
                                                              element));
                                                  index = (index == -1)
                                                      ? index
                                                      : pharmIndex.indexOf(
                                                          pharmIndex.firstWhere(
                                                              (element) => trueIndex
                                                                  .contains(
                                                                      element)));

                                                  print(index);
                                                  print(
                                                      "**********************************");
                                                  pharmacyIndex =
                                                      pharmIndex[index];

                                                  if (index != -1) {
                                                    openGoogleMaps(
                                                      pharmacyLat[
                                                          pharmacyIndex],
                                                      pharmacyLong[
                                                          pharmacyIndex],
                                                    );
                                                    trueIndex = [];
                                                  } else {
                                                    AwesomeDialog(
                                                      context: context,
                                                      dialogType:
                                                          DialogType.error,
                                                      animType:
                                                          AnimType.rightSlide,
                                                      headerAnimationLoop:
                                                          false,
                                                      title: 'Not Available',
                                                      desc:
                                                          'There is no Account for this email',
                                                      btnOkOnPress: () {},
                                                      btnOkIcon: Icons.cancel,
                                                      btnOkColor: Colors.red,
                                                    ).show();
                                                  }
                                                } catch (error) {
                                                  AwesomeDialog(
                                                    context: context,
                                                    dialogType:
                                                        DialogType.error,
                                                    animType:
                                                        AnimType.rightSlide,
                                                    headerAnimationLoop: false,
                                                    title: 'Not Available',
                                                    desc:
                                                        'The drug you are looking for is not available at any pharmacy .',
                                                    btnOkOnPress: () {},
                                                    btnOkIcon: Icons.cancel,
                                                    btnOkColor: Colors.red,
                                                  ).show();
                                                }
                                              })));
                                }
                              })
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )));
  }
}
//Current Position :Latitude: 34.8443519, Longitude: 10.7567297