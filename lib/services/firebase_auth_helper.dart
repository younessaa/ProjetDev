import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper {
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  static Future<UserCredential> createAccount(
      String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }
}