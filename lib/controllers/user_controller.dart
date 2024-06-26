import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pfa_application_1/core/constants/link_api.dart';
import '../models/user.dart';

class UserController extends GetxController {
  
  Future<List<User>> getAllUsers() async {
    final response = await http.get(Uri.parse("${LinkApi.user}"));
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      var userList = parsed.map<User>((e) => User.fromJson(e)).toList();
      return userList;
    } else {
      throw ("Get all users failed");
    }
  }

  Future<User> getUser(String id) async {
    try {
      final response = await http.get(Uri.parse('${LinkApi.user}/${id}'));

      var user = User.fromJson(jsonDecode(response.body));

      return user;
    } catch (Error) {
      throw Exception('User loading failed');
    }
  }

  Future<bool> updateEmail(String id, String email) async {
    final response = await http.put(Uri.parse('${LinkApi.updateEmail}/${id}'),
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
    final response = await http.put(Uri.parse('${LinkApi.updateName}/${id}'),
        body: <String, String>{'fullname': name});
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('User update failed');
    }
  }

  Future<bool> updatePhone(String id, String phone) async {
    final response = await http.put(Uri.parse('${LinkApi.updatePhone}/${id}'),
        body: <String, String>{'phoneNumber': phone});
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('User update failed');
    }
  }

  Future<bool> resetPassword(String email) async {
    final response = await http.post(Uri.parse("${LinkApi.forgotPassword}"),
        headers: {"Content-Type": "Application/json"},
        body: jsonEncode(<String, String>{"email": email}));
    if (response.statusCode == 200) {
      print("Reset email is sent");
      return true;
    } else {
      throw Exception('Failed to send verification code');
    }
  }

  Future<bool> updateAvailable(String id, String isAvailable) async {
    final response = await http.put(
        Uri.parse('${LinkApi.updateAvailable}/${id}'),
        body: <String, String>{'isAvailable': isAvailable});
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('User update failed');
    }
  }

  Future<bool> updateDestination(String id, String destination) async {
    final response = await http.put(
        Uri.parse('${LinkApi.updateDestination}/${id}'),
        body: <String, String>{'destination': destination});
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('User update failed');
    }
  }

  Future<bool> updateCar(String id, String carModel) async {
    final response = await http.put(Uri.parse('${LinkApi.updateCar}/${id}'),
        body: <String, String>{'carModel': carModel});
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('User update failed');
    }
  }
}
