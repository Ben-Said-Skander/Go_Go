import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pfa_application_1/models/pharmacy.dart';

class PharmacyController extends GetxController {
  Future<List<Pharmacy>> getAllPharmacies() async {
    final response =
        await http.get(Uri.parse("http://192.168.129.161:3600/pharmacies"));
    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.body).cast<Map<String, dynamic>>();
      var pharmaciesList =
          jsonList.map<Pharmacy>((e) => Pharmacy.fromJson(e)).toList();
      print(pharmaciesList);
      return pharmaciesList;
    } else {
      throw Exception('Failed to load Pharmacies');
    }
  }
}
