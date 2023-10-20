import 'package:flutter/material.dart';

class PeminjamanBukuPage extends StatefulWidget {
  @override
  _PeminjamanBukuPageState createState() => _PeminjamanBukuPageState();
}

class _PeminjamanBukuPageState extends State<PeminjamanBukuPage> {
  final TextEditingController _namaPeminjamController = TextEditingController();
  final TextEditingController _judulBukuController = TextEditingController();
  DateTime? _selectedDate; // Gunakan DateTime? agar variabel dapat memiliki nilai null.

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate != null ? _selectedDate! : DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peminjaman Buku'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _namaPeminjamController,
              decoration: InputDecoration(labelText: 'Nama Peminjam'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _judulBukuController,
              decoration: InputDecoration(labelText: 'Judul Buku'),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Text(
                  _selectedDate != null
                      ? 'Tanggal Peminjaman: ${_selectedDate!.toLocal()}'
                      : 'Pilih Tanggal Peminjaman',
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Pilih Tanggal'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String namaPeminjam = _namaPeminjamController.text;
                String judulBuku = _judulBukuController.text;
                String tanggalPeminjaman = _selectedDate != null
                    ? _selectedDate!.toLocal().toString()
                    : 'Belum dipilih';

                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Konfirmasi Peminjaman'),
                      content: Text(
                        'Anda meminjam buku dengan judul "$judulBuku" oleh $namaPeminjam pada tanggal $tanggalPeminjaman.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Tutup'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Pinjam Buku'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _namaPeminjamController.dispose();
    _judulBukuController.dispose();
    super.dispose();
  }
}
