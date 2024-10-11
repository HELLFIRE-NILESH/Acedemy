import 'package:flutter/material.dart';

class MyTheme {
  MyTheme._();

  static const Color primaryColor = Color(0xFF193238);
  static const Color backgroundColor = Color(0xFFF6F8F9);
  static const Color accentColor = Color(0xFF193238); // Orange accent
  static const Color buttonColor = Color(0xFFEDEDF2); // Light grey color for buttons

  static ThemeData lightTheme = ThemeData(
    // General AppBar Theme
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: backgroundColor,
      titleSpacing: 2,
      titleTextStyle: TextStyle(
        fontFamily: "Nunito",
        fontSize: 22,
        color: primaryColor,
      ),
      iconTheme: IconThemeData(
        color: primaryColor,
      ),
    ),

    scaffoldBackgroundColor: backgroundColor,
    cardColor: Colors.white,

    // Primary color scheme
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: accentColor,
      surface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: primaryColor,
    ),

    // Button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: primaryColor,
        backgroundColor: buttonColor, // Text color on button
        textStyle: TextStyle(
          fontFamily: "Nunito",
          fontSize: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryColor,
        side: BorderSide(color: primaryColor),
        textStyle: TextStyle(
          fontFamily: "Nunito",
          fontSize: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: accentColor,
        textStyle: TextStyle(
          fontFamily: "Nunito",
          fontSize: 16,
        ),
      ),
    ),

    // FloatingActionButton Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
    ),

    // Divider Theme
    dividerTheme: DividerThemeData(
      color: primaryColor.withOpacity(0.5),
      thickness: 1,
    ),

    // Icon Theme
    iconTheme: IconThemeData(
      color: primaryColor,
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      filled: true,
      fillColor: Color(0xFFECECEC),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12), // Increased border radius
        borderSide: BorderSide(color: Color(0xFFECECEC)), // Set border color to white
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12), // Increased border radius
        borderSide: BorderSide(color: accentColor, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12), // Increased border radius
        borderSide: BorderSide(color:  Color(0xFFECECEC).withOpacity(0.5)), // Set border color to white
      ),
      labelStyle: TextStyle(
        color: primaryColor.withOpacity(0.8),
        fontFamily: "Nunito",
      ),
      hintStyle: TextStyle(
        color: primaryColor.withOpacity(0.5),
        fontFamily: "Nunito",
      ),
    ),

    // BottomNavigationBar Theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: backgroundColor,
      selectedItemColor: primaryColor,
      unselectedItemColor: primaryColor.withOpacity(0.5),
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),

    tabBarTheme: TabBarTheme(
      labelColor: primaryColor,
      unselectedLabelColor: primaryColor.withOpacity(0.5),
      labelStyle: TextStyle(
        fontFamily: "Nunito",
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: primaryColor, width: 2),
      ),
    ),

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: primaryColor,
    ),
  );
}
