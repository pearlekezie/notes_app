import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/firebase/sign_up.dart';

class AuthService{
  // Initialize Firebase Auth
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Register a new user
  Future<User?> registerUser(String email, String password) async {
    try {
      final UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // If registration fails, display an error message
      print("Registration failed: ${e.message}");
      
    }
    return null; 
  }

  // Login a user
  Future<User?> loginUser(String email, String password) async {
    try {
      final UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print("Log-in failed: ${e.message}");
      return null;
    }
  }

  // Check if a user is signed in or not
  void checkCurrentUser() {
    User? currentUser = auth.currentUser; // Check if user is signed in
    if (currentUser != null) {
      // User is signed in, navigate or update UI
      print("User is signed in: ${currentUser.email}");
      // Example: Navigator.pushReplacement to another screen
    } else {
      print("No user is signed in");
    }
  }

  // Sign out a user
  Future<void> signOut(BuildContext context) async {
    try {
      await auth.signOut();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignUpPage()),
      );
    } catch (e) {
      print('Error signing out: $e');
      rethrow;
    }
  }
 
  

}

