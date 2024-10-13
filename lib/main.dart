import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme/themeData.dart';
import 'package:acedemy/nav/navbar.dart';

void main() {
  // Set the status bar color and brightness for the entire app
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: MyTheme.backgroundColor, // Set your desired status bar color
    statusBarIconBrightness: Brightness.dark, // Change to light for dark backgrounds
  ));
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
    return MaterialApp(
      themeMode:ThemeMode.light,
      theme: MyTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const NavView(),
      },
    );
  }
}

