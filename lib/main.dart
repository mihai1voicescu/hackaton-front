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
import 'package:hackaton_front/routes/bots.dart';
import 'package:hackaton_front/routes/dumy.dart';
import 'package:hackaton_front/routes/ipython.dart';
import 'package:hackaton_front/routes/login.dart';
import 'package:hackaton_front/routes/main.dart';
import 'package:hackaton_front/services.dart';

import 'package:font_awesome_flutter/icon_data.dart';

import 'routes/add_bot.dart';
import 'routes/second.dart';
import 'routes/stock.dart';
import 'routes/simulation.dart';

void main() {
//  var initialRoute = Services().loggedIn ? MainScreen.route : Login.route;

  var theme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Montserrat',
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.black)),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.orange,
      ),
    ),
  );
  print("startup");
  WidgetsFlutterBinding.ensureInitialized();
  Services()
      .startup()
      .then((v) => runApp(MaterialApp(
            title: 'Yoogle',
            // Start the app with the "/" named route. In this case, the app starts
            // on the FirstScreen widget.
            initialRoute: MainScreen.route,
            theme: theme,
            routes: {
              // When navigating to the "/" route, build the FirstScreen widget.
              MainScreen.route: (context) => MainScreen(),
              // When navigating to the "/second" route, build the SecondScreen widget.
              SecondScreen.route: (context) => SecondScreen(),
              MyHomePage.route: (context) => MyHomePage(),
              Login.route: (context) => Login(),
              AddBot.route: (context) => AddBot(),
              IPython.route: (context) => IPython(),
              Stock.route: (context) => Stock(),
              BotsPage.route: (context) => BotsPage(),
              Sim.route: (context) => Sim(),
//      '/dummy': (context) => Dummy(),
            },
          )))
      .catchError((err) => print(err));
}
