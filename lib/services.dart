import 'package:hackaton_front/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services {
  static final Services _singleton = Services._internal();

  bool loggedIn = false;
  SharedPreferences _sharedPreferences;
  User user;

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
    loggedIn = true;

    return true;
  }

  Services._internal() {
    SharedPreferences.getInstance().then((prefs) {
      _sharedPreferences = prefs;

      return;
    });
  }
}
