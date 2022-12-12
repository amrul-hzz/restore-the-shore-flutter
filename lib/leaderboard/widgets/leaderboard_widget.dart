import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:restore_the_shore_flutter/leaderboard/utils/leaderboard_utils.dart';
import '../model/leader_board.dart';

class LeaderboardWidget extends StatefulWidget {
  final CookieRequest request;

  const LeaderboardWidget(
    {super.key, required CookieRequest request}) : this.request = request;
  
  searchUser(String username) => searchUser(username);

  @override
  State<LeaderboardWidget> createState() => _LeaderboardWidgetState(request);
}

class _LeaderboardWidgetState extends State<LeaderboardWidget> {
  late CookieRequest request;
  late Future<List<LeaderBoard>> leaderboard = fetchUsers(request);
  String username = "";
  final _formKeyUsers = GlobalKey<FormState>();

  _LeaderboardWidgetState(CookieRequest request) {
    this.request = request;
  }

  void searchUser(String username) {
    setState(() {
      leaderboard = fetchUsersSearch(request, username);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
            children: [ 
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
                                  // Menambahkan behavior saat nama diketik 
                                  onChanged: (String? value) {
                                    setState(() {
                                        username = value!;
                                    });
                                  },
                                  // Menambahkan behavior saat data disimpan
                                  onSaved: (String? value) {
                                    setState(() {
                                        username = value!;
                                    });
                                  },
                                  // Validator sebagai validasi form
                                  validator: (String? value) {
                                    if (value == null || value == "") {
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
                          if (_formKeyUsers.currentState!.validate()) {
                            searchUser(username);
                          }
                        },
                        child: const Text("Search"),
                      )
                    ],
                  ),
            ),
            FutureBuilder(
              future: leaderboard,
              builder: (context, AsyncSnapshot snapshotU) {

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
      ]
    );
  }
}