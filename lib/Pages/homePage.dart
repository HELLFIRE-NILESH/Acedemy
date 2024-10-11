import 'package:acedemy/Pages/subjectPage.dart';
import 'package:acedemy/widgets/assignment.dart';
import 'package:acedemy/widgets/sectionTile.dart';
import 'package:acedemy/widgets/subjectCard.dart';
import 'package:flutter/material.dart';

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
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: const SectionTitle("Subjects"), // Use SectionTitle here
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

              // Assignments Section
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: const SectionTitle("Assignments"), // Use SectionTitle here
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

              // Video Lectures Section
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: const SectionTitle("Recent Lectures"), // Use SectionTitle here
              ),
              const SizedBox(height: 8),
              // Placeholder for Video Lectures content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'No video lectures available yet.',
                  style: const TextStyle(
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
