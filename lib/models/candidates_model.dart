import 'package:cloud_firestore/cloud_firestore.dart';

class Candidate {
  String id = "";
  String fullName = "";
  int age = 0;
  String description = "";

  Candidate({
    required this.fullName,
    required this.description,
    required this.age,
    required this.id,
  });

  Candidate.fromSnapshot(DocumentSnapshot doc) {
    id = doc.id;
    fullName = doc.get('fullName');
    age = doc.get('age');
    description = doc.get('description');
  }
}
