import 'package:flutter/material.dart';

import 'home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _username = "";
  String _email = "";
  String _password = "";
  String _passwordAgain = "";
  bool _obscureText = true;

  bool _validateEmail(String value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
    RegExp regExp = new RegExp(pattern);
    return (regExp.hasMatch(value));
  }

  bool _validatePassword(String value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[0-9]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return (regExp.hasMatch(value));
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register screen"),
      ),
      key: Key('RegisterScreen'),
      body: Container(
        height: double.infinity,
        margin: EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Username",
                  style: Theme.of(context).textTheme.headline5),
              SizedBox(height: 16),
              Text("Type in your desired username",
                  style: Theme.of(context).textTheme.subtitle2),
              SizedBox(height: 8),
              TextField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  onChanged: (value) {
                    setState(() {
                      _username = value;
                    });
                  }),
              SizedBox(height: 16),
              Text("Email here",
                  style: Theme.of(context).textTheme.subtitle2),
              SizedBox(height: 8),
              TextField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  }),
              SizedBox(height: 16),
              Text("Create password",
                  style: Theme.of(context).textTheme.subtitle2),
              SizedBox(height: 8),
              TextField(
                obscureText: _obscureText,
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(height: 16),
              Text("Confirm password",
                  style: Theme.of(context).textTheme.subtitle2),
              SizedBox(height: 8),
              TextField(
                obscureText: _obscureText,
                onChanged: (value) {
                  setState(() {
                    _passwordAgain = value;
                  });
                },
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              TextButton(
                onPressed: _togglePasswordVisibility,
                child: Row(children: [
                  Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                  SizedBox(width: 8),
                  Text(_obscureText
                      ? "Show password"
                      : "Hide password")
                ]),
              ),
              Center(
                  child: SizedBox(
                    height: 56,
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: (_username.isEmpty == true || _email.isEmpty == true || _validateEmail(_email) == false || !(_password == _passwordAgain) ||
                          _validatePassword(_password) == false)
                          ? null
                          : () async {
                        bool _isCallSuccessful = true;
                        if (_isCallSuccessful == true) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                          final snackBar = SnackBar(
                            backgroundColor: Colors.blueAccent,
                            content: Row(
                              children: [
                                Icon(Icons.check_circle_rounded),
                                SizedBox(width: 8),
                                Expanded(
                                    child: Text("Success",
                                        style: Theme.of(context).textTheme.bodyText1)),
                              ],
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Failure"),
                              );
                            },
                          );
                        }
                      },
                      child: Text(
                        "Register",
                      ),
                    ),
                  ),
                ),
              Container(
                alignment: Alignment.center,
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Already have an account? Log in!")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
