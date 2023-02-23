// ignore_for_file: unused_import, unused_local_variable

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/blog.dart';

class BlogController extends GetxController {
  Future<Blog> createArticle(String title, String category, String body) async {
    final response = await http.post(
        Uri.parse('http://192.168.101.161:3600/blog'),
        headers: {"Content-Type": "Application/json"},
        body: jsonEncode(<String, String>{
          'title': title,
          'category': category,
          'body': body
        }));
    if (response.statusCode == 201) {
      var article = Blog.fromJson(json.decode(response.body));
      print(article);
      return article;
    } else {
      throw Exception('Blog loading failed');
    }
  }

  Future<Blog> deleteArticle(String id) async {
    final response =
        await http.delete(Uri.parse('http://192.168.101.161:3600/blog/$id'));
    if (response.statusCode == 200) {
      var article = Blog.fromJson(json.decode(response.body));
      print(article);
      return article;
    } else {
      ;
      throw Exception('Failed to delete Blog');
    }
  }

  Future<Blog> getArticle(String id) async {
    final response =
        await http.get(Uri.parse('http://192.168.101.161:3600/blog/$id'));
    if (response.statusCode == 200) {
      var article = Blog.fromJson(json.decode(response.body));
      print(article);
      return article;
    } else {
      throw Exception('Failed to delete Medicine');
    }
  }

  Future<List<Blog>> fetchArticles() async {
    final response =
        await http.get(Uri.parse('http://192.168.101.161:3600/blog'));

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      var articles = parsed.map<Blog>((e) => Blog.fromJson(e)).toList();
      print(articles);
      return articles;
    } else {
      throw Exception('Failed to load Articles');
    }
  }
}
