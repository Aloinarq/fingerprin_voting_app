import 'package:fingerprin_voting_app/providers/poll_provider.dart';
import 'package:fingerprin_voting_app/widgets/sidebar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

import 'details_screen.dart';

class CandidatesScreen extends StatefulWidget {
  String actualID;
  CandidatesScreen({Key? key, required this.actualID}) : super(key: key);

  @override
  _CandidatesScreenState createState() => _CandidatesScreenState(actualID);
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

class _CandidatesScreenState extends State<CandidatesScreen> {
  String actualID;
  _CandidatesScreenState(this.actualID);

  @override
  Widget build(BuildContext context) {
    return Sidebar(
        title: 'Candidates Screen',
        body: Consumer<PollProvider>(builder:
            (BuildContext context, PollProvider provider, Widget? child) {
          return Container(
            height: double.infinity,
            margin: const EdgeInsets.all(24.0),
            alignment: Alignment.center,
            child: ListView.builder(
                itemCount: provider.getPoll(actualID).candidateList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () => setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                      actualID: provider.getPoll(actualID).id,
                                      index: index)));
                        }),
                        child: Container(
                          width: 350,
                          height: 30,
                          decoration: myBoxDecoration(),
                          child: Center(
                            child: Text(
                              provider
                                  .getPoll(actualID)
                                  .candidateList[index]
                                  .fullName,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      )
                    ],
                  );
                }),
          );
        }));
  }
}
