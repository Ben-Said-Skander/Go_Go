import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class AuthController extends GetxController {
  Future<User> login(String email, String password) async {
    final response = await http.post(Uri.parse('https://localhost3600/auth'),
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}));
    if (response.statusCode == 201) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('User authentication failed');
    }
  }
}
