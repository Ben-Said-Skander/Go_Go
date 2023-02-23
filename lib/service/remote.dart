// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pfa_application_1/service/models/medicine_description_api.dart';

class RemoteService {
  Future<List<MedicineDescriptionApi>> getMedicines() async {
    final response = await http.get(Uri.parse('uri'));
    if (response.statusCode == 200) {
      var medicinesJsonList =
          jsonDecode(response.body).cast<Map<String, dynamic>>();
      var medicinesList = medicinesJsonList
          .map((e) => MedicineDescriptionApi.fromJson(e))
          .toList();
      return medicinesList;
    } else {
      throw Exception('Failed to load Medicines');
    }
  }
}
