import 'package:flutter/material.dart';

var theme = ThemeData(
    appBarTheme: AppBarTheme(
        elevation: 2,
        titleTextStyle: TextStyle(fontSize: 25, color: Colors.black)
    ),
    textTheme: TextTheme(
        bodyMedium: TextStyle(color: Colors.blue, fontSize: 30),
        bodyLarge: TextStyle(color: Colors.red)
    )
);