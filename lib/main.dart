import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restore_the_shore_flutter/colorpalette.dart';
import 'package:restore_the_shore_flutter/leaderboard/leaderboard.dart';
import 'package:restore_the_shore_flutter/myAccount/page/myAccount.dart';
import 'package:restore_the_shore_flutter/create-event/create_event.dart';
import 'package:restore_the_shore_flutter/login.dart';
import 'package:restore_the_shore_flutter/nav_bar.dart';
import 'package:restore_the_shore_flutter/forum/page/forum_page.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:restore_the_shore_flutter/timeline/timeline.dart';

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
            'timeline': (context) => const TimelineHomePage(),
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://image.cnbcfm.com/api/v1/image/107028541-1646934420167-gettyimages-101680465-ac4714a8-f421-4a76-ab21-eaa1793d80c8.jpeg?v=1646934663')
                )
              )
            ),
            Container(
              child: Text(
                'Restore the Shore',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 35, 32, 115),
                ),
              ),
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            ),
            Card(
              shape: RoundedRectangleBorder(  
                borderRadius: BorderRadius.circular(15.0),  
              ),  
              color: Color.fromARGB(255, 35, 32, 115), 
              elevation: 10, 
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[  
                  const ListTile(  
                    //leading: Icon(Icons.album, size: 60),   
                    subtitle: Text(  
                      'Hello environmentalists! Beaches have always been an important element for the environment and sea life. Restore the Shore is an interactive website where users can participate in events to clean beaches and post about them in the website. Users can get points and earn badges for joining events!',  
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.white,
                      )  
                    ),  
                  ),
                ],
              ),
            ),
            FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TimelineHomePage()));
              },
              elevation: 0,
              backgroundColor: ColorPalette.secondaryColor.shade800,
              label: const Text("See Events"),
            ),
            Container(
              child: Text(
                '-------Our Visions-------',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 35, 32, 115),
                ),
              ),
              margin: const EdgeInsets.only(left: 15.0, right: 15.0),
            ),
            Card(
              shape: RoundedRectangleBorder(  
                borderRadius: BorderRadius.circular(15.0),  
              ),  
              color: Color.fromARGB(255, 7, 229, 229), 
              elevation: 10, 
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[  
                  const ListTile(  
                    //leading: Icon(Icons.album, size: 60),  
                    title: Text(  
                      'Make the Shores Clean',  
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30.0)  
                    ),  
                    subtitle: Text(  
                      'Now, lots of beaches contains lots of litter. The litters, like plastic ones, are very dangerous to the envronment and marine life. Clean shores makes oceans healthy, also to help preserve marine life.',  
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18.0)  
                    ),  
                  ),
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(  
                borderRadius: BorderRadius.circular(15.0),  
              ),  
              color: Color.fromARGB(255, 7, 229, 229), 
              elevation: 10, 
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[  
                  const ListTile(  
                    //leading: Icon(Icons.album, size: 60),  
                    title: Text(  
                      'Preserve The Shores',  
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30.0)  
                    ),  
                    subtitle: Text(  
                      'Beaches have been an important part for a lot of sectors. Beaches attract a lot of tourists, which means beaches contribute for the economy. Beaches are also the home for some animals and marine life.',  
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18.0)  
                    ),  
                  ),
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(  
                borderRadius: BorderRadius.circular(15.0),  
              ),  
              color: Color.fromARGB(255, 7, 229, 229), 
              elevation: 10, 
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[  
                  const ListTile(  
                    //leading: Icon(Icons.album, size: 60),  
                    title: Text(  
                      'Raise Awareness to The Importance of Beaches',  
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30.0)  
                    ),  
                    subtitle: Text(  
                      'By participating in these events, participants can raise awareness of the importance of beaches to even more people, so more people will have the knowledge and will be more motivated to preserve beaches.',  
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18.0)  
                    ),  
                  ),
                ],
              ),
            ),
            Container(
              child: Text(
                '© 2022 - Restore The Shore - All rights reserved',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 35, 32, 115),
                ),
              ),
            )/*
              Container(
                color: Color.fromARGB(255, 7, 229, 229),
                child: Text(
                  'Now, lots of beaches contains lots of litter. The litters, like plastic ones, are very dangerous to the envronment and marine life. Clean shores makes oceans healthy, also to help preserve marine life.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Text(
              'Preserve The Shores',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            Container(
              color: Color.fromARGB(255, 7, 229, 229),
              child: Text(
                'Beaches have been an important part for a lot of sectors. Beaches attract a lot of tourists, which means beaches contribute for the economy. Beaches are also the home for some animals and marine life.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
            ),
            Text(
              'Raise Awareness to The Importance of Beaches',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            Container(
              color: Color.fromARGB(255, 7, 229, 229),
              child: Text(
                'By participating in these events, participants can raise awareness of the importance of beaches to even more people, so more people will have the knowledge and will be more motivated to preserve beaches.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
