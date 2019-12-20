import 'package:flutter/material.dart';
import 'package:hackaton_front/routes/main.dart';
import 'package:hackaton_front/services.dart';

class Login extends StatefulWidget {
  static const route = "/login";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
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

  String _validateUsername(String password) {
    if (password.length < 3) {
      return 'Username must be at least 3 characters';
    }

    if (_failedAsync) {
      // disable message until after next async call
      _failedAsync = false;
      return 'Incorrect username';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Container(
          width: 300,
          child: Form(
            autovalidate: true,
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Login',
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                    controller: _usernameController,
                    maxLength: 30,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    validator: _validateUsername,
                    decoration: InputDecoration(labelText: "Username")),
                TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    maxLength: 30,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    validator: _validatePassword,
                    decoration: InputDecoration(labelText: "Password")),
                RaisedButton(
                  onPressed: () async {
//                    try {
//                      await Services().doLogin(
//                          _usernameController.text, _passwordController.text);
//                    } catch (e) {
//                      print("ASD");
//                      print(e);
//                    }

                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();

                      try {
                        await Services().doLogin(
                            _usernameController.text, _passwordController.text);
                      } catch (e) {
                        _failedAsync = true;

                        return;
                      }

                      Navigator.pushNamed(context, MainScreen.route);
                    }
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
