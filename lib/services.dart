import 'package:hackaton_front/model.dart';

class Services {
  static final Services _singleton = Services._internal();

  factory Services() {
    return _singleton;
  }

  User getUser() {
    return User(firstName: "John", name: "Doe");
  }

  Services._internal();
}
