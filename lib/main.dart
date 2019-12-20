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
import 'package:hackaton_front/routes/main.dart';

import 'routes/second.dart';

void main() {
  runApp(MaterialApp(
    title: 'Named Routes Demo',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => MyApp(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/second': (context) => SecondScreen(),
      '/dummy': (context) => MyHomePage(),
//      '/dummy': (context) => Dummy(),
    },
  ));
}
