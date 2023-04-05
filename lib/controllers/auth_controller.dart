// ignore_for_file: unused_local_variable

import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pfa_application_1/core/constants/link_api.dart';

class AuthController extends GetxController {
  Future<bool> login(String email, String password) async {
  try {
    final response = await http.post(
      Uri.parse('${LinkApi.auth}'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
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
