
import 'package:flutter/material.dart';
//import 'package:restore_the_shore_flutter/colorpalette.dart';
import 'package:restore_the_shore_flutter/nav_bar.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  final String title = 'Forum';

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavBar(), // ini cara buatr NavBar nya, jangan lupa import dulu
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Forum Page Under Construction',
            ),
          ],
        ),
      ),
    );
  }


}
