import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fingerprin_voting_app/models/poll_model.dart';
import 'package:flutter/cupertino.dart';

class PollProvider extends ChangeNotifier {
  var db = FirebaseFirestore.instance;

  List<Poll> _pollList = [];

  void loadPollList() {
    getPolls().listen((event) {
      _pollList = event;
      print("======================Length=${_pollList.length}");
    });
    notifyListeners();
  }

  List<Poll> get pollList => _pollList;

  Stream<List<Poll>> getPolls() {
    var ref = db.collection('polls');

    return ref
        .snapshots()
        .map((list) => list.docs.map((doc) => Poll.fromSnapshot(doc)).toList());
  }

  Poll getPoll(String actualID) {
    return pollList.firstWhere((element) => element.id == actualID);
  }
}
