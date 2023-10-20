import 'package:flutter/material.dart';
import 'package:pl_mobile/navigation/navigation.dart';

void main() {
  runApp(MaterialApp(
    home: LoginForm(),
    theme: ThemeData(),
  ));
}

class LoginForm extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

enum LoginStatus { notSignIn, signIn }

class _LoginState extends State<LoginForm> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Masuk'),
        backgroundColor: Colors.green, // Warna latar belakang appbar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selamat Datang!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Nama Pengguna',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Kata Sandi',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String username = usernameController.text;
                String password = passwordController.text;

                // Tempatkan logika autentikasi di sini
                if (username == 'pengguna' && password == 'password') {
                  // Berhasil masuk
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NavigationPage(),
                    ),
                  );
                } else {
                  // Tampilkan pesan kesalahan jika login gagal
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Login gagal. Coba lagi.'),
                    ),
                  );
                }
              },
              child: Text('Masuk'),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.green), // Warna tombol
              ),
            ),
          ],
        ),
      ),
    );
  }
}
