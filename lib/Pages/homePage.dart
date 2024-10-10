import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:acedemy/widgets/subjectCard.dart';
import 'package:acedemy/widgets/assignment.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Set the status bar style
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: const Color(0xFFF6F8F9),
      statusBarIconBrightness: Brightness.dark,
    ));

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Acedemy"),
          elevation: 0,

        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: const Text(
                "Subjects",
                style: TextStyle(
                  color: Color(0xFF193238),
                  fontSize: 26,
                  fontFamily: "Nunito",
                ),
              ),
            ),
            const SizedBox(height: 18),
            // Subject Cards List
            Container(
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(width: 10), // Spacer
                  ...getSubjectCards(),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: const Text(
                "Assignments",
                style: TextStyle(
                  color: Color(0xFF193238),
                  fontSize: 26,
                  fontFamily: "Nunito",
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Full Assignments List
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
                child: ListView(
                  children: getAssignmentCards(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
