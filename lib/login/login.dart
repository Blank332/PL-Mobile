import 'package:flutter/material.dart';
import 'package:pl_mobile/login/login_form.dart';
import 'package:pl_mobile/login/register_form.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green, // Warna latar belakang
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/logo.png', // Ganti dengan path logo
                width: 150,
                height: 150,
              ),
              SizedBox(height: 16),
              Text(
                'Selamat Datang di Aplikasi Kami',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              SizedBox(height: 32),
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
                  primary: Colors.blue, // Warna tombol masuk
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
                  primary: Colors.white, // Warna tombol register
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                ),
                child: Text('Register',
                    style: TextStyle(fontSize: 18, color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
