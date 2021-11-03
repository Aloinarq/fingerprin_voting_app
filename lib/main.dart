import 'package:fingerprin_voting_app/screens/home_screen.dart';
import 'package:fingerprin_voting_app/screens/login_screen.dart';
import 'package:fingerprin_voting_app/screens/register_screen.dart';
import 'package:fingerprin_voting_app/screens/wrapper.dart';
import 'package:flutter/material.dart';

void main() => runApp(FingerVoteApp());

class FingerVoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Wrapper(),
      // initialRoute: "/",
      // routes: {
      //   "/" : (context) => const Scaffold(
      //     body: LoginScreen(),
      //   ),
      //   '/home' : (context) => Scaffold(
      //     appBar: AppBar(
      //       title: const Text("Homescreen"),
      //     ),
      //     body: const HomeScreen(),
      //   ),
      //   '/registerscreen' : (context) => Scaffold(
      //     appBar: AppBar(
      //       title: const Text("Register screen"),
      //     ),
      //     body: const RegisterScreen(),
      //   )
      // },
    );
  }
}