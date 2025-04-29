import 'package:flutter/material.dart';

class DetailPiketPage extends StatelessWidget {
  final String email;
  final String tanggal;
  final String tugas;

  const DetailPiketPage({
    super.key,
    required this.email,
    required this.tanggal,
    required this.tugas,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 60.0),
          child: Text('Detail $tugas', style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Colors.blueAccent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
    );
  }
}
