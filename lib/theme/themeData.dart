import 'package:flutter/material.dart';
class Mytheme {
  Mytheme._();
  static ThemeData lighttheme = ThemeData(
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xFFF6F8F9),
      titleSpacing: 2,
      titleTextStyle: TextStyle(
        fontFamily:"Nunito",
        fontSize: 22,
        color: Color(0xFF193238)
      )
    ),
    scaffoldBackgroundColor: Color(0xFFF6F8F9),
  );
}