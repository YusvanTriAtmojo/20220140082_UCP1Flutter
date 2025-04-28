import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscurepw = true;

  @override
  void initState() {
    super.initState();
  }

  void liatpw() {
    setState(() {
      obscurepw = !obscurepw;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
