
import 'package:flutter/material.dart';
import 'package:restore_the_shore_flutter/colorpalette.dart';
import 'package:restore_the_shore_flutter/nav_bar.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

//

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  final String title = 'Forum';

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      bottomNavigationBar: const NavBar(), // ini cara buatr NavBar nya, jangan lupa import dulu
      body: request.loggedIn
      ? const Text(
              'Forum Page Under Construction',
      )

      : Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              const Color.fromRGBO(93, 192, 211, 1.0),
              ColorPalette.secondaryColor.shade800
            ]
          ),
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You need to Login',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'login');
                },
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
