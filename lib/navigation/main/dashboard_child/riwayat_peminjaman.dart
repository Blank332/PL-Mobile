import 'package:flutter/material.dart';

class RiwayatPeminjamanPage extends StatelessWidget {
  final List<RiwayatPeminjaman> riwayatPeminjaman = [
    RiwayatPeminjaman('John Doe', 'The Great Gatsby', '2023-10-10'),
    RiwayatPeminjaman('Alice Smith', 'To Kill a Mockingbird', '2023-10-12'),
    RiwayatPeminjaman('Bob Johnson', '1984', '2023-10-15'),
    // Tambahkan data dummy lainnya sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Peminjaman'),
      ),
      body: ListView.builder(
        itemCount: riwayatPeminjaman.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(riwayatPeminjaman[index].judulBuku),
            subtitle: Text('Peminjam: ${riwayatPeminjaman[index].namaPeminjam}\nTanggal: ${riwayatPeminjaman[index].tanggalPeminjaman}'),
          );
        },
      ),
    );
  }
}

class RiwayatPeminjaman {
  final String namaPeminjam;
  final String judulBuku;
  final String tanggalPeminjaman;

  RiwayatPeminjaman(this.namaPeminjam, this.judulBuku, this.tanggalPeminjaman);
}
