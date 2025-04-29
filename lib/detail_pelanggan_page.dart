import 'package:flutter/material.dart';

class DetailPelangganPage extends StatelessWidget {
  final String nama;
  final String email;
  final String nohp;
  final String alamat;
  final String provinsi;
  final String kodepos;
  final String emailAsli;

  const DetailPelangganPage({
    super.key,
    required this.nama,
    required this.email,
    required this.nohp,
    required this.alamat,
    required this.provinsi,
    required this.kodepos,
    required this.emailAsli,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 65.0),
          child: Text(
            'Detail $nama',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blueAccent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
    );
  }
}