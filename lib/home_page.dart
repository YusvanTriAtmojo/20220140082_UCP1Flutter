import 'package:flutter/material.dart';
import 'package:ucp1/login_page.dart';
import 'package:ucp1/barang_page.dart';
import 'package:ucp1/pelanggan_page.dart';
import 'package:ucp1/piket_page.dart';

class HomePage extends StatelessWidget {
  final String email;
  const HomePage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: 
        Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/uyun.jpg'),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 55.0),
                        child: Text(
                          'Selamat Datang',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Text(
                        email,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 150,),
                  IconButton(
                    iconSize: 30,
                    color: Colors.white,
                    onPressed: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  }, icon: Icon(Icons.logout))
                ],
              ),
            ),
            SizedBox(height: 20,),
            Image(image: AssetImage('assets/images/promo.jpg'),
            height: 155,),
            SizedBox(height: 40,),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PiketPage(email: email),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(175.5, 175.5),
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage('assets/images/piket.png'),
                          height: 50,
                        ),
                        SizedBox(height: 20,),
                        Text('Data Piket'),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PelangganPage(
                          email: email,
                        )),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(175.5, 175.5),
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage('assets/images/pelanggan.png'),
                          height: 50,
                        ),
                        SizedBox(height: 20,),
                        Text('Data Pelanggan'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BarangPage(
                    email: email,
                  )),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(370, 175.5),
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Image(
                    image: AssetImage('assets/images/barang.png'),
                    height: 50,
                  ),
                  SizedBox(height: 20,),
                  Text('Barang Masuk/Keluar'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
