import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fingerprin_voting_app/models/candidates_model.dart';

class Poll {
  String id = "";
  String type = "";
  String description = "";
  List<Candidate> candidateList = [];

  Poll(this.type, this.description, this.candidateList, this.id);

  Poll.fromSnapshot(DocumentSnapshot doc) {
    id = doc.id;
    type = doc.get('type');
    description = doc.get('description');
    print("==================ID=$id");
    var candidateRef = FirebaseFirestore.instance
        .collection('polls')
        .doc(id)
        .collection('candidates');
    candidateRef
        .snapshots()
        .map((list) =>
            list.docs.map((doc) => Candidate.fromSnapshot(doc)).toList())
        .listen((event) {
      candidateList = event;
    });
  }
}
