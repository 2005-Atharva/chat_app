import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //instance of auth & firestore
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  //Sign In
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      //save user information if the user dosen't exist
      // _firestore.collection("Users").doc(userCredential.user!.uid).set(
      //   {
      //     'uid': userCredential.user!.uid,
      //     'email': email,
      //   },
      // );

      return userCredential;
    } on FirebaseException catch (e) {
      throw Exception(e.code);
    }
  }

  //Sign Up
  Future<UserCredential> signUpWithEmailPassword(String email, password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      //save user information in document
      _firestore.collection("Users").doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email': email,
        },
      );

      return userCredential;
    } on FirebaseException catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }

  //Sing Out
  Future<void> signOut() async {
    return await _auth.signOut();
  }

  // forget password

  Future<void> forgetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}
