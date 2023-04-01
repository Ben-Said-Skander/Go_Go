import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class RegisterController extends GetxController {
  bool _isRegistred = false;

  bool get isRegistred => _isRegistred;

  Future<bool> register(String fullname, String email, String password,
      String phoneNumber) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.14:3600/register'),
        headers: {"Content-Type": "Application/json"},
        body: jsonEncode(<String, String>{
          'fullname': fullname,
          'email': email,
          'password': password,
          'phoneNumber': phoneNumber,
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

//    throw Exception('User loading failed');
Future<Map<String, dynamic>> registerUser(
    String username, String email, String password, String phoneNumber) async {
  final url = Uri.parse('http://192.168.1.14:3600/register');

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
    }),
  );

  if (response.statusCode == 200) {
    final responseBody = jsonDecode(response.body);
    return responseBody;
  } else {
    throw Exception('Failed to register user');
  }
}
