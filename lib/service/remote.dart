// ignore_for_file: unused_local_variable
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pfa_application_1/models/medicine_desciption.dart';
import 'package:pfa_application_1/service/models/medicine_description_api.dart';

class RemoteService extends GetxController {
  Future<List<MedicineDescription>> getMedicines() async {
    final response = await http.get(Uri.parse('uri'));
    if (response.statusCode == 200) {
      var medicinesJsonList =
          jsonDecode(response.body).cast<Map<String, dynamic>>();
      var medicinesList = medicinesJsonList
          .map((e) => MedicineDescriptionApi.fromJson(e))
          .map((e) => MedicineDescription(
              e.adverse_reactions,
              e.dosageAndAdministration,
              e.indicationsAndUsage,
              e.generic_name,
              e.description));

      return medicinesList;
    } else {
      throw Exception('Failed to load Medicines');
    }
  }
}
