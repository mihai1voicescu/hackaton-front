import 'package:flutter/material.dart';

import '../menu.dart';

class MainScreen extends StatelessWidget {
  static const route = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu().getMainDrawer(context),
      appBar: Menu().getMainAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Welcome to Yoogle'),
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/second');
              },
            ),
            RaisedButton(
              child: Text('Dummy'),
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/dummy');
              },
            ),
          ],
        ),
      ),
    );
  }
}
