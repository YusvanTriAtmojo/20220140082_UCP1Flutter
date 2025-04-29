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
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 60.0),
          child: Text('Piket Gudang', style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Colors.blueAccent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nama Anggota'),
                SizedBox(height: 10),
                TextFormField(
                  initialValue: widget.email,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: dateController,
                  decoration: InputDecoration(
                    hintText: 'Pilih Tanggal',
                    prefixIcon: 
                    Stack(
                      children: [
                        Container
                        (
                          padding: EdgeInsets.only(left: 10, top: 8),
                          child: Icon(Icons.calendar_today_outlined, size: 28, color: Colors.grey,)),
                        Container(
                          padding: EdgeInsets.only(left: 16, top: 18),
                          child: Icon(Icons.check, size: 15, color: Colors.grey,))
                      ]
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 10, 86, 216),
                        width: 3.0,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tanggal tidak boleh kosong';
                    }
                    return null;
                  },
                  readOnly: true,
                  onTap: () {
                    pilihDate();
                  },
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: tugasController,
                        decoration: InputDecoration(
                          hintText: 'Tugas Piket',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 10, 86, 216),
                              width: 3.0,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Tugas tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          addData();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(180, 50),
                        backgroundColor: Colors.blueAccent,
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        'Tambah',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
