import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: PesanPage(),
    ),
  );
}

class PesanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesan'),
      ),
      body: ListView.builder(
        itemCount:
            5, // Jumlah pesan yang akan ditampilkan (ganti sesuai kebutuhan)
        itemBuilder: (context, index) {
          return PesanCard(
            coverImageUrl:
                'https://upload.wikimedia.org/wikipedia/id/thumb/b/bf/Harry_Potter_and_the_Sorcerer%27s_Stone.jpg/220px-Harry_Potter_and_the_Sorcerer%27s_Stone.jpg', // URL gambar pesan
            judul: 'Judul Pesan $index',
            tanggal: 'Tanggal Pesan $index',
            detail: 'Ini adalah detail pesan $index yang bisa diperluas.',
          );
        },
      ),
    );
  }
}

class PesanCard extends StatefulWidget {
  final String coverImageUrl;
  final String judul;
  final String tanggal;
  final String detail;

  PesanCard({
    required this.coverImageUrl,
    required this.judul,
    required this.tanggal,
    required this.detail,
  });

  @override
  _PesanCardState createState() => _PesanCardState();
}

class _PesanCardState extends State<PesanCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          ListTile(
            leading: Image.network(widget.coverImageUrl),
            title: Text(widget.judul),
            subtitle: Text(widget.tanggal),
            trailing: IconButton(
              icon: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),
          if (isExpanded)
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(widget.detail),
            ),
        ],
      ),
    );
  }
}
