import 'package:flutter/material.dart';
import 'package:pl_mobile/navigation/main/dashboard.dart';
import 'package:pl_mobile/navigation/main/pesan.dart';
import 'package:pl_mobile/navigation/main/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Sans', // Set your custom font as the default
      ),
      home: NavigationPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  final List<Widget> _pages = [
    Dashboard(),
    PesanPage(),
    ProfilePage(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: _selectedIndex == 0
                  ? 32
                  : 24, // Adjust the size based on the selected index
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.mail,
              size: _selectedIndex == 1
                  ? 32
                  : 24, // Adjust the size based on the selected index
            ),
            label: 'Pesan',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: _selectedIndex == 2
                  ? 32
                  : 24, // Adjust the size based on the selected index
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        iconSize: 32, // This is the maximum size for selected icons
        backgroundColor: Colors.white,
        elevation: 5,
      ),
    );
  }
}
