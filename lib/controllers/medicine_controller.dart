// ignore_for_file: unused_local_variable

import 'package:get/get.dart';
import 'package:pfa_application_1/models/medicine.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MedicineController extends GetxController {
  Future<Medicine> addMedicine(String name, int dosage, String type,
      String startingTime, int interval) async {
    final response =
        await http.post(Uri.parse('https://localhost3600/medicines'),
            body: jsonEncode(<String, dynamic>{
              'name': name,
              'dosage': dosage,
              'type': type,
              'startingTime': startingTime,
              'interval': interval,
            }));

    if (response.statusCode == 201) {
      return Medicine.fromJson(json.decode(response.body));
    } else {
      throw Exception('Medicine loading failed');
    }
  }

  Future<Medicine> deleteMedicine(String id) async {
    final response =
        await http.delete(Uri.parse('https://localhost3600/medicines/$id'));
    if (response.statusCode == 200) {
      return Medicine.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to delete Medicine');
    }
  }
/*
  Future<List<Medicine>> fetchMedicines() async {
    final response =
        await http.get(Uri.parse('https://localhost3600/medicines'));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as List<dynamic>;
      var medicineList= jsonResponse.map((e) => Medicine.fromJson(e).toList()) ;
      return medicineList ; 
     
    } else {
      throw Exception('Unexpected Error');
    }
  }*/
}
