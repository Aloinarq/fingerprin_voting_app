import 'package:cloud_firestore/cloud_firestore.dart';


class Database {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  var db = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');


  Future<void> addUser(String fullName, String address, String cnp) async {
    return users.add({
      "address" : address,
      "cnp" : cnp,
      "fullName" : fullName
    }).then((value) => print("User added"))
      .catchError((onError) => print(onError.toString()));
  }


}