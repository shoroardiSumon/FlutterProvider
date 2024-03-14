import 'package:flutter/material.dart';
import 'package:flutterprovider/models/post_model.dart';
import 'package:flutterprovider/services/post_service.dart';

class PostProvider extends ChangeNotifier{
  final PostService _postService = PostService();

  List<PostModel> _post = [];
  bool _isLoading = false;
  String _error = '';

  List<PostModel> get allPosts => _post;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> fetchPosts() async {
    _isLoading = true;
    _error = '';

    try {
      _post = await _postService.fetchPosts();
      _isLoading = false;
    } catch (e) {
      _error = e.toString();
    } finally{
      _isLoading = false;
    }
    notifyListeners();
  }
}