import 'package:flutter/material.dart';

class PelangganPage extends StatefulWidget {
  const PelangganPage({super.key});

  @override
  State<PelangganPage> createState() => _PelangganPageState();
}

class _PelangganPageState extends State<PelangganPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nohpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController provinsiController = TextEditingController();
  final TextEditingController posController = TextEditingController();

  void reset() {
    setState(() {
      namaController.clear();
      emailController.clear();
      nohpController.clear();
      alamatController.clear();
      alamatController.clear();
      provinsiController.clear();
      posController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
