import 'package:flutter/material.dart';
import 'package:hackaton_front/model.dart';

import '../services.dart';

class AddBot extends StatefulWidget {
  static const route = "/create_bot";

  @override
  _AddBotState createState() => _AddBotState();
}

class _AddBotState extends State<AddBot> {
  final _nameController = TextEditingController();
  final _sourceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _failedAsync = false;

  String _validatePassword(String password) {
    if (password.length < 3) {
      return 'Password must be at least 3 characters';
    }

    if (_failedAsync) {
      // disable message until after next async call
      _failedAsync = false;
      return 'Incorrect password';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    var children = [
      Text(
        'Add new Bot',
        style: TextStyle(fontSize: 20),
      ),
      TextFormField(
          controller: _nameController,
          maxLength: 30,
          maxLines: 1,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(labelText: "Name")),
      Container(
        decoration: BoxDecoration(border: Border.all()),
        child: TextFormField(
            style: TextStyle(fontFamily: "monospace"),
            controller: _sourceController,
            maxLength: null,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
              labelText: "Source",
            )),
      ),
      RaisedButton.icon(
          onPressed: () async {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();

              try {
                await Services()
                    .addBot(Bot(_nameController.text, _sourceController.text));
              } catch (e) {
                _failedAsync = true;

                return;
              }

              Navigator.pop(context);
            }
          },
          icon: Icon(Icons.add),
          label: Text('Add Bot'))
    ].toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Bot"),
      ),
      body: Center(
        child: Form(
          autovalidate: true,
          key: _formKey,
          child: Scrollbar(
            child: FractionallySizedBox(
              widthFactor: 0.9,
              heightFactor: 0.9,
              child: ListView(
//              mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
