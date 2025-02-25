import 'dart:convert';

import 'package:hackaton_front/fake.dart';
import 'package:hackaton_front/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart';

class Services {
  static final Services _singleton = Services._internal();

  static const String _url = "http://127.0.0.1:6969";

  Prediction lastPrediction;

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

  Future<List<dynamic>> getBots() async {
    var res = await get(_url + "/bots");

    List<String> body = (jsonDecode(res.body) as List<dynamic>).cast<String>();

    return body;
  }

  Future<StockInfo> getStockInfo() async {
    var m = jsonDecode(Fake().trade());
    return StockInfo.fromJson(m);
  }

  Future<Prediction> runSimulation(Bot bot, String symbol) async {
    var res = await get(_url + "/bot/${bot.name}/predict?symbol=$symbol");
    print(res.body);
    print(jsonDecode(res.body));
    return Prediction.fromJson(jsonDecode(res.body));
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
    await post(_url + "/bot/" + bot.name, body: bot.code);

//    String url = 'https://jsonplaceholder.typicode.com/posts';
//    await get(url);
  }

  Future<bool> putBot() async {
    return true;
  }

  Services._internal() {}
}
