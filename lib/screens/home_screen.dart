import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fingerprin_voting_app/services/database.dart';
import 'package:fingerprin_voting_app/widgets/sidebar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //List list = Firestore().getUsers() as List;

  @override
  Widget build(BuildContext context) {
    return Sidebar(
      title: 'Polls Screen',
      body: Container(
        height: double.infinity,
        margin: EdgeInsets.all(24.0),
        alignment: Alignment.center,
        child: Text(""),
        )
      );
  }
}
