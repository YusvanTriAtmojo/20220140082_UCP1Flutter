import 'package:flutter/material.dart';
import 'package:ucp1/login_page.dart';

class HomePage extends StatelessWidget {
  final String email;
  const HomePage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
        ],
      ),
    );
  }
}
