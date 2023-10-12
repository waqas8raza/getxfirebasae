import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Mytextfield extends StatelessWidget {
  final String text;
  final IconData icon;
  final TextEditingController controller;
  bool isobsecure;
  Mytextfield(
      {super.key,
      required this.controller,
      this.isobsecure = false,
      required this.icon,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        obscureText: isobsecure,
        controller: controller,
        decoration: InputDecoration(
            hintText: text,
            fillColor: Colors.teal,
            filled: true,
            prefixIcon: Icon(icon),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
