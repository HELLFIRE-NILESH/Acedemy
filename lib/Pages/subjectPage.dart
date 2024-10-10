import 'package:flutter/material.dart';

class SubjectPage extends StatelessWidget {
  final String subjectName;

  const SubjectPage({Key? key, required this.subjectName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subjectName),
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
            Text(
              'Syllabus',
              style: TextStyle(
                color: Color(0xFF193238),
                fontSize: 26,
                fontFamily: "Nunito",
              ),
            ),
            const SizedBox(height: 8),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.description_outlined,
                      color: Color(0xFF193238),
                    ),
                    title: Text('$subjectName syllabus'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Action for the View button
                      },
                      child: const Text('View'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8), // Decrease height
                      ),
                    ),
                  ),

                  ListTile(
                    leading: Icon(
                      Icons.web_asset_outlined,
                      color: Color(0xFF193238),
                    ),
                    title: const Text('Reference Sites'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Action for the View button
                      },
                      child: const Text('View'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8), // Decrease height
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            Divider(
              height: 1,
              thickness: 1,
              color: Color(0xFF193238),
            ),
            const SizedBox(height: 20),

            // Add Row for Assignments and Notes
            Column(
              children: [
                // Assignments Card
                Card(
                  color: Colors.white, // Set the card color to white
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SizedBox(
                    height: 60, // Increased height of the card
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.assignment_outlined,
                            color: Color(0xFF193238),
                            size: 34,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Assignments',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF193238),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8), // Add spacing between the cards

                // Notes Card
                Card(
                  color: Colors.white, // Set the card color to white
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SizedBox(
                    height: 60, // Increased height of the card
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.note_outlined,
                            color: Color(0xFF193238),
                            size: 34,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Notes',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF193238),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Video Lectures Section
            Text(
              'Video Lectures',
              style: TextStyle(
                color: Color(0xFF193238),
                fontSize: 26,
                fontFamily: "Nunito",
              ),
            ),
            const SizedBox(height: 8),

            // Video Lecture Tile 1
            ListTile(
              leading: const Icon(Icons.play_circle_fill),
              title: const Text('Lecture 1: Introduction'),
              trailing: ElevatedButton(
                onPressed: () {},
                child: const Text('Play'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8), // Decrease height
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Video Lecture Tile 2
            ListTile(
              leading: const Icon(Icons.play_circle_fill),
              title: const Text('Lecture 2: Newton\'s Laws'),
              trailing: ElevatedButton(
                onPressed: () {},
                child: const Text('Play'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8), // Decrease height
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
