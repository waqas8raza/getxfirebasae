import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  TextEditingController emailc = TextEditingController();
  TextEditingController passwordc = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> createAccount(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Fluttertoast.showToast(
        msg: "Account created successfully",
        backgroundColor: Colors.green[400],
      );
    } on FirebaseAuthException catch (ex) {
      if (ex.code == "weak-password") {
        Fluttertoast.showToast(
          msg: "Weak Password",
          backgroundColor: Colors.orange[400],
        );
        print("Weak Password");
      } else if (ex.code == "email-already-in-use") {
        Fluttertoast.showToast(
          msg: "Email Already exists",
          backgroundColor: Colors.red[400],
        );
        print("Email Already exists. Please log in.");
      } else {
        Fluttertoast.showToast(
          msg: "An error occurred. Please try again.",
          backgroundColor: Colors.red[400],
        );
        print("An error occurred: $ex");
      }
    } catch (ex) {
      Fluttertoast.showToast(
        msg: "An error occurred. Please try again.",
        backgroundColor: Colors.red[400],
      );
      print("An error occurred: $ex");
    }
  }
}
