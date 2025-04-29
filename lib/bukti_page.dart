import 'package:flutter/material.dart';

class BuktiPage extends StatelessWidget {
  final String tanggal;
  final String transaksi;
  final String barang;
  final String jumlahBrg;
  final String harga;
  final int totalHarga;
  final String emailAsli;

  const BuktiPage({
    super.key,
    required this.tanggal,
    required this.transaksi,
    required this.barang,
    required this.jumlahBrg,
    required this.harga,
    required this.totalHarga,
    required this.emailAsli,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
