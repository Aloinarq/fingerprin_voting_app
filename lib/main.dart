import 'package:fingerprin_voting_app/screens/home_screen.dart';
import 'package:fingerprin_voting_app/screens/login_screen.dart';
import 'package:fingerprin_voting_app/screens/register_screen.dart';
import 'package:fingerprin_voting_app/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FingerVoteApp());
}

class FingerVoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Wrapper(),
      initialRoute: "/",
      routes: {
        '/polls' : (context) => Scaffold(
          appBar: AppBar(
            title: const Text("Polls screen"),
          ),
          body: const HomeScreen(),
        ),
        '/registerscreen' : (context) => Scaffold(
          appBar: AppBar(
            title: const Text("Register screen"),
          ),
          body: const RegisterScreen(),
        )
      },
    );
  }
}