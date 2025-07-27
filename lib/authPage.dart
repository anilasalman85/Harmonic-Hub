import 'package:flutter/material.dart';
import 'package:harmonic_hub/userSignUp.dart';

import 'userLogin.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;
  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage == true) {
      return User_LoginPage(
        showSignUpPage: toggleScreens,
      );
    } else {
      return User_SignUpPage(
        showLoginPage: toggleScreens,
      );
    }
  }
}
