import 'package:flutter/material.dart';
import 'package:restore_the_shore_flutter/nav_bar.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:restore_the_shore_flutter/leaderboard/utils/leaderboard_fetch_data.dart';

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

  void submitQuote(BuildContext context) {
    if (_formKeyQuote.currentState!.validate()) {
      
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
            FutureBuilder(
              future: fetchQuote(request),
              builder: (context, AsyncSnapshot snapshotQ) {
                print(snapshotQ);
                if (snapshotQ.data == null) {
                  return const Center(child: CircularProgressIndicator.adaptive());
                }
                if (!snapshotQ.hasData) {
                    return Column(
                      children: const [
                        Text(
                          "There is no Quote in database. :(", 
                          style: TextStyle(color: Color(0xff59A5D8), fontSize: 16)
                        ),
                        SizedBox(height: 8,)
                      ],
                    );
                  } else {
                    return Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 187, 187, 187),
                        borderRadius: BorderRadius.circular(15.0), 
                      ),
                      child: Column(children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                '"${snapshotQ.data![0].randomQuote}"',
                                textAlign: TextAlign.center,
                                ),
                              )
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                '~ by: ${snapshotQ.data![0].name} ~',
                                textAlign: TextAlign.right,
                                ),
                              )
                          ],
                        ),
                      ],),
                    );
                  }
              }
              ),
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
                        child: const Text("Search"),
                      )
                    ],
                  ),
            ),
            FutureBuilder(
              future: fetchUsers(request),
              builder: (context, AsyncSnapshot snapshotU) {
                print(snapshotU);
                if (snapshotU.data == null) {
                  return const Center(child: CircularProgressIndicator.adaptive());
                }
                if (!snapshotU.hasData) {
                    return Column(
                      children: const [
                        Text(
                          "There is no User in database. :(", 
                          style: TextStyle(color: Color(0xff59A5D8), fontSize: 16)
                        ),
                        SizedBox(height: 8,)
                      ],
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshotU.data!.length,
                        itemBuilder: (_, index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(width: 2.0, color: Color.fromARGB(255, 0, 247, 255))
                          ),
                          child: ListTile(
                            title: Text(snapshotU.data![index].fields.username),
                            subtitle: Text(snapshotU.data![index].fields.userPoint.toString()),
                            ),
                        ),
                      ),
                    );
                  }
              }
              ),
          ],
        ),
      ),
    );
  }
}