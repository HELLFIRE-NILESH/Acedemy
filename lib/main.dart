import 'package:flutter/material.dart';
import 'package:acedemy/Pages/homePage.dart';
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

