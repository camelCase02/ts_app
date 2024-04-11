import 'package:amazon_clone/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      address: '',
      email: '',
      id: '',
      token: '',
      password: '',
      name: '',
      type: '',
      cart: [],);

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
  }
   void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
