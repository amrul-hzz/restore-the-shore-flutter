import 'package:flutter/material.dart';
import 'package:restore_the_shore_flutter/leaderboard/widgets/quote_widget.dart';
import 'package:restore_the_shore_flutter/nav_bar.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:restore_the_shore_flutter/leaderboard/widgets/leaderboard_widget.dart';
import 'package:restore_the_shore_flutter/leaderboard/widgets/quote_widget.dart';
import 'package:restore_the_shore_flutter/leaderboard/utils/leaderboard_utils.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  final _formKeyQuote = GlobalKey<FormState>();
  String username = "";
  String quote = "";

  void submitQuote(BuildContext context) {
    if (_formKeyQuote.currentState!.validate()) {
      refresh();

    }
  }

  @override
  void refresh() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      bottomNavigationBar: const NavBar(), // ini cara buat NavBar nya, jangan lupa import dulu
      appBar: AppBar(
        title: const Text('Leaderboard'),
      ),
      // drawer: externalWidget(context), // UNCOMMENT UNTUK MEMBUAT DRAWER
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Restore The Shore",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Top Users of Restore The Shore's Event",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              
            ),
            QuoteWidget(request: request),
            Expanded(
              child: LeaderboardWidget(request: request,),
            ),
          ],
        ),
      ),
    );
  }
}