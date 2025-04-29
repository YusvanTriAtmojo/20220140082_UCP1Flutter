import 'package:flutter/material.dart';
import 'package:ucp1/home_page.dart';

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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/images/succes.png'),
              height: 150,),
              SizedBox(height: 60,),
              Text('Data Berhasil Disimpan'),
              SizedBox(height: 60,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tanggal'),
                  Text(tanggal),
                ],
              ),
              Divider(height: 5,),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Jenis Transaksi'),
                  Text(transaksi),
                ],
              ),
              Divider(height: 5,),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Jenis Barang'),
                  Text(barang),
                ],
              ),
              Divider(height: 5,),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Jumlah Barang'),
                  Text(jumlahBrg),
                ],
              ),
              Divider(height: 5,),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Harga Satuan'),
                  Text('Rp. $harga'),
                ],
              ),
              Divider(height: 5,),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Harga'),
                  Text('Rp. $totalHarga'),
                ],
              ),
              Divider(height: 5,),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(email: emailAsli),
                    ),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(1000, 60),
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Selesai',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
