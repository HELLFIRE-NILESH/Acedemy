import 'package:acedemy/widgets/assignment.dart';
import 'package:acedemy/widgets/sectionTile.dart';
import 'package:acedemy/widgets/subjectCard.dart';
import 'package:flutter/material.dart';

import 'subjectPage.dart'; // Import other required pages


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Acedemy"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),

              // Subjects Section
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: SectionTitle("Subjects"),
              ),
              const SizedBox(height: 18),

              // Subject Cards List
              SizedBox(
                height: 210,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(width: 10),
                    ...getSubjectCards(context),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Assignments Section
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: SectionTitle("Assignments"),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: getAssignmentCards(context), // Pass context here
                ),
              ),
              const SizedBox(height: 24),

              // Video Lectures Section
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: SectionTitle("Recent Lectures"),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'No video lectures available yet.',
                  style: TextStyle(
                    color: Color(0xFF193238),
                    fontSize: 16,
                    fontFamily: "Nunito",
                  ),
                ),
              ),
            ],
          ),
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
