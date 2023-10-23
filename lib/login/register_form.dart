import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  String _nisn = "";
  String _kelas = "Pilih Kelas";
  List<String> _kelasOptions = ["Pilih Kelas", "Kelas A", "Kelas B", "Kelas C"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulir Pendaftaran'),
        backgroundColor:
            Colors.blue, // Mengubah warna latar belakang app bar menjadi biru
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'NISN'),
              onChanged: (value) {
                _nisn = value;
              },
            ),
            DropdownButton<String>(
              value: _kelas,
              items: _kelasOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                _kelas = value!;
              },
            ),
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
                // Anda dapat mengakses _nisn dan _kelas untuk data pendaftaran.
              },
              child: Text('Daftar'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Mengubah warna tombol menjadi biru
              ),
            ),
          ],
        ),
      ),
      backgroundColor:
          Colors.white, // Mengubah warna latar belakang body menjadi putih
    );
  }
}
