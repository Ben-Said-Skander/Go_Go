import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pfa_application_1/core/constants/link_api.dart';

import '../models/post.dart';

class PostController extends GetxController {
  var PostsXList = List<Post>.empty().obs;
  var isLoading = true.obs;

  Future<Post> createPost(String fullname, String carModel, String destination) async {
    final response = await http.post(Uri.parse('${LinkApi.post}'),
        headers: {"Content-Type": "Application/json"},
        body: jsonEncode(<String, String>{
          'fullname': fullname,
          'carModel': carModel,
          'destination': destination
        }));
    if (response.statusCode == 201) {
      var post = Post.fromJson(json.decode(response.body));
      print(Post);
      return post;
    } else {
      throw Exception('Post loading failed');
    }
  }

  Future<Post> deletePost(String id) async {
    final response = await http.delete(Uri.parse('${LinkApi.post}/$id'));
    if (response.statusCode == 200) {
      var post = Post.fromJson(json.decode(response.body));
      print(Post);
      return post;
    } else {
      ;
      throw Exception('Failed to delete Post');
    }
  }

  Future<List<Post>> fetchPosts() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('${LinkApi.post}'));

      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
        var Posts = parsed.map<Post>((e) => Post.fromJson(e)).toList();
        print(Posts);
        PostsXList.assignAll(Posts);

        return PostsXList;
      } else {
        throw Exception('Failed to load Posts');
      }
    } finally {
      isLoading(false);
    }
  }

  Future<Post> getPost(String id) async {
    final response =
        await http.get(Uri.parse('${LinkApi.post}/$id'));
    if (response.statusCode == 200) {
      var post = Post.fromJson(json.decode(response.body));
      print(post);
      return post;
    } else {
      throw Exception('Failed to load Medicine');
    }
  }

}
