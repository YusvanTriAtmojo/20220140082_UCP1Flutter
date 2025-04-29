import 'package:flutter/material.dart';

class PiketPage extends StatefulWidget {
  final String email;
  const PiketPage({super.key, required this.email});

  @override
  State<PiketPage> createState() => _PiketPageState();
}

class _PiketPageState extends State<PiketPage> {
  final TextEditingController tugasController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  List<Map<String, dynamic>> daftarpiket = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
