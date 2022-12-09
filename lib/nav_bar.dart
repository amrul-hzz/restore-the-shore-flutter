import 'package:flutter/material.dart';
import 'package:restore_the_shore_flutter/colorpalette.dart';

class NavBar extends StatefulWidget {
  const NavBar();

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  static int _selectedIndex = 0;

  // Tambahin route name yang udah ditambahin di main ke sini, urutannya sesuain aja
  static List<String> listRoute = [
    'home',
    'leaderboard',
    'my-account',
    'create-event'
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pushReplacementNamed(context, listRoute[_selectedIndex]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const <BottomNavigationBarItem>[
        // Nanti tambahin item nya kesini sesuai urutan
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.onetwothree),
          label: 'Leaderboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'My Account',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Create Event',
        ),
      ],
      currentIndex: _selectedIndex, //New
      onTap: _onItemTapped,
      unselectedItemColor: ColorPalette.secondaryColor,
      selectedItemColor: ColorPalette.primaryColor,
    );
  }
}
