import 'package:flutter/material.dart';

class ColorPalette {
  static MaterialColor primaryColor = MaterialColor(
      const Color.fromRGBO(126,222,243, 1).value,
      const <int, Color>{
      50:Color.fromRGBO(126,222,243, .1),
      200:Color.fromRGBO(126,222,243, .3),
      100:Color.fromRGBO(126,222,243, .2),
      300:Color.fromRGBO(126,222,243, .4),
      400:Color.fromRGBO(126,222,243, .5),
      500:Color.fromRGBO(126,222,243, .6),
      600:Color.fromRGBO(126,222,243, .7),
      700:Color.fromRGBO(126,222,243, .8),
      800:Color.fromRGBO(126,222,243, .9),
      900:Color.fromRGBO(126,222,243, 1),
      },
  );


  static MaterialColor secondaryColor = MaterialColor(
      const Color.fromRGBO(49,60,169, 1).value,
      const <int, Color>{
        50: Color.fromRGBO(49,60,169, .1),
        100: Color.fromRGBO(49,60,169, .2),
        200: Color.fromRGBO(49,60,169, .3),
        300: Color.fromRGBO(49,60,169, .4),
        400: Color.fromRGBO(49,60,169, .5),
        500: Color.fromRGBO(49,60,169, .6),
        600: Color.fromRGBO(49,60,169, .7),
        700: Color.fromRGBO(49,60,169, .8),
        800: Color.fromRGBO(49,60,169, .9),
        900: Color.fromRGBO(7, 10, 43, 1.0),
      },
  );
}

