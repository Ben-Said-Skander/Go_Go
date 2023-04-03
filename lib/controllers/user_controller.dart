import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class UserController extends GetxController {
  Future<User> getUser(String id) async {
    final response =
        await http.get(Uri.parse('http://192.168.245.161:3600/user/${id}'));
    return User.fromJson(jsonDecode(response.body));
  }

  Future<bool> updateEmail(String id, String email) async {
    final response = await http.put(
        Uri.parse('http://192.168.245.161:3600/user/updateEmail/${id}'),
        body: <String, String>{'email': email});
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('User update failed');
    }
  }

  Future<bool> updatePassword(String id, String password) async {
    final response = await http.put(
        Uri.parse('http://192.168.245.161:3600/user/updatePassword/${id}'),
        body: <String, String>{'password': password});
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('User update failed');
    }
  }

  Future<bool> updateName(String id, String name) async {
    final response = await http.put(
        Uri.parse('http://192.168.245.161:3600/user/updateName/${id}'),
        body: <String, String>{'name': name});
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('User update failed');
    }
  }

  Future<bool> updatePhone(String id, int phone) async {
    final response = await http.put(
        Uri.parse('http://192.168.245.161:3600/user/updatePhone/${id}'),
        body: <dynamic, int>{'phone': phone});
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('User update failed');
    }
  }

  Future<bool> resetPassword(String email) async {
    final response = await http.post(
        Uri.parse("http://192.168.245.161:3600/user/forgotPassword"),
        headers: {"Content-Type": "Application/json"},
        body: jsonEncode(<String, String>{"email": email}));
    if (response.statusCode == 200) {
      print("Reset email is sent");
      return true;
    } else {
      throw Exception('Failed to send verification code');
    }
  }
}
