import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      hintColor: Colors.orange,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Colors.blue,
      ),
      textTheme: TextTheme(
        bodyLarge:
            TextStyle(color: Colors.black), // bodyText1 o'rniga bodyLarge
        bodyMedium:
            TextStyle(color: Colors.black54), // bodyText2 o'rniga bodyMedium
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blue,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
      ));

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.grey[900],
    hintColor: Colors.blueAccent,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      color: Colors.grey[900],
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.white), // bodyText1 o'rniga bodyLarge
      bodyMedium:
          TextStyle(color: Colors.white70), // bodyText2 o'rniga bodyMedium
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blueAccent,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
    ),
  );
}
