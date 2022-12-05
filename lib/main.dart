import 'package:flutter/material.dart';
import 'package:restore_the_shore_flutter/colorpalette.dart';
import 'package:restore_the_shore_flutter/myAccount/page/myAccount.dart';
import 'package:restore_the_shore_flutter/nav_bar.dart';
import 'package:restore_the_shore_flutter/forum/page/forum_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restore The Shore',
      initialRoute: '/',
      routes: {
        'home' : (context) => const MyHomePage(),
        'leaderboard' : (context) => const MyHomePage(), // Nanti ini ganti aja Page nya
        'my-account' : (context) => const MyAccountPage(),
        'forum': (context) => const ForumPage(),
        // Nanti tambahin masing masing page nya ke sini
      },
      theme: ThemeData(
        primarySwatch: ColorPalette.secondaryColor,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  final String title = "Restore The Shore";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(widget.title),
      ),
      bottomNavigationBar: const NavBar(), // ini cara buatr NavBar nya, jangan lupa import dulu
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to Restore The Shore',
            ),
          ],
        ),
      ),
    );
  }


}

