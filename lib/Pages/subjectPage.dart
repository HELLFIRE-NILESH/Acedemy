import 'package:acedemy/Pages/assignment.dart';
import 'package:acedemy/Pages/syllabusPage.dart';
import 'package:acedemy/Pages/videoLecture.dart';
import 'package:acedemy/widgets/InfoSection.dart';
import 'package:acedemy/widgets/ListTileWithButton.dart';
import 'package:acedemy/widgets/VideoLectureCard.dart';
import 'package:acedemy/widgets/sectionTile.dart';
import 'package:flutter/material.dart';

class SubjectPage extends StatefulWidget {
  final String subjectName;

  const SubjectPage({Key? key, required this.subjectName}) : super(key: key);

  @override
  _SubjectPageState createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  final List<String> videoLectures = [
    'Lecture 1: Introduction',
    'Lecture 2: I.O.T',
    'Lecture 3: Data Analysis',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.subjectName,
          style: const TextStyle(
            fontSize: 24,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Syllabus Section
            SectionTitle('Syllabus'),
            const SizedBox(height: 8),
            InfoSection(
              [
                ListTileWithButton(
                  icon: Icons.description_outlined,
                  title: '${widget.subjectName} syllabus',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SyllabusPage(),));
                  },
                ),
                ListTileWithButton(
                  icon: Icons.web_asset_outlined,
                  title: 'Reference Sites',
                  onPressed: () {
                    // Action for reference view
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Centered divider
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 350, // Adjust width as needed
                  child: const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFF193238),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Assignments and Notes Section
            SectionTitle('Assignments and Notes'),
            const SizedBox(height: 8),
            InfoSection(
              [
                ListTileWithButton(
                  icon: Icons.assignment_outlined,
                  title: 'Assignments',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AssignmentPage()));
                  },
                ),
                ListTileWithButton(
                  icon: Icons.note_outlined,
                  title: 'Notes',
                  onPressed: () {
                    // Handle notes
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Centered divider
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 350, // Adjust width as needed
                  child: const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFF193238),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Video Lectures Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SectionTitle('Video Lectures'),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    // Navigate to Video Lecture Page
                    Navigator.push(context, MaterialPageRoute(builder: (context) => VideoLecture()));
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Normal Video Lecture Cards
            _buildNormalVideoLectureCards(),
          ],
        ),
      ),
    );
  }

  // Function to build normal video lecture cards
  Widget _buildNormalVideoLectureCards() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: videoLectures.map((lecture) {
          return VideoLectureCard(
            title: lecture,
            thumbnailUrl: 'assets/images/ds.jpg', // Replace with actual image URL
            onCardTap: () {
              // Handle video lecture card tap
            },
          );
        }).toList(),
      ),
    );
  }
}
