import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailc = TextEditingController();
  TextEditingController passwordc = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signinAccount(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Fluttertoast.showToast(
        msg: "Account created successfully",
        backgroundColor: Colors.green[400],
      );
    } on FirebaseAuthException catch (ex) {
      if (ex.code == "wrong-password") {
        Fluttertoast.showToast(
          msg: "Wrong Password",
          backgroundColor: Colors.orange[400],
        );
      } else if (ex.code == "user-not-found") {
        Fluttertoast.showToast(
          msg: "User Not Found",
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
