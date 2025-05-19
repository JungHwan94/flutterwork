import 'package:flutter/material.dart';

var theme = ThemeData(
    appBarTheme: AppBarTheme(
      //color: Color(0xFFf3edf7),
        elevation: 2,
        titleTextStyle: TextStyle(fontSize: 25, color: Colors.black)
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            backgroundColor: Colors.black26
        )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: TextButton.styleFrom(
            backgroundColor: Colors.amber
        )
    ),
    textTheme: TextTheme(
        bodyMedium: TextStyle(color: Colors.blue),
        bodyLarge: TextStyle(color: Colors.red)
    )
);