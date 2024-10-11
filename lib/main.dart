import 'package:flutter/material.dart';
import 'package:acedemy/Pages/homePage.dart';
import 'package:flutter/services.dart';
import 'theme/themeData.dart';
import 'package:acedemy/nav/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // Set the color of the navigation bar
      systemNavigationBarIconBrightness: Brightness.dark, // Change icon brightness
    ));
    return MaterialApp(
      themeMode:ThemeMode.light,
      theme: MyTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => NavView(),
      },
    );
  }
}

