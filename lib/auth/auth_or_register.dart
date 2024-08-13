import 'package:flutter/material.dart';
import 'package:user_crud9/auth/login_page.dart';
import 'package:user_crud9/auth/register_page.dart';

class AuthOrRegister extends StatefulWidget {
  AuthOrRegister({super.key});

  @override
  State<AuthOrRegister> createState() => _AuthOrRegisterState();
}

class _AuthOrRegisterState extends State<AuthOrRegister> {
  bool showLoginPage = true;

  void toggelScreen() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        showRegisterPage: toggelScreen,
      );
    } else {
      return RegisterPage(
        showLoginPage: toggelScreen,
      );
    }
  }
}
