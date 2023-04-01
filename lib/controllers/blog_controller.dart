import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pfa_application_1/models/image.dart';
import '../models/blog.dart';
import "../models/image.dart";

class BlogController extends GetxController {
  var articlesXList = List<Blog>.empty().obs;
  var isLoading = true.obs;
  @override
  void initState() {
    fetchArticles();
  }

  Future<Blog> createArticle(String title, String category, String body) async {
    final response = await http.post(Uri.parse('http://192.168.1.14:3600/blog'),
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
        await http.delete(Uri.parse('http://192.168.1.14:3600/blog/$id'));
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
        await http.get(Uri.parse('http://192.168.1.14:3600/blog/$id'));
    if (response.statusCode == 200) {
      var article = Blog.fromJson(json.decode(response.body));
      print(article);
      return article;
    } else {
      throw Exception('Failed to delete Medicine');
    }
  }

  Future<List<Blog>> fetchArticles() async {
    try {
      isLoading(true);
      final response =
          await http.get(Uri.parse('http://192.168.1.14:3600/blog'));

      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
        var articles = parsed.map<Blog>((e) => Blog.fromJson(e)).toList();
        print(articles);
        articlesXList.assignAll(articles);

        return articlesXList;
      } else {
        throw Exception('Failed to load Articles');
      }
    } finally {
      isLoading(false);
    }
  }

  /***************************************************************** */
  Future postPicture(File imageFile) async {
    final req = http.MultipartRequest(
        'POST', Uri.parse('http://192.168.1.14:3600/images'));
    req.files.add(await http.MultipartFile.fromPath('image', imageFile.path));
    var response = await req.send();

    if (response.statusCode == 200) {
      print('Image uploaded');
    } else {
      print('Upload failed');
    }
  }

  Future<Picture> getImage(String id) async {
    final response = await http.get(
      Uri.parse('http://192.168.1.14:3600/image/$id'),
      headers: {'Content-Type': 'application/octet-stream'},
      //  responseType: http.ResponseType.bytes
    );
    if (response.statusCode == 200) {
      final contentType = response.headers['content-type'];
      final bytes = response.bodyBytes;
      final base64String = base64.encode(bytes);
      return Picture(id: id, contentType: contentType!, data: bytes);
    } else {
      throw Exception('Failed to load image');
    }
  }

  Future<List<Picture>> getAllImages() async {
    final response =
        await http.get(Uri.parse('http://192.168.1.14:3600/image'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<Picture> images = [];
      for (var data in jsonData) {
        final id = data['id'];
        final contentType = data['contentType'];
        final bytes = base64.decode(data['data']);
        images.add(Picture(id: id, contentType: contentType, data: bytes));
      }
      return images;
    } else {
      throw Exception('Failed to load images');
    }
  }
}
