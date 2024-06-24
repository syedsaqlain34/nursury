import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/User_Model.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signUp(UserAuthModel user) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: user.email.toString().trim(),
        password: user.password.toString().trim(),
      );

      await _firestore
          .collection('SignUp')
          .doc(userCredential.user!.uid)
          .set(user.toMap());
      print("User signed up successfully: ${userCredential.user!.uid}");
      return userCredential.user;
    } catch (e) {
      print("Sign up failed: $e");
      return null;
    }
  }

  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Login failed: $e");
      return null;
    }
  }
}
