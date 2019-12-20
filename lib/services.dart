import 'dart:convert';

import 'package:hackaton_front/fake.dart';
import 'package:hackaton_front/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart';

class Services {
  static final Services _singleton = Services._internal();

  static const String _url = "127.0.0.1";

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

  List<String> getAvailableStocks() => ["APPL", "GOOG", "DOWJ"];

  Future<StockInfo> getStockInfo() async {
    return StockInfo.fromJson(jsonDecode(Fake().trade()));
  }

  Future<bool> doLogin(String username, String password) async {
    assert(username == "johnd");
    assert(password == "pass");
    user = User(firstName: "John", name: "Doe");

    _sharedPreferences.setString("user", jsonEncode(user));
    loggedIn = true;

    return true;
  }

  Future<void> addBot(Bot bot) async {
//    String url = 'https://jsonplaceholder.typicode.com/posts';
//    await get(url);
  }

  Future<bool> putBot() async {
    return true;
  }

  Services._internal() {}
}
