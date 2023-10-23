import 'package:flutter/material.dart';
import 'package:pl_mobile/login/login_form.dart';
import 'package:pl_mobile/login/register_form.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'images/pattern.png',
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Selamat Datang di Aplikasi',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    Text(
                      'PEMBANGUNAN LIBRARY',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 10), // Menambahkan jarak vertikal
                    Text(
                      'Pembangunan Library adalah aplikasi resmi',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        letterSpacing: 1.5,
                      ),
                    ),
                    Text(
                      'untuk perpustakaan SMKN 1 Cimahi',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginForm(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            ),
            child: Text('Masuk', style: TextStyle(fontSize: 18)),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterForm(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            ),
            child: Text('Register',
                style: TextStyle(fontSize: 18, color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
