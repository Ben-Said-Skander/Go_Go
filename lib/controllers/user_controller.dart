import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class UserController extends GetxController {
  Future<User> getUser(String id) async {
    final response =
        await http.get(Uri.parse('http://192.168.4.161:3600/user'));
    return User.fromJson(jsonDecode(response.body));
  }

  Future<User> updateEmail(String email) async {
    final response = await http.patch(
        Uri.parse('http://192.168.4.161:3600/user/updateEmail'),
        body: <String, String>{'email': email});
    if (response.statusCode == 201) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('User update failed');
    }
  }

  Future<User> updateName(String name) async {
    final response = await http.patch(
        Uri.parse('http://192.168.4.161:3600/user/updateName'),
        body: <String, String>{'name': name});
    if (response.statusCode == 201) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('User update failed');
    }
  }

  Future<User> updatePhone(int phone) async {
    final response = await http.patch(
        Uri.parse('http://192.168.4.161:3600/user/updatePhone'),
        body: <dynamic, int>{'phone': phone});
    if (response.statusCode == 201) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('User update failed');
    }
  }
}
