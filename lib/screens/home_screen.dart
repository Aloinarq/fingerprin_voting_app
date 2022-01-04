import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fingerprin_voting_app/providers/poll_provider.dart';
import 'package:fingerprin_voting_app/screens/candidates_screen.dart';
import 'package:fingerprin_voting_app/widgets/sidebar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    color: Colors.lightBlueAccent,
    border: Border.all(width: 0.5),
    borderRadius: const BorderRadius.all(
        Radius.circular(5.0) //                 <--- border radius here
        ),
  );
}

class _HomeScreenState extends State<HomeScreen> {
  CollectionReference polls = FirebaseFirestore.instance.collection('/polls');

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Sidebar(
          title: 'Polls Screen',
          body: Consumer<PollProvider>(builder:
              (BuildContext context, PollProvider provider, Widget? child) {
            provider.loadPollList();
            return Container(
              height: double.infinity,
              margin: const EdgeInsets.all(24.0),
              alignment: Alignment.center,
              child: ListView.builder(
                  itemCount: provider.pollList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () => setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CandidatesScreen(
                                        actualID:
                                            provider.pollList[index].id)));
                          }),
                          child: Container(
                            width: 350,
                            height: 30,
                            decoration: myBoxDecoration(),
                            child: Center(
                              child: Text(
                                provider.pollList[index].id,
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 35)
                      ],
                    );
                  }),
            );
          })),
    );
  }
}
