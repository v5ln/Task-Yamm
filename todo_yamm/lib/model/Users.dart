import 'package:flutter/material.dart';

import 'UserModel.dart';

class Users {
  static List<UserModel> UsersList = [
    UserModel(username: "1", password: "1"),
  ];

  static bool verifyUser(UserModel user) {
    return UsersList.any(((element) =>
        element.password == user.password &&
        element.username == user.username));
  }

  static bool add(UserModel user) {
    if (!UsersList.any(((element) => element.username == user.username))) {
      UsersList.add(user);
      return true;
    }
    return false;
  }
}
