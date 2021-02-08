import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.purple[300],
    accentColor: Colors.indigo[300],
    fontFamily: 'Proza Libre',
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 72, fontWeight: FontWeight.bold, color: Colors.blue),
      headline2: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      headline3: TextStyle(fontSize: 36, fontWeight: FontWeight.w300),
      headline4: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
      bodyText1: TextStyle(fontSize: 18),
      bodyText2: TextStyle(fontSize: 14),
    ));

TextStyle textButtonStyle = const TextStyle(fontSize: 18);
