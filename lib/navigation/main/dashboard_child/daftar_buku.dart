import 'package:flutter/material.dart';

class DaftarBukuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Buku'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return BukuCard(
            judul: 'Harry Potter and the Sorcerer\'s Stone $index',
            penulis: 'J.K. Rowling',
            sinopsis:
                'Harry Potter, seorang anak biasa yang ternyata adalah seorang penyihir, memulai petualangan magisnya di Hogwarts School of Witchcraft and Wizardry.',
            coverImageUrl:
                'https://upload.wikimedia.org/wikipedia/id/thumb/b/bf/Harry_Potter_and_the_Sorcerer%27s_Stone.jpg/220px-Harry_Potter_and_the_Sorcerer%27s_Stone.jpg',
          );
        },
      ),
    );
  }
}

class BukuCard extends StatefulWidget {
  final String judul;
  final String penulis;
  final String sinopsis;
  final String coverImageUrl;

  BukuCard(
      {required this.judul,
      required this.penulis,
      required this.sinopsis,
      required this.coverImageUrl});

  @override
  _BukuCardState createState() => _BukuCardState(
      judul: judul,
      penulis: penulis,
      sinopsis: sinopsis,
      coverImageUrl: coverImageUrl);
}

class _BukuCardState extends State<BukuCard> {
  bool isHighlighted = false;
  final String judul;
  final String penulis;
  final String sinopsis;
  final String coverImageUrl;

  _BukuCardState(
      {required this.judul,
      required this.penulis,
      required this.sinopsis,
      required this.coverImageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isHighlighted = true;
        });
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ClipRRect(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.network(
                          widget.coverImageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            judul,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: isHighlighted ? Colors.blue : Colors.black,
                            ),
                          ),
                          Text(
                            'Penulis: $penulis',
                            style: TextStyle(
                              fontSize: 16,
                              color: isHighlighted ? Colors.blue : Colors.black,
                            ),
                          ),
                          Text(
                            sinopsis,
                            style: TextStyle(
                              fontSize: 16,
                              color: isHighlighted ? Colors.blue : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 4,
        margin: EdgeInsets.all(8), // Reduce margin to 8
        child: Column(
          children: [
            ClipRRect(
              child: Container(
                margin: EdgeInsets.all(2), // Reduce margin to 0
                child: Stack(
                  children: [
                    Image.network(
                      coverImageUrl,
                      fit: BoxFit.cover,
                      height: 185,
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                        padding: EdgeInsets.all(8),
                        child: Text(
                          judul,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
