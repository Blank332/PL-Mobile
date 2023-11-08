import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:intl/intl.dart';

class PeminjamanBukuPage extends StatefulWidget {
  @override
  _PeminjamanBukuPageState createState() => _PeminjamanBukuPageState();
}

class _PeminjamanBukuPageState extends State<PeminjamanBukuPage> {
  final TextEditingController _namaPeminjamController = TextEditingController();
  String? _selectedBook = "Pilih Judul";
  DateTime? _selectedDateTime;
  List<String> _bookList = [
    'Harry Potter and the Sorcerer\'s Stone 0',
    'Harry Potter and the Sorcerer\'s Stone 1',
    'Harry Potter and the Sorcerer\'s Stone 2',
    // Tambahkan daftar buku lainnya sesuai kebutuhan
  ];

  List<Peminjaman> peminjamanList = [];

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          _selectedDateTime != null ? _selectedDateTime! : DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(picked.year, picked.month, picked.day,
              pickedTime.hour, pickedTime.minute);
        });
      }
    }
  }

  void _savePeminjaman() {
    String namaPeminjam = _namaPeminjamController.text;
    String judulBuku = _selectedBook ?? 'Belum dipilih';
    String tanggalPeminjaman = _selectedDateTime != null
        ? DateFormat("yyyy-MM-dd HH:mm").format(_selectedDateTime!)
        : 'Belum dipilih';

    Peminjaman peminjaman =
        Peminjaman(namaPeminjam, judulBuku, tanggalPeminjaman);
    peminjamanList.add(peminjaman);

    // Bersihkan input setelah menyimpan data
    _namaPeminjamController.clear();
    _selectedBook = "Pilih Judul";
    _selectedDateTime = null;
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _selectedDateTime != null
                  ? 'Tanggal dan Jam Peminjaman: ${DateFormat("yyyy-MM-dd HH:mm").format(_selectedDateTime!)}'
                  : 'Pilih Tanggal dan Jam Peminjaman',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            DropdownSearch<String>(
              items: _bookList,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedBook = value;
                  });
                }
              },
              selectedItem: _selectedBook,
              popupProps: PopupProps.menu(
                showSearchBox: true,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                elevation: MaterialStateProperty.all(5),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 103, vertical: 16),
                ),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                )),
              ),
              onPressed: () => _selectDateTime(context),
              child: Text(
                'Pilih Tanggal dan Jam',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                elevation: MaterialStateProperty.all(5),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 79, vertical: 16),
                ),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                )),
              ),
              onPressed: () {
                String namaPeminjam = _namaPeminjamController.text;
                String judulBuku = _selectedBook ?? 'Belum dipilih';
                String tanggalPeminjaman = _selectedDateTime != null
                    ? DateFormat("yyyy-MM-dd HH:mm").format(_selectedDateTime!)
                    : 'Belum dipilih';

                Peminjaman peminjaman =
                    Peminjaman(namaPeminjam, judulBuku, tanggalPeminjaman);
                peminjamanList.add(peminjaman);

                // Bersihkan input setelah menyimpan data
                _namaPeminjamController.clear();
                _selectedBook = "Pilih Judul";
                _selectedDateTime = null;

                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Konfirmasi Peminjaman'),
                      content: Text(
                        'Anda meminjam buku dengan judul "$judulBuku" oleh $namaPeminjam pada tanggal dan jam $tanggalPeminjaman.',
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
              child: Text(
                'Simpan Buku yang Dipinjam',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Daftar Peminjaman:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: peminjamanList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title:
                        Text('Peminjam: ${peminjamanList[index].namaPeminjam}'),
                    subtitle: Text(
                        'Judul Buku: ${peminjamanList[index].judulBuku}\n'
                        'Tanggal dan Jam: ${peminjamanList[index].tanggalPeminjaman}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _namaPeminjamController.dispose();
    super.dispose();
  }
}

class Peminjaman {
  final String namaPeminjam;
  final String judulBuku;
  final String tanggalPeminjaman;

  Peminjaman(this.namaPeminjam, this.judulBuku, this.tanggalPeminjaman);
}

void main() {
  runApp(MaterialApp(
    home: PeminjamanBukuPage(),
  ));
}
