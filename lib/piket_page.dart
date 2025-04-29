import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        dateController.text = formattedDate.toString();
      });
    } else {
      print('Pilih Tanggal');
    }
  }

  void addData() {
    setState(() {
      daftarpiket.add({
        'piket': tugasController.text,
        'tanggal': dateController.text,
      });
      tugasController.clear();
      dateController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
