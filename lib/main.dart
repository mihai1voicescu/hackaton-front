//import 'package:flutter/material.dart';
//import 'routes/dumy.dart';
//
//import 'routes/main.dart';
//
//void main() {
//  runApp(MaterialApp(
//    title: 'Named Routes Demo',
//    // Start the app with the "/" named route. In this case, the app starts
//    // on the FirstScreen widget.
//    initialRoute: '/',
//    routes: {
//      // When navigating to the "/" route, build the FirstScreen widget.
//      '/': (context) => MyApp(),
//      // When navigating to the "/second" route, build the SecondScreen widget.
//      '/second': (context) => Dummy(),
//    },
//  ));
//}

import 'package:flutter/material.dart';
import 'package:hackaton_front/routes/dumy.dart';
import 'package:hackaton_front/routes/login.dart';
import 'package:hackaton_front/routes/main.dart';
import 'package:hackaton_front/services.dart';

import 'routes/second.dart';

void main() {
  var initialRoute = Services().loggedIn ? MainScreen.route : Login.route;

  print("startup");
  Services()
      .startup()
      .then((v) => runApp(MaterialApp(
            title: 'Named Routes Demo',
            // Start the app with the "/" named route. In this case, the app starts
            // on the FirstScreen widget.
            initialRoute: initialRoute,
            routes: {
              // When navigating to the "/" route, build the FirstScreen widget.
              MainScreen.route: (context) => MainScreen(),
              // When navigating to the "/second" route, build the SecondScreen widget.
              SecondScreen.route: (context) => SecondScreen(),
              MyHomePage.route: (context) => MyHomePage(),
              Login.route: (context) => Login(),
//      '/dummy': (context) => Dummy(),
            },
          )))
      .catchError((err) => print(err));
}
