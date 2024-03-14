import 'dart:io';

import 'package:flutterprovider/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostService {

  Future<List<PostModel>> fetchPosts() async {
    try {
      String url = "https://jsonplaceholder.typicode.com/posts";
      
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<PostModel> fetchedPosts = [];

        fetchedPosts = postModelFromJson(response.body);

        return fetchedPosts;
      } else {
        throw Exception('Failed to load data!');
      }
    } on SocketException {
      throw Exception("No Internet Connection!");
    } catch (e) {
      throw Exception(e);
    }
  }

}