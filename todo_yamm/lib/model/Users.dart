import 'package:flutter/material.dart';

import 'UserModel.dart';

class Users {
  static List<UserModel> UsersList = [
    UserModel(username: "omar", password: "xx123"),
  ];

  void addUser(UserModel user) {
    UsersList.add(user);
  }

  static bool verifyUser(UserModel user) {
    return UsersList.any(((element) => element.password== user.password && element.username == user.username));
  }
}
