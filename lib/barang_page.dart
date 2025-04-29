import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class BarangPage extends StatefulWidget {
  const BarangPage({super.key});

  @override
  State<BarangPage> createState() => _BarangPageState();
}

class _BarangPageState extends State<BarangPage> {
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController jumlahBrgController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  String hargaSatuan = "";

  int totalHarga = 0;

  String? jenisTfController;
  String? jenisBrgController;

  final List<String> jenisTf = ['Barang Masuk', 'Barang Keluar'];
  final List<String> jenisBrg = ['Carrier', 'Sleeping Bag', 'Tenda', 'Sepatu'];

  void harga() {
    setState(() {
      if (jenisBrgController == "Carrier") {
        hargaSatuan = '540000';
      }
      if (jenisBrgController == "Sleeping Bag") {
        hargaSatuan = '250000';
      }
      if (jenisBrgController == "Tenda") {
        hargaSatuan = '700000';
      }
      if (jenisBrgController == "Sepatu") {
        hargaSatuan = '350000';
      }
    });
  }

  void calculateTotalPrice() {
    int harga = int.tryParse(hargaSatuan) ?? 0;
    int jumlah = int.tryParse(jumlahBrgController.text) ?? 0;

    setState(() {
      totalHarga = (jumlah * harga);
    });
  }

  void pilihDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2200),
    );
    if (picked != null) {
      String formattedDate = DateFormat(
        'EEEE, dd MMMM yyyy',
        'id_ID',
      ).format(picked);
      setState(() {
        tanggalController.text = formattedDate.toString();
      });
    } else {
      print('Pilih Tanggal');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
