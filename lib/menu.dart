import 'package:flutter/material.dart';
import 'package:hackaton_front/routes/add_bot.dart';

class Menu {
  static final Menu _singleton = Menu._internal();

  factory Menu() {
    return _singleton;
  }

  Drawer getMainDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
              title: Text("Add bot"),
              trailing: Icon(Icons.add),
              onTap: () => Navigator.popAndPushNamed(context, AddBot.route)),
        ],
      ),
    );
  }

  AppBar getMainAppBar() {
    return AppBar(
      title: Text('First Screen'),
      actions: <Widget>[
        // action button
        IconButton(
          icon: Icon(choices[0].icon),
          onPressed: () {
//              _select(choices[0]);
          },
        ),

        PopupMenuButton<Choice>(
//            onSelected: _select,
          itemBuilder: (BuildContext context) {
            return choices.skip(2).map((Choice choice) {
              return PopupMenuItem<Choice>(
                value: choice,
                child: Text(choice.title),
              );
            }).toList();
          },
        ),
      ],
    );
  }

  Menu._internal();
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
];
