import 'package:flutter/material.dart';
//import 'package:search_widget/search_widget.dart';

import '../services.dart';
import 'main.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Bot"),
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.9,
          heightFactor: 0.9,
          child: Form(
            autovalidate: true,
            key: _formKey,
            child: ListView(
//              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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
                      controller: _sourceController,
                      maxLength: null,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(labelText: "Source")),
                ),
//                SearchWidget<String>(
//                  dataList: Services().getAvailableStocks(),
//                  hideSearchBoxWhenItemSelected: true,
//                  listContainerHeight: MediaQuery.of(context).size.height / 4,
//                  queryBuilder: (String query, List<String> list) {
//                    return list
//                        .where((String item) =>
//                            item.toLowerCase().contains(query.toLowerCase()))
//                        .toList();
//                  },
////                  popupListItemBuilder: (String item) {
////                    return PopupListItemWidget(item);
////                  },
////                  selectedItemBuilder: (String selectedItem, VoidCallback deleteSelectedItem) {
////                    return SelectedItemWidget(selectedItem, deleteSelectedItem);
////                  },
////                  // widget customization
//////                  noItemsFoundWidget: NoItemsFound(),
////                  textFieldBuilder: (TextEditingController controller, FocusNode focusNode) {
////                    return MyTextField(controller, focusNode);
////                  },
//                ),

                RaisedButton.icon(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();

                        try {
                          await Services().putBot();
                        } catch (e) {
                          _failedAsync = true;

                          return;
                        }

                        Navigator.pop(context);
                      }
                    },
                    icon: Icon(Icons.add),
                    label: Text('Add Bot'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
