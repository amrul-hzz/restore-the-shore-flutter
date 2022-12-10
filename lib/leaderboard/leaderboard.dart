import 'package:flutter/material.dart';
import 'package:restore_the_shore_flutter/nav_bar.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  String _quote = "";
  int _nominal = 0;
  String? jenis;
  // List<String> listJenis = <String>['Pemasukkan', 'Pengeluaran'];
  DateTime? tanggal;

  void submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      
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
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Write your message...",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
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
            const Spacer(), // Beri jarak dengan Button
            TextButton(
              onPressed: () => submitForm(context),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  foregroundColor: MaterialStateProperty.all(Colors.white)),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Text("Simpan"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}