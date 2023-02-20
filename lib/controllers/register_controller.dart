import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class RegisterController extends GetxController {
  Future<User> register(
      String fullname, String email, String password, int phoneNumber) async {
    final response =
        await http.post(Uri.parse('https://localhost3600/register'),
            body: jsonEncode(<String, dynamic>{
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
