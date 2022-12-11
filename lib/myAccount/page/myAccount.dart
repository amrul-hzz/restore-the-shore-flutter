import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

import 'package:restore_the_shore_flutter/colorpalette.dart';
import 'package:restore_the_shore_flutter/myAccount/model/UserProfile.dart';
import 'package:restore_the_shore_flutter/myAccount/page/password_change.dart';
import 'package:restore_the_shore_flutter/nav_bar.dart';
import 'package:restore_the_shore_flutter/myAccount/page/myEvent.dart';
import 'package:restore_the_shore_flutter/myAccount/page/myPost.dart';

// This page is modified from : https://www.fluttertemplates.dev/widgets/must_haves/profile_page

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  String _username = "USERNAME";
  int _point = 0;
  int _numOfEvent = 0;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      // Menambahkan bottom nav bar
      bottomNavigationBar: const NavBar(),
      body: request.loggedIn
          ? FutureBuilder(
              future: fetchUserProfile(request),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  _point = snapshot.data[0].fields.userPoint;
                  _username = snapshot.data[0].fields.username;
                  _numOfEvent =
                      snapshot.data[0].fields.eventsJoined.length;

                  return Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 50),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        const Color.fromRGBO(93, 192, 211, 1.0),
                                        ColorPalette.secondaryColor.shade800
                                      ]),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(50),
                                    bottomRight: Radius.circular(50),
                                  )),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: SizedBox(
                                width: 150,
                                height: 150,
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Image(
                                        image: _point >= 200
                                            ? const AssetImage(
                                                'lib/assets/badge/platinum.png')
                                            : _point >= 150
                                                ? const AssetImage(
                                                    'lib/assets/badge/gold.png')
                                                : _point >= 100
                                                    ? const AssetImage(
                                                        'lib/assets/badge/silver.png')
                                                    : _point >= 50
                                                        ? const AssetImage(
                                                            'lib/assets/badge/bronze.png')
                                                        : const AssetImage(
                                                            'lib/assets/badge/no_point.png')),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                _username,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Chip(
                                shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  style: BorderStyle.solid,
                                  color: _point >= 200
                                      ? Color.fromRGBO(229, 228, 226, 1)
                                      : _point >= 150
                                      ? Color.fromRGBO(255,215,0, 1)
                                      : _point >= 100
                                      ? Color.fromRGBO(192,192,192, 1)
                                      : _point >= 50
                                      ? Color.fromRGBO(205, 127, 50, 1)
                                      : ColorPalette.primaryColor),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                label: Text(
                                  _point >= 200
                                  ? "Platinum"
                                      : _point >= 150
                                  ? "Gold"
                                      : _point >= 100
                                  ? "Silver"
                                      : _point >= 50
                                  ? "Bronze"
                                      : "No Badge"
                                ),
                                backgroundColor: Colors.transparent,
                              ),

                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton.extended(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MyEventPage()));
                                    },
                                    heroTag: 'history',
                                    elevation: 0,
                                    backgroundColor:
                                        ColorPalette.secondaryColor.shade800,
                                    label: const Text("Event History"),
                                  ),
                                  const SizedBox(width: 16.0),
                                  FloatingActionButton.extended(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MyPostPage()));
                                    },
                                    heroTag: 'posts',
                                    elevation: 0,
                                    backgroundColor:
                                        ColorPalette.secondaryColor.shade800,
                                    label: const Text("Posts"),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Container(
                                height: 80,
                                constraints:
                                    const BoxConstraints(maxWidth: 400),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              _point.toString(),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Points",
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption,
                                          )
                                        ],
                                      ),
                                    ),
                                    const VerticalDivider(),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              _numOfEvent.toString(),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Events Joined",
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                        Navigator.push(context,
                                            MaterialPageRoute( builder: (context) =>
                                              const MyPasswordFormPage()));
                                    },
                                    child: const Text("Change Password"),
                                  ),
                                  const SizedBox(width: 16),
                                  ElevatedButton(
                                    onPressed: () async {
                                      final response = await request.logout(
                                          "https://restore-the-shore.up.railway.app/authentication/logout");
                                      if (!request.loggedIn) {
                                        NavBarState.selectedIndex = 0;
                                        Navigator.pushReplacementNamed(context, 'home');
                                      }
                                    }, //request.logout("LOGOUTURL"),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.redAccent,
                                    ),
                                    child: const Text("Logout"),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }
              })
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      const Color.fromRGBO(93, 192, 211, 1.0),
                      ColorPalette.secondaryColor.shade800
                    ]),
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
