import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class AuthController extends GetxController {
  Future<User> login(String email, String password) async {
    final response = await http.post(
        Uri.parse('http://192.168.4.161:3600/auth'),
        headers: {"Content-Type": "Application/json"},
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}));
    if (response.statusCode == 201) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('User authentication failed');
    }
  }
}
