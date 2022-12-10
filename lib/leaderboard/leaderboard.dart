import 'package:flutter/material.dart';
import 'package:restore_the_shore_flutter/nav_bar.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  final _formKeyQuote = GlobalKey<FormState>();
  final _formKeyUsers = GlobalKey<FormState>();
  String _username = "";
  String _quote = "";
  String? jenis;
  // List<String> listJenis = <String>['Pemasukkan', 'Pengeluaran'];
  DateTime? tanggal;

  void submitForm(BuildContext context) {
    if (_formKeyQuote.currentState!.validate()) {
      
    }
  }

  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text("Congratulate and motivate your friends!"),
                  Row(
                    children: [
                      Expanded(
                        child: Form(
                          key: _formKeyQuote,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, top: 8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Write your message...",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    constraints: BoxConstraints(maxHeight: 36),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                                  ),
                                  // Validator sebagai validasi form
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                        return 'Pesan tidak boleh kosong!';
                                    }
                                    return null;
                                  },
                                )
                              ),
                            ],
                          )
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Route menu ke halaman form
                          Navigator.pop(context);
                        },
                        child: const Text("Send"),
                      )
                    ],
                  ),
                ],
              )
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                    children: [
                      Expanded(
                        child: Form(
                          key: _formKeyUsers,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, top: 8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Search for user...",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    constraints: BoxConstraints(maxHeight: 36),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                                  ),
                                  // Validator sebagai validasi form
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                        return 'Username cannot be empty!';
                                    }
                                    return null;
                                  },
                                )
                              ),
                            ],
                          )
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Route menu ke halaman form
                          Navigator.pop(context);
                        },
                        child: const Text("Send"),
                      )
                    ],
                  ),
            ),
          ],
        ),
      ),
    );
  }
}