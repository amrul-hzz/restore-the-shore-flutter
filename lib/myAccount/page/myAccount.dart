import 'package:flutter/material.dart';
import 'package:restore_the_shore_flutter/colorpalette.dart';
import 'package:restore_the_shore_flutter/nav_bar.dart';
import 'package:restore_the_shore_flutter/myAccount/page/changePasswordPage.dart';
import 'package:restore_the_shore_flutter/myAccount/page/myEvent.dart';
import 'package:restore_the_shore_flutter/myAccount/page/myPost.dart';

import 'package:restore_the_shore_flutter/forum/page/forum_page.dart';

// This page is modified from : https://www.fluttertemplates.dev/widgets/must_haves/profile_page

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  String _username = "USERNAME";
  int _point = 0;
  int _numOfPost = 0;
  int _numOfEvent = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menambahkan bottom nav bar
      bottomNavigationBar: const NavBar(),
      body: Column(
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
                              image: _point >= 200 ? const AssetImage('assets/badge/platinum.png') :
                                  _point >= 150 ? const AssetImage('assets/badge/gold.png') :
                                  _point >= 100 ? const AssetImage('assets/badge/silver.png') :
                                  _point >= 50 ? const AssetImage('assets/badge/bronze.png') :
                                  const AssetImage('assets/badge/no_point.png')
                          ),
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
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const MyPasswordFormPage()));
                      },
                      child: const Text("Change Password")
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton.extended(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const MyEventPage()));
                        },
                        heroTag: 'history',
                        elevation: 0,
                        backgroundColor: ColorPalette.secondaryColor.shade800,
                        label: const Text("Event History"),
                      ),
                      const SizedBox(width: 16.0),
                      FloatingActionButton.extended(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const MyPostPage()));
                        },
                        heroTag: 'posts',
                        elevation: 0,
                        backgroundColor: ColorPalette.secondaryColor.shade800,
                        label: const Text("Posts"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 80,
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                style: Theme.of(context).textTheme.caption,
                              )
                            ],
                          ),
                        ),
                        const VerticalDivider(),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _numOfPost.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Text(
                                "Posts",
                                style: Theme.of(context).textTheme.caption,
                              )
                            ],
                          ),
                        ),
                        const VerticalDivider(),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                style: Theme.of(context).textTheme.caption,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
