import 'package:flutter/material.dart';
import 'package:go_fltr/pages/home_page.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/home.png', // Sesuaikan dengan path gambar Anda
              width: 600,
              height: 300,
            ),
            const SizedBox(height: 10),
            IconButton(
              icon: Icon(Icons.arrow_circle_right_outlined),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              // child: const Text('Menuju ke Halaman Utama',
              //     style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
