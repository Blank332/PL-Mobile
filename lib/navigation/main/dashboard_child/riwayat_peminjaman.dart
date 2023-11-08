import 'package:flutter/material.dart';

class RiwayatPeminjamanPage extends StatelessWidget {
  final List<RiwayatPeminjaman> riwayatPeminjaman = [
    RiwayatPeminjaman(
        'The Great Gatsby', '1', '2023-10-10', '2023-10-17', '', 'Rak A1'),
    RiwayatPeminjaman(
        'To Kill a Mockingbird', '2', '2023-10-12', '2023-10-30', '', 'Rak B2'),
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
          final tanggalPeminjaman =
              DateTime.parse(riwayatPeminjaman[index].tanggalPeminjaman);
          final tanggalPengembalianSeharusnya =
              DateTime.parse(riwayatPeminjaman[index].tanggalKembali);
          final selisihHari = tanggalPengembalianSeharusnya
              .difference(tanggalPeminjaman)
              .inDays;

          // Hitung denda jika peminjaman lebih dari satu minggu
          final denda =
              selisihHari > 7 ? 'Rp. ${500 * (selisihHari - 7)}' : 'Rp 0';

          return Card(
            margin: EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${riwayatPeminjaman[index].judulBuku}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'ID Buku: ${riwayatPeminjaman[index].id}',
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tanggal Pinjam        : ${riwayatPeminjaman[index].tanggalPeminjaman}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Tanggal Kembali      : ${riwayatPeminjaman[index].tanggalKembali}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Rak Penyimpanan   : ${riwayatPeminjaman[index].tempatRakPenyimpanan}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Denda                           : $denda',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class RiwayatPeminjaman {
  final String judulBuku;
  final String id;
  final String tanggalPeminjaman;
  final String tanggalKembali;
  final String denda;
  final String tempatRakPenyimpanan;

  RiwayatPeminjaman(this.judulBuku, this.id, this.tanggalPeminjaman,
      this.tanggalKembali, this.denda, this.tempatRakPenyimpanan);
}
