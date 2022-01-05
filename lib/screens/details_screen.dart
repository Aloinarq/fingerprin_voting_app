import 'dart:io';

import 'package:fingerprin_voting_app/providers/poll_provider.dart';
import 'package:fingerprin_voting_app/services/auth.dart';
import 'package:fingerprin_voting_app/services/database.dart';
import 'package:fingerprin_voting_app/widgets/sidebar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_screen.dart';

class DetailsScreen extends StatefulWidget {
  String actualID;

  int index;
  DetailsScreen({Key? key, required this.actualID, required int this.index})
      : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState(actualID, index);
}

class _DetailsScreenState extends State<DetailsScreen> {
  String actualID;
  int index;
  bool _isButtonDisabled = false;
  _DetailsScreenState(this.actualID, this.index);

  @override
  Widget build(BuildContext context) {
    print(actualID);
    return FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return Sidebar(
            title: 'Details Screen',
            body: Consumer<PollProvider>(builder:
                (BuildContext context, PollProvider provider, Widget? child) {
              return Container(
                  margin: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Container(
                        width: 341,
                        height: 500,
                        child: Text(
                          provider
                              .getPoll(actualID)
                              .candidateList[index]
                              .description,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: 200,
                        height: 35,
                        child: ElevatedButton(
                            onPressed: _isButtonDisabled
                                ? null
                                : () async {
                                    final isAuthenticated =
                                        await LocalAuthApi.authenticate();
                                    if (isAuthenticated) {
                                      setState(() {
                                        Database().addVote(provider
                                            .getPoll(actualID)
                                            .candidateList[index]
                                            .fullName);
                                        _isButtonDisabled = true;
                                      });
                                    }
                                    sleep(Duration(seconds: 3));
                                    AuthService().mySignOut();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen()));
                                  },
                            child: Text(
                                _isButtonDisabled ? "Vote saved" : "Vote")),
                      )
                    ],
                  ));
            }));
      },
    );
  }
}
