import 'package:flutter/material.dart';
import 'package:restore_the_shore_flutter/colorpalette.dart';
import 'package:restore_the_shore_flutter/nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restore The Shore',
      initialRoute: '/',
      routes: {
        'home' : (context) => const MyHomePage(),
        'leaderboard' : (context) => const MyHomePage(), // Nanti ini ganti aja Page nya
        'my-account' : (context) => const MyHomePage(),
        // Nanti tambahin masing masing page nya ke sini
      },
      theme: ThemeData(
        primarySwatch: ColorPalette.secondaryColor,
      ),
      home: const MyHomePage(),
    );
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
      bottomNavigationBar: const NavBar(), // ini cara buatr NavBar nya, jangan lupa import dulu
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
            Text(
              'Restore the Shore',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Container(
              color: Color.fromARGB(255, 35, 32, 115),
              child: Text(
                'Hello environmentalists! Beaches have always been an important element for the environment and sea life. Restore the Shore is an interactive website where users can participate in events to clean beaches and post about them in the website. Users can get points and earn badges for joining events!',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
            ),
            Text(
              '-------Our Visions-------',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Text(
              'Make The Shores Clean',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
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
            ),
          ],
        ),
      ),
    );
  }


}
