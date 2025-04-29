import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ucp1/bukti_page.dart';


class BarangPage extends StatefulWidget {
  final String email;
  const BarangPage({super.key, required this.email,});

  @override
  State<BarangPage> createState() => _BarangPageState();
}

class _BarangPageState extends State<BarangPage> {
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController jumlahBrgController = TextEditingController();
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
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 60.0),
          child: Text(
            'Pendataan Barang',
            style: TextStyle(color: Colors.white),
          ),
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
                Text('Tanggal Transaksi'),
                SizedBox(height: 10),
                TextFormField(
                  controller: tanggalController,
                  decoration: InputDecoration(
                    hintText: 'Tanggal Transaksi',
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                DropdownButtonFormField<String>(
                  value: jenisTfController,
                  decoration: InputDecoration(
                    hintText: 'Jenis Transaksi',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                  ),
                  dropdownColor: Colors.blue[100],
                  items:
                      jenisTf
                          .map(
                            (transaksi) => DropdownMenuItem(
                              value: transaksi,
                              child: Text(transaksi),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {
                    setState(() {
                      jenisTfController = value;
                    });
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Pilih jenis transaksi';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: jenisBrgController,
                  decoration: InputDecoration(
                    hintText: 'Jenis Barang',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                  ),
                  dropdownColor: Colors.blue[100],
                  items:
                      jenisBrg
                          .map(
                            (barang) => DropdownMenuItem(
                              value: barang,
                              child: Text(barang),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {
                    setState(() {
                      jenisBrgController = value;
                    });
                    harga();
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Pilih jenis barang';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Jumlah Barang'),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: jumlahBrgController,
                            decoration: InputDecoration(
                              hintText: 'Jumlah Barang',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 10, 86, 216),
                                  width: 3.0,
                                ),
                              ),
                            ),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Jumlah barang tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Harga Satuan'),
                          SizedBox(height: 10),
                          Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10, top: 12),
                                child: Text('Rp.', style: TextStyle(fontSize: 20),)),
                                TextFormField(
                                  initialValue: '        $hargaSatuan',
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    hintText: '         Harga Satuan',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 10, 86, 216),
                                        width: 3.0,
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Harga satuan tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      calculateTotalPrice();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => BuktiPage(
                                tanggal: tanggalController.text,
                                transaksi: jenisTfController.toString(),
                                barang: jenisBrgController.toString(),
                                jumlahBrg: jumlahBrgController.text,
                                harga: hargaSatuan,
                                totalHarga: totalHarga,
                                emailAsli: widget.email,
                              ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(1000, 60),
                    backgroundColor: Colors.blueAccent,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 16),
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
