// ignore_for_file: unused_import, unused_local_variable

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/blog.dart';

class BlogController extends GetxController {
  Future<Blog> createArticle(
      String title, String category, String pictureUrl) async {
    final response = await http.post(Uri.parse('https://localhost3600/blog'),
        body: jsonEncode(<String, String>{
          'title': title,
          'category': category,
          'pictureUrl': pictureUrl
        }));
    if (response.statusCode == 201) {
      return Blog.fromJson(json.decode(response.body));
    } else {
      throw Exception('Blog loading failed');
    }
  }

  Future<Blog> deleteArticle(String id) async {
    final response =
        await http.delete(Uri.parse('https://localhost3600/blog/$id'));
    if (response.statusCode == 200) {
      return Blog.fromJson(json.decode(response.body));
    } else {
      ;
      throw Exception('Failed to delete Blog');
    }
  }
/*
  Future<List<Blog>> fetchArticles() async {
    final response = await http.get(Uri.parse('https://localhost3600/blog'));

    if (response.statusCode == 201) {
      var jsonResponse = jsonDecode(response.body) as List<dynamic>;
      var articlesList = jsonResponse.map((e) => Blog.fromJson(e).toList());
      return articlesList;
    } else {
      throw Exception('Unexpected Error');
    }
  }*/
}
