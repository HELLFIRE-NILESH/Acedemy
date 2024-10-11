import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:acedemy/widgets/sectionTile.dart';

class SyllabusPage extends StatelessWidget {
  const SyllabusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Syllabus"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUnitCard("Unit 1:", [
                "Basics of Programming Languages",
                "Variables and Data Types",
                "Control Structures",
                "Functions and Procedures",
              ]),
              const Divider(), // Divider between units
              _buildUnitCard("Unit 2:", [
                "Classes and Objects",
                "Inheritance",
                "Polymorphism",
                "Encapsulation",
              ]),
              const Divider(), // Divider between units
              _buildUnitCard("Unit 3:", [
                "Arrays and Linked Lists",
                "Stacks and Queues",
                "Trees and Graphs",
                "Hash Tables",
              ]),
              const Divider(), // Divider between units
              _buildUnitCard("Unit 4:", [
                "HTML and CSS Basics",
                "JavaScript and DOM Manipulation",
                "Responsive Web Design",
                "Introduction to Frameworks",
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUnitCard(String unitTitle, List<String> topics) {
    return Card(
      elevation: 5, // Increased elevation for a more pronounced shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Increased corner radius for softer edges
      ),
      color: Colors.white, // Card background color
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Unit Title
            SectionTitle(unitTitle), // Using SectionTitle here
            const SizedBox(height: 8), // Space below title
            ...topics.map((topic) => _buildBulletPoint(topic)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String topic) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0), // Space between bullet points
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(CupertinoIcons.list_bullet, size: 16, color: Color(0xFF193238)), // Bullet point icon
          const SizedBox(width: 8), // Space between bullet and text
          Expanded(
            child: Text(
              topic,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF555555),
                fontWeight: FontWeight.w500, // Medium weight for emphasis
              ),
            ),
          ),
        ],
      ),
    );
  }
}
