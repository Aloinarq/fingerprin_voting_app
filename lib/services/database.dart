import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  var db = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference polls = FirebaseFirestore.instance.collection('votes');

  Future<void> addUser(String fullName, String address, String cnp) async {
    return users
        .add({"address": address, "cnp": cnp, "fullName": fullName})
        .then((value) => print("User added"))
        .catchError((onError) => print(onError.toString()));
  }

  Future<void> addVote(String fullName) async {
    return polls
        .add({"fullName": fullName})
        .then((value) => print("vote added"))
        .catchError((onError) => print(onError.toString()));
  }
}
