import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class DescriptionController extends GetxController {
  Future getMedicine(String medicine) async {
    final response = await http.get(
      Uri.parse("https://api.nhs.uk/medicines/${medicine}/"),
      headers: {
        'subscription-key': "2f68ceb8733240efa8a58268857bee5d",
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw ("Req Failed");
    }
  }
}
