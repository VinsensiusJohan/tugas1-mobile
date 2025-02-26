import 'package:flutter/material.dart';
import 'package:tugas1/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, // Lebar penuh
        height: double.infinity, // Tinggi penuh
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF7CFD8), Color(0xFFA6F1E0)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                text: "Hore, berhasil login !\n",
                style: TextStyle(fontSize: 18, color: Color(0xFF4A4A4A)),
                children: [
                  TextSpan(text: "Silahkan logout !\n"),
                ]
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF73C7C7),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Color(0xFFA6F1E0)),
                ),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text("Logout", style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
