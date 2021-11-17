import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future registerEmailPassword(String email, String password) async {
    bool success=false;
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      success=true;
      return success;
    } catch(e) {
      print(e.toString());
      return false;
    }
  }
}