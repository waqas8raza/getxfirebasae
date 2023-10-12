import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signupt extends StatefulWidget {
  const Signupt({super.key});

  @override
  State<Signupt> createState() => _SignuptState();
}

final TextEditingController emailc = TextEditingController();
final TextEditingController passwordc = TextEditingController();

class _SignuptState extends State<Signupt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          TextFormField(
            controller: emailc,
          ),
          TextFormField(
            controller: passwordc,
          ),
          ElevatedButton(
              onPressed: () {
                signip(emailc.text, passwordc.text);
              },
              child: const Text('Create'))
        ],
      )),
    );
  }

  Future signip(String email, String password) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }
}
