import 'package:asd/sidebar.dart';
import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

Future internet() async {
  try {
    final result = await InternetAddress.lookup('https://stackoverflow.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      // ignore: avoid_print
      print('connected');
      return true;
    }
  } on SocketException catch (_) {
    // ignore: avoid_print
    print('not connected');
    return false;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final String appTitle = 'Drawer Demo';
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    // ignore: unrelated_type_equality_checks
    if (true == internet()) {
      return MaterialApp(
          title: '',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const Sidebar(
            title: 'Flutter Demo with internet',
          ));
    } else {
      return MaterialApp(
          title: 'Flutter Demo without net',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const Sidebar(title: 'Flutter Demo without net'));
    }
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
