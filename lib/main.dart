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
      body: ListView(
        //child: Column(
        //  mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Image.asset(
                'lib/assets/Logo2.png',
                height: 60,
                width: 120,
              )
            ),/*
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://image.cnbcfm.com/api/v1/image/107028541-1646934420167-gettyimages-101680465-ac4714a8-f421-4a76-ab21-eaa1793d80c8.jpeg?v=1646934663')
                )
              )
            ),*/
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
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 35, 32, 115),
                ),
              ),
              margin: const EdgeInsets.all(20.0),
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
                  Image.network( // <-- SEE HERE
                    'data:image/jpeg;base64,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',
                    height: 250,
                    width: 300,
                  ),
                  const ListTile(  
                    //leading: Icon(Icons.album, size: 60),  
                    title: Text(  
                      'Make the Shores Clean',  
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0)  
                    ),  
                    subtitle: Text(  
                      'Now, lots of beaches contains lots of litter. The litters, like plastic ones, are very dangerous to the envronment and marine life. Clean shores makes oceans healthy, also to help preserve marine life.',  
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13.0)  
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
                  Image.network( // <-- SEE HERE
                    'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/beach-quotes-1559667853.jpg',
                    height: 250,
                    width: 300,
                  ),
                  const ListTile(  
                    //leading: Icon(Icons.album, size: 60),  
                    title: Text(  
                      'Preserve The Shores',  
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0)  
                    ),  
                    subtitle: Text(  
                      'Beaches have been an important part for a lot of sectors. Beaches attract a lot of tourists, which means beaches contribute for the economy. Beaches are also the home for some animals and marine life.',  
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13.0)  
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
                  Image.network( // <-- SEE HERE
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDrVqztj4ac9oTz1nAyZ5ZqFDQoNhCHX16RQ&usqp=CAU',
                    height: 250,
                    width: 300,
                  ),
                  const ListTile(  
                    //leading: Icon(Icons.album, size: 60),  
                    title: Text(  
                      'Raise Awareness to The Importance of Beaches',  
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0)  
                    ),  
                    subtitle: Text(  
                      'By participating in these events, participants can raise awareness of the importance of beaches to even more people, so more people will have the knowledge and will be more motivated to preserve beaches.',  
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13.0)  
                    ),  
                  ),
                ],
              ),
            ),
            Container(
              child: Text(
                '© 2022 - Restore The Shore - All rights reserved',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 35, 32, 115),
                ),
              ),
              margin: const EdgeInsets.only(top: 15.0),
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
        //),
      ),
    );
  }
}
