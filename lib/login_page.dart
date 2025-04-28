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
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 80.0),
                  child: Center(
                    child: Image(
                      image: AssetImage('assets/images/pokebal.png'),
                      height: 100,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'SELAMAT DATANG KEMBALI',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}