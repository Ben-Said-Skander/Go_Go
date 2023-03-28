import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class RegisterController extends GetxController {
  Future<User> register(
      String fullname, String email, String password, String phoneNumber) async {
    final response =
        await http.post(Uri.parse('http://192.168.1.14:3600/register'),
            headers: {"Content-Type": "Application/json"},
            body: jsonEncode(<String, String>{
              'fullname': fullname,
              'phoneNumber': phoneNumber,
              'email': email,
              'password': password,
            }));
    if (response.statusCode == 201) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('User loading failed');
    }
  }
}
