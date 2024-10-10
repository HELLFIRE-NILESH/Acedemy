import 'package:acedemy/Pages/subjectPage.dart';
import 'package:acedemy/widgets/assignment.dart';
import 'package:acedemy/widgets/subjectCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: const Color(0xFFF6F8F9),
      statusBarIconBrightness: Brightness.dark,
    ));

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Acedemy"),
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
              height: 210,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(width: 10), // Spacer
                  ...getSubjectCards(context), // Pass context for navigation
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  // Assuming getAssignmentCards is defined elsewhere
                  ...getAssignmentCards(),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: const Text(
                "Video Lectures",
                style: TextStyle(
                  color: Color(0xFF193238),
                  fontSize: 26,
                  fontFamily: "Nunito",
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  // Function to generate subject cards with navigation
  List<Widget> getSubjectCards(BuildContext context) {
    List<Map<String, String>> subjects = [
      {"name": "Data Science", "professor": "Dr. Anil Mishra", "image": 'assets/images/ds.jpg'},
      {"name": "E-Governance", "professor": "Mr. Mahendra Patidar", "image": 'assets/images/ds.jpg'},
      {"name": "I.O.T", "professor": "Mr. Priyank Suneriya", "image": 'assets/images/ds.jpg'},
    ];

    return subjects.map((subject) {
      return GestureDetector(
        onTap: () {
          // Navigate to the SubjectPage with the subject name
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SubjectPage(subjectName: subject["name"]!),
            ),
          );
        },
        child: SubjectCard(
          subjectName: subject["name"]!,
          description: subject["professor"]!,
          imageUrl: subject["image"]!,
        ),
      );
    }).toList();
  }
}
