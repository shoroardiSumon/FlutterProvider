import 'package:flutter/material.dart';
import 'package:flutterprovider/models/user_model.dart';
import 'package:flutterprovider/services/user_service.dart';

class UserProvider extends ChangeNotifier{
  List<UserModel> _users = [];
  final UserService _userService = UserService();

  bool isLoading = false;

  List<UserModel> get allusers => _users;

  Future<void> fetchUsers() async {
    try {
      isLoading = true;
      _users = await _userService.fetchUsers();
      isLoading = false;
    } catch (e) {
      isLoading = false;
      throw Exception('Error: $e');
    }
    notifyListeners();
  }
  

}