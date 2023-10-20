import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulir Pendaftaran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Nama Lengkap'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Alamat Email'),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Kata Sandi'),
            ),
            ElevatedButton(
              onPressed: () {
                // Tempatkan logika pendaftaran di sini jika diperlukan
              },
              child: Text('Daftar'),
            ),
          ],
        ),
      ),
    );
  }
}
