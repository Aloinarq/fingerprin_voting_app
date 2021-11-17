import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
    onWillPop: () async { return false; },
    child: Scaffold(
        body: Container(
          height: double.infinity,
          margin: const EdgeInsets.all(24.0),
          child: const Text("At the moment just a test :)"),
    ),
    ),
    );
  }
}
