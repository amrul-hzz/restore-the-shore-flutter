import 'package:flutter/material.dart';
import 'package:restore_the_shore_flutter/colorpalette.dart';

class NavBar extends StatefulWidget {
  const NavBar();

  @override
  NavBarState createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  static int selectedIndex = 0;

  // Tambahin route name yang udah ditambahin di main ke sini, urutannya sesuain aja
  static List<String> listRoute = [
    'home',
    'forum',
    'timeline',
    'create-event',
    'leaderboard',
    'my-account',
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      Navigator.pushReplacementNamed(context, listRoute[selectedIndex]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedItemColor: ColorPalette.secondaryColor,
      selectedItemColor: ColorPalette.primaryColor,
      items: const <BottomNavigationBarItem>[
        // Nanti tambahin item nya kesini sesuai urutan
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat), // [PROBLEM] ntah kenapa icon di navbar jd putih
          label: 'Forum',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.timeline),
          label: 'Timeline',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Create Event',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.onetwothree),
          label: 'Leaderboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'My Account',
        ),
      ],
      currentIndex: selectedIndex, //New
      onTap: _onItemTapped,
    );
  }
}
