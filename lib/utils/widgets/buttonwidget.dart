import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Buttonwidget extends StatelessWidget {
  String text;
  VoidCallback ontap;
  IconData icon;
  Buttonwidget(
      {super.key, required this.icon, required this.ontap, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ontap,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                ),
                Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ));
  }
}
