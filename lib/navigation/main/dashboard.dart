import 'package:flutter/material.dart';
import 'package:pl_mobile/navigation/main/dashboard_child/daftar_buku.dart';
import 'package:pl_mobile/navigation/main/dashboard_child/peminjaman_buku.dart';
import 'package:pl_mobile/navigation/main/dashboard_child/riwayat_peminjaman.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Dashboard Kosong',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DaftarBukuPage()),
                  );
                },
                child: Text('Daftar Buku'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PeminjamanBukuPage()),
                  );
                },
                child: Text('Peminjaman Buku'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RiwayatPeminjamanPage()),
                  );
                },
                child: Text('Riwayat Peminjaman'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

