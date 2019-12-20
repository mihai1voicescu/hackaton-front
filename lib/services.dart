import 'dart:convert';

import 'package:hackaton_front/fake.dart';
import 'package:hackaton_front/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services {
  static final Services _singleton = Services._internal();

  bool loggedIn = false, _started = false;
  SharedPreferences _sharedPreferences;
  User user;

  Future<void> startup() async {
    if (_started) return;

    _sharedPreferences = await SharedPreferences.getInstance();

    var userS = _sharedPreferences.getString("user");

    if (userS != null) {
      user = User.fromJson(jsonDecode(userS));
      loggedIn = true;
    }
  }

  factory Services() {
    return _singleton;
  }

  User getUser() {
    return user;
  }

  Future<bool> doLogin(String username, String password) async {
    assert(username == "johnd");
    assert(password == "pass");
    user = User(firstName: "John", name: "Doe");

    _sharedPreferences.setString("user", jsonEncode(user));
    loggedIn = true;

    return true;
  }

  Services._internal() {}
}
