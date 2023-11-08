import 'package:flutter/material.dart';
import 'package:pl_mobile/navigation/main/dashboard_child/daftar_buku.dart';
import 'package:pl_mobile/navigation/main/dashboard_child/peminjaman_buku.dart';
import 'package:pl_mobile/navigation/main/dashboard_child/riwayat_peminjaman.dart';

void main() {
  runApp(
    MaterialApp(
      home: Dashboard(),
    ),
  );
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'images/logo.png', // Replace with the actual path to your image
              width: 40.0,
              height: 40.0,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DashboardButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DaftarBukuPage()),
                );
              },
              text: 'Daftar Buku',
              icon: Icons.menu_book,
            ),
            SizedBox(height: 16),
            DashboardButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PeminjamanBukuPage()),
                );
              },
              text: 'Peminjaman Buku',
              icon: Icons.library_books,
            ),
            SizedBox(height: 16),
            DashboardButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RiwayatPeminjamanPage()),
                );
              },
              text: 'Riwayat Peminjaman',
              icon: Icons.history,
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData icon;

  DashboardButton({
    required this.onPressed,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 30, // Ukuran ikon yang diperbesar
      ),
      label: Text(
        text,
        style: TextStyle(
          fontSize: 18, // Ukuran teks yang diperbesar
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        minimumSize: Size(300, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
