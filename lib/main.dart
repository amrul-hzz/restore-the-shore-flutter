import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restore_the_shore_flutter/colorpalette.dart';
import 'package:restore_the_shore_flutter/leaderboard/leaderboard.dart';
import 'package:restore_the_shore_flutter/myAccount/page/myAccount.dart';
import 'package:restore_the_shore_flutter/create-event/pages/create_event.dart';
import 'package:restore_the_shore_flutter/create-event/pages/event_data.dart';
import 'package:restore_the_shore_flutter/create-event/pages/event_detail.dart';
import 'package:restore_the_shore_flutter/myAccount/page/login.dart';
import 'package:restore_the_shore_flutter/nav_bar.dart';
import 'package:restore_the_shore_flutter/forum/page/forum_page.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) {
          CookieRequest request = CookieRequest();
          return request;
        },
        child: MaterialApp(
          title: 'Restore The Shore',
          initialRoute: '/',
          routes: {
            'home': (context) => const MyHomePage(),
            'forum': (context) => const ForumPage(),
            'create-event': (context) => const CreateEventPage(),
            'leaderboard': (context) =>
                const LeaderboardPage(), // Nanti ini ganti aja Page nya
            'my-account': (context) => const MyAccountPage(),
            'login': (context) => const LoginPage(),
            'event-data': (context) => const EventDataPage(),
            // Nanti tambahin masing masing page nya ke sini
          },
          theme: ThemeData(
            primarySwatch: ColorPalette.secondaryColor,
          ),
          home: const MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  final String title = 'Restore The Shore';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          const NavBar(), // ini cara buatr NavBar nya, jangan lupa import dulu
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
