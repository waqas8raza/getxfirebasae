import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxfirebasae/utils/widgets/buttonwidget.dart';
import 'package:getxfirebasae/utils/widgets/textfield.dart';

import '../../controllers/authcontroller/logincontroller.dart';

class Signinpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginController signupController = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("😍 S I G N I N 🌳"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Row(
                  children: [
                    Text(
                      "Welcome ❤️",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      "SIGN IN",
                      style:
                          TextStyle(fontSize: 45, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Mytextfield(
                    controller: signupController.emailc,
                    icon: Icons.email,
                    text: 'Email'),
                Mytextfield(
                    isobsecure: true,
                    controller: signupController.passwordc,
                    icon: Icons.password_sharp,
                    text: 'Password'),
                const SizedBox(height: 20),
                Buttonwidget(
                    icon: Icons.login_rounded,
                    ontap: () {
                      signupController.signinAccount(
                        signupController.emailc.text.trim(),
                        signupController.passwordc.text.trim(),
                      );
                    },
                    text: 'Log In'),
                const SizedBox(height: 20),
                Buttonwidget(
                    icon: Icons.person_2_rounded, ontap: () {}, text: 'SIGNUP'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
