import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pfa_application_1/core/constants/link_api.dart';

class RegisterController extends GetxController {
  bool _isRegistred = false;
  bool get isRegistred => _isRegistred;

  Future<bool> register(
      String fullname,
      String email,
      String password,
      String isAvailable,
      String carModel,
      String destination,
      String phoneNumber) async {
    try {
      final response = await http.post(
        Uri.parse('${LinkApi.register}'),
        headers: {"Content-Type": "Application/json"},
        body: jsonEncode(<String, String>{
          'fullname': fullname,
          'email': email,
          'password': password,
          'phoneNumber': phoneNumber,
          'isAvailable': isAvailable,
          'carModel': carModel,
          'destination': destination,
        }),
      );
      if (response.statusCode == 201) {
        // Login was successful
        return true;
      } else {
        // Login failed
        return false;
      }
    } catch (error) {
      // Handle any errors that may occur
      throw Exception('Failed to login: $error');
    }
  }
}

/*
//    throw Exception('User loading failed');
Future<Map<String, dynamic>> registerUser(
  String username,
  String email,
  String password,
  String phoneNumber,
  String destination,
  String isAvailable,
  String carModel,
) async {
  final url = Uri.parse('${LinkApi.medicines}');

  final response = await http.post(
    url,
    headers: {
      "Content-Type": "application/json",
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'isAvailable': isAvailable,
      'carModel': carModel,
      'destination': destination,
    }),
  );

  if (response.statusCode == 200) {
    final responseBody = jsonDecode(response.body);
    return responseBody;
  } else {
    throw Exception('Failed to register user');
  }
}
*/