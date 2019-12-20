import 'package:flutter/material.dart';
import 'package:hackaton_front/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotsPage extends StatefulWidget {
  static const route = "/bots";

  @override
  _BotsPageState createState() => _BotsPageState();
}

class _BotsPageState extends State<BotsPage> {
  List<Widget> bots;

  @override
  void initState() {
    super.initState();
  }

  void init() async {
    var names = await Services().getBots();

    bots = names
        .map((e) => ListTile(
              title: Text(e),
              trailing: Icon(FontAwesomeIcons.robot),
            ))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var main = bots == null
        ? ListView(children: bots)
        : Container(child: CircularProgressIndicator());

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Bot"),
      ),
      body: Center(
        child: Scrollbar(
          child: FractionallySizedBox(
              widthFactor: 0.9, heightFactor: 0.9, child: main),
        ),
      ),
    );
  }
}
