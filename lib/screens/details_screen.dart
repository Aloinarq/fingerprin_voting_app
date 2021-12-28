import 'package:fingerprin_voting_app/providers/poll_provider.dart';
import 'package:fingerprin_voting_app/widgets/sidebar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  _DetailsScreenState(this.actualID, this.index);

  @override
  Widget build(BuildContext context) {
    print(actualID);
    return Sidebar(
        title: 'Details Screen',
        body: Consumer<PollProvider>(builder:
            (BuildContext context, PollProvider provider, Widget? child) {
          return Container(
              margin: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Container(
                    width: 350,
                    height: 400,
                    child: Text(
                      provider
                          .getPoll(actualID)
                          .candidateList[index]
                          .description,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  )
                ],
              ));
        }));
  }
}
