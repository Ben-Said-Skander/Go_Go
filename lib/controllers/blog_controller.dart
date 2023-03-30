// ignore_for_file: unused_import, unused_local_variable

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
    final response = await http.get(Uri.parse('http://192.168.1.14:3600/blog'));

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      var articles = parsed.map<Blog>((e) => Blog.fromJson(e)).toList();
      print(articles);
      return articles;
    } else {
      throw Exception('Failed to load Articles');
    }
  }

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
/*
  Future<Picture> getImage(String id) async {
    final response =
        await http.get(Uri.parse("http://192.168.1.14:3600/image/${id}"));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Picture.fromJson(json);
    } else {
      throw Exception('Failed to get image by id: $id');
    }
  }
}*/
Future<Uint8List> getImage(String id) async {
  final response = await http.get(Uri.parse('http://192.168.1.14:3600/image/${id}'));
  if (response.statusCode == 200) {
    return response.bodyBytes;
  } else {
    throw Exception('Failed to load image');
  }
}

/*
Future<List<Picture>> getAllImages() async {
  final response = await http.get(Uri.parse('http://192.168.1.14:3600/image'));
  if (response.statusCode == 200) {
    List<dynamic> imageList = jsonDecode(response.body);
    List<Picture> images = imageList.map((e) => Picture.fromJson(e)).toList();
    return images;
  } else {
    throw Exception('Failed to load images');
  }
}*/
Future<List<dynamic>> fetchImages() async {
    final response = await http.get(Uri.parse('http://your-backend-url/images'));
    if (response.statusCode == 200) {
      // Convert the response body to a list of images
      final List<dynamic> imagesJson = json.decode(response.body);
      return imagesJson;
    } else {
      throw Exception('Failed to load images');
    }
  }
}