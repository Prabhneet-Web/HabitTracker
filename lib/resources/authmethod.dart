import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //SignUpUser
  Future<String> signUpUser(
      {required String fullName,
      required String email,
      required String password}) async {
    String result = "Some error occured";
    try {
      if (fullName.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
        //Register the user
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        //Add user to the database
        await _firestore.collection("User").doc(credential.user!.uid).set({
          'fullname': fullName,
          'uid': credential.user!.uid,
          'email': email,
        });
        result = "Success";
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == "invalid-email") {
        result = "Enter a valid e-mail";
      } else if (error.code == "user-disabled") {
        result = "The email is already disabled";
      } else if (error.code == "user-not-found") {
        result = "User not found. Enter a valid e-mail";
      } else if (error.code == "wrong-password") {
        result = "Enter the correct password.";
      } else if (error.code == "email-already-in-use") {
        result = "Email already registered";
      } else if (error.code == "weak-password") {
        result = "Password should be at least 6 characters";
      } else {
        result = "Try Again";
      }
    } catch (error) {
      result = error.toString();
    }
    return result;
  }

  //LoggingIn User
  Future<String> loginUser(
      {required String email, required String password}) async {
    String result = "Some error occured";

    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        result = "success";
      } else {
        result = "Please enter all the fields";
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == "user-not-found") {
        result = "User not found";
      } else if (error.code == "wrong-password") {
        result = "Wrong Password";
      } else {
        result = "Try Again";
      }
    } catch (error) {
      result = error.toString();
    }
    return result;
  }
}
