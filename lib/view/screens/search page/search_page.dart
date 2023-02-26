// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/pharmacyController.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/models/pharmacy.dart';
//import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Pharmacy> pharmacies = [];
  List<Pharmacy> filteredPharmacy = [];
  late TextEditingController searchController;
  late LocationPermission permission;
  late Position currentPosition;
  late GoogleMapController mapController;
  CameraPosition initialLocation = CameraPosition(target: LatLng(0.0, 0.0));

  PharmacyController pharmacyController = Get.find();
  late final Future<List<Pharmacy>> futureLocations =
      pharmacyController.getAllPharmacies();

  getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        currentPosition = position;
        print('Current Position :${currentPosition}');
      });
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(position.latitude, position.longitude), zoom: 40.0)));
    });
    permission = await Geolocator.requestPermission();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SafeArea(
          child: Stack(
            children: [
              Container(
                  padding: EdgeInsets.only(top: 8),
                  height: 730,
                  child: GoogleMap(
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
                        prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass,
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
                  Padding(
                      padding: const EdgeInsets.fromLTRB(140, 20, 20, 0),
                      child: Container(
                          height: 50,
                          width: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromARGB(255, 16, 152, 170),
                          ),
                          child: MaterialButton(
                            child: Text(
                              "Show Route",
                              style: TextStyle(
                                  color: Colors.white, fontFamily: "Poppins"),
                            ),
                            onPressed: () {
                              // Show route
                            },
                          ))),
                ],
              )
            ],
          ),
        ),
      ],
    ));
  }
}
