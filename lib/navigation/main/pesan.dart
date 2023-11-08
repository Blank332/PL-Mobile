import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: PesanPage(),
    ),
  );
}

class PesanPage extends StatefulWidget {
  @override
  _PesanPageState createState() => _PesanPageState();
}

class _PesanPageState extends State<PesanPage> {
  final ScrollController _scrollController = ScrollController();
  bool showScrollToTopButton = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.offset > 100.0) {
        if (!showScrollToTopButton) {
          setState(() {
            showScrollToTopButton = true;
          });
        }
      } else {
        if (showScrollToTopButton) {
          setState(() {
            showScrollToTopButton = false;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesan'),
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
      body: ListView.builder(
        controller: _scrollController,
        itemCount: 5,
        itemBuilder: (context, index) {
          return PesanCard(
            coverImageUrl:
                'https://upload.wikimedia.org/wikipedia/id/thumb/b/bf/Harry_Potter_and_the_Sorcerer%27s_Stone.jpg/220px-Harry_Potter_and_the_Sorcerer%27s_Stone.jpg',
            judul: 'Judul Pesan $index',
            tanggal: DateTime.now()
                .subtract(Duration(days: index)), // Contoh tanggal DateTime
            detail:
                '"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nec dignissim arcu. Praesent sit amet nunc venenatis, congue ex ut, euismod libero. In hac habitasse platea dictumst. Nulla facilisi. Vivamus ut suscipit erat. Sed eu ex vitae libero vestibulum congue. Phasellus sed lectus ut est vehicula scelerisque id eget ipsum. Sed aliquam nisi id risus facilisis iaculis."',
          );
        },
      ),
      floatingActionButton: showScrollToTopButton
          ? FloatingActionButton(
              onPressed: () {
                _scrollController.animateTo(0.0,
                    duration: Duration(seconds: 1), curve: Curves.easeOut);
              },
              child: Icon(Icons.arrow_upward),
            )
          : null,
    );
  }
}

class PesanCard extends StatefulWidget {
  final String coverImageUrl;
  final String judul;
  final DateTime tanggal; // Ubah tipe data tanggal menjadi DateTime
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

  String formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();
    return '$day/$month/$year';
  }

  @override
  Widget build(BuildContext context) {
    double initialImageHeight = 200.0;
    double expandedImageHeight = 400.0;

    return Card(
      margin: EdgeInsets.fromLTRB(8, 8, 8, 16),
      elevation: 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: isExpanded ? expandedImageHeight : initialImageHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.coverImageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              widget.judul,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              formatDate(widget
                  .tanggal), // Menggunakan method formatDate untuk format tanggal
              style: TextStyle(fontSize: 18),
            ),
            trailing: IconButton(
              icon: Icon(
                isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                size: 32,
              ),
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),
          AnimatedCrossFade(
            firstChild: Container(),
            secondChild: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                widget.detail,
                style: TextStyle(fontSize: 18),
              ),
            ),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: Duration(milliseconds: 400),
          ),
        ],
      ),
    );
  }
}
