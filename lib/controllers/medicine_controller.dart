// ignore_for_file: unused_local_variable

import 'package:get/get.dart';
import 'package:pfa_application_1/core/constants/link_api.dart';
import 'package:pfa_application_1/models/medicine.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MedicineController extends GetxController {
  var medicineXList = List<Medicine>.empty().obs;
  var isLoading = true.obs;

  Future<Medicine> addMedicine(String name, String dosage, String type,
      String interval, String start_time, String medicineId) async {
    final response =
        await http.post(Uri.parse('${LinkApi.medicines}'),
            headers: {"Content-Type": "Application/json"},
            body: jsonEncode(<String, String>{
              'name': name,
              'dosage': dosage,
              'type': type,
              'interval': interval,
              'start_time': start_time,
              "medicineId":medicineId
            }));

    if (response.statusCode == 201) {
      var medicine = Medicine.fromJson(json.decode(response.body));
      print(medicine);
      return medicine;
    } else {
      throw Exception('Medicine loading failed');
    }
  }

  Future<Medicine> deleteMedicine(String id) async {
    final response = await http
        .delete(Uri.parse('${LinkApi.medicines}/$id'));
    if (response.statusCode == 200) {
      var medicine = Medicine.fromJson(json.decode(response.body));
      print(medicine);
      return medicine;
    } else {
      throw Exception('Failed to delete Medicine');
    }
  }

  Future<Medicine> getMedicine(String id) async {
    final response =
        await http.get(Uri.parse('${LinkApi.medicines}/$id'));
    if (response.statusCode == 200) {
      var medicine = Medicine.fromJson(json.decode(response.body));
      print(medicine);
      return medicine;
    } else {
      throw Exception('Failed to load Medicine');
    }
  }

  Future<List<Medicine>> fetchMedicines() async {
    try {
      isLoading(true);
      final response =
          await http.get(Uri.parse('${LinkApi.medicines}'));

      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
        var medicineList =
            parsed.map<Medicine>((e) => Medicine.fromJson(e)).toList();
        print(medicineList);
        medicineXList.assignAll(medicineList);
        return medicineXList;
      } else {
        throw Exception('Failed to load Medicines');
      }
    } finally {
      isLoading(false);
    }
  }
}
