// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, camel_case_types, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pfa_application_1/core/constants/colors.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
//   List<Pharmacy> pharmacies = [];
  //List<Pharmacy> filteredPharmacy = [];
  late TextEditingController searchController;
  late LocationPermission permission;
  late Position currentPosition;
  late GoogleMapController mapController;
  CameraPosition initialLocation = CameraPosition(target: LatLng(0.0, 0.0));

 // PharmacyController pharmacyController = Get.find();
 // late final Future<List<Pharmacy>> futureLocations =
   //   pharmacyController.getAllPharmacies();

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
   /* pharmacyController.getAllPharmacies().then((pharmacyFromServer) {
      setState(() {
        pharmacies = pharmacyFromServer;
        filteredPharmacy = pharmacies;
      });
    });*/
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
                  height: 150,
                  width: 450,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30)),
                      color: Color.fromARGB(255, 16, 152, 170)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 25),
                        child: Text("Locate your medicines",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins")),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 18, left: 20),
                        width: 400,
                        child: TextFormField(
                       //   onChanged: (string) {
                /*            filteredPharmacy = pharmacies
                                .where((pharmacy) => pharmacy.longitude
                                    .toString()
                                    .toLowerCase()
                                    .contains(string.toLowerCase()))
                                .toList();
                          },*/
                       //   keyboardType: TextInputType.emailAddress,
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
                       //   controller: searchController,
                          cursorColor: Color.fromARGB(255, 16, 152, 170),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 15),
          height: 582,
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
          ),
        )
      ],
    ));
  }
}
