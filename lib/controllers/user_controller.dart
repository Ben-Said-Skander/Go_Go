import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pfa_application_1/core/constants/link_api.dart';
import '../models/user.dart';

class UserController extends GetxController {
  Future<User> getUser(String id) async {
    try {
      final response =
          await http.get(Uri.parse('${LinkApi.user}/${id}'));

      var user = User.fromJson(jsonDecode(response.body));

      return user;
    } catch (Error) {
      throw Exception('User loading failed');
    }
  }

  Future<bool> updateEmail(String id, String email) async {
    final response = await http.put(
        Uri.parse('${LinkApi.updateEmail}/${id}'),
        body: <String, String>{'email': email});
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('User update failed');
    }
  }

  Future<bool> updatePassword(String id, String password) async {
    final response = await http.put(
        Uri.parse('${LinkApi.updatePassword}/${id}'),
        body: <String, String>{'password': password});
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('User update failed');
    }
  }

  Future<bool> updateName(String id, String name) async {
    final response = await http.put(
        Uri.parse('${LinkApi.updateName}/${id}'),
        body: <String, String>{'fullname': name});
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('User update failed');
    }
  }

  Future<bool> updatePhone(String id, String phone) async {
    final response = await http.put(
        Uri.parse('${LinkApi.updatePhone}/${id}'),
        body: <String, String>{'phoneNumber': phone});
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('User update failed');
    }
  }

  Future<bool> resetPassword(String email) async {
    final response = await http.post(
        Uri.parse("${LinkApi.forgotPassword}"),
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
