import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:hackaton_front/model.dart';
import 'package:hackaton_front/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotsPage extends StatefulWidget {
  static const route = "/bots";

  @override
  _BotsPageState createState() => _BotsPageState();
}

class _BotsPageState extends State<BotsPage> {
  List<Widget> bots;
  final _controller = TextEditingController();

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
              onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // return object of type Dialog
                    return AlertDialog(
                      title: new Text("Name of the Stock"),
                      content: Container(
                        child: TextField(
                          controller: _controller,
                        ),
                      ),
                      actions: <Widget>[
                        // usually buttons at the bottom of the dialog
                        new FlatButton(
                          child: new Text("Close"),
                          onPressed: () async {
                            var symbol = _controller.text;
                            Navigator.of(context).pop();

                            try {
                              Services().runSimulation(Bot(e, symbol), symbol);
                            } catch (e) {
                              print(e);
                            }
                          },
                        ),
                      ],
                    );
                  }),
            ))
        .toList();

    setState(() {});
  }

//
//  showPickerDialog(BuildContext context) {
//    new Picker(
//
//        adapter: PickerDataAdapter<String>(
//            pickerdata: new JsonDecoder().convert(PickerData)),
//        hideHeader: true,
//        title: new Text("Select Data"),
//        onConfirm: (Picker picker, List value) {
//          print(value.toString());
//          print(picker.getSelectedValues());
//        }).showDialog(context);
//  }

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
