import 'package:acedemy/Pages/videoLecture.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SubjectPage extends StatelessWidget {
  final String subjectName;

  const SubjectPage({Key? key, required this.subjectName}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          subjectName,
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
            sectionTitle('Syllabus'),
            const SizedBox(height: 8),
            _buildInfoSection(
              [
                _buildListTile(
                  icon: Icons.description_outlined,
                  title: '$subjectName syllabus',
                  onPressed: () {
                    // Action for syllabus view
                  },
                ),
                _buildListTile(
                  icon: Icons.web_asset_outlined,
                  title: 'Reference Sites',
                  onPressed: () {
                    // Action for reference view
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(
              height: 1,
              thickness: 1,
              color: Color(0xFF193238),
            ),
            const SizedBox(height: 20),

            // Assignments and Notes Section
            sectionTitle('Assignments and Notes'),
            _buildCardWithIcon(
              icon: Icons.assignment_outlined,
              title: 'Assignments',
              onTap: () {
                // Handle assignments
              },
            ),
            const SizedBox(height: 8),
            _buildCardWithIcon(
              icon: Icons.note_outlined,
              title: 'Notes',
              onTap: () {
                // Handle notes
              },
            ),
            const SizedBox(height: 20),
            const Divider(
              height: 1,
              thickness: 1,
              color: Color(0xFF193238),
            ),
            const SizedBox(height: 20),

            // Video Lectures Section with arrow to bigger page
            sectionTitleWithArrow(
              title: 'Video Lectures',
              onArrowPressed: () {
                // Navigate to the larger video lecture page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoLecture(),
                  ),
                );
              },
            ),
            const SizedBox(height: 8),

            // Video Lecture Cards in Row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildVideoLectureCard(
                    title: 'Lecture 1: Introduction',
                    thumbnailUrl: 'assets/images/ds.jpg',
                    onCardTap: () {
                      // Handle play for lecture 1
                    },
                  ),
                  const SizedBox(width: 12),
                  _buildVideoLectureCard(
                    title: 'Lecture 2: I.O.T',
                    thumbnailUrl: 'assets/images/ds.jpg',
                    onCardTap: () {
                      // Handle play for lecture 2
                    },
                  ),
                  const SizedBox(width: 12),
                  _buildVideoLectureCard(
                    title: 'Lecture 3: Data Analysis',
                    thumbnailUrl: 'assets/images/ds.jpg',
                    onCardTap: () {
                      // Handle play for lecture 3
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Section title with arrow button
  Widget sectionTitleWithArrow({
    required String title,
    required VoidCallback onArrowPressed,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF193238),
            fontSize: 26,
            fontWeight: FontWeight.bold,
            fontFamily: "Nunito",
          ),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward_ios,size: 20,),
          color: Color(0xFF193238), // Explicitly set icon color
          onPressed: onArrowPressed,
        ),
      ],
    );
  }
  Widget sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xFF193238),
        fontSize: 26,
        fontWeight: FontWeight.bold,
        fontFamily: "Nunito",
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onPressed,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: const Color(0xFF193238),
      ),
      title: Text(title),
      trailing: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        ),
        child: const Text('View'),
      ),
    );
  }

  Widget _buildInfoSection(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildCardWithIcon({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        height: 60,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: const Color(0xFF193238),
                  size: 34,
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF193238),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to build Video Lecture Cards with Thumbnail
  Widget _buildVideoLectureCard({
    required String title,
    required String thumbnailUrl,
    required VoidCallback onCardTap,
  }) {
    return SizedBox(
      width: 160, // Adjust width
      height: 200, // Consistent height for all cards
      child: InkWell(
        onTap: onCardTap,
        borderRadius: BorderRadius.circular(8),
        child: Card(
          elevation: 5, // Slightly higher elevation for better depth
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Video Thumbnail
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: Image.asset(
                  thumbnailUrl,
                  width: double.infinity,
                  height: 120, // Prominent thumbnail height
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontFamily: "Nunito",
                    fontSize: 14, // Slightly larger font for better readability
                    color: Color(0xFF193238),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

