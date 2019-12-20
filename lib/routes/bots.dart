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
    init();
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
        ? Container(child: CircularProgressIndicator())
        : ListView(children: bots);

    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text("My Bots"),
          trailing: Icon(FontAwesomeIcons.robot),
        ),
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
