import 'package:acedemy/Pages/videoPlayer.dart';
import 'package:flutter/material.dart';

class VideoLecture extends StatefulWidget {
  const VideoLecture({super.key});

  @override
  State<VideoLecture> createState() => _VideoLectureState();
}

class _VideoLectureState extends State<VideoLecture> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _lectures = [
    'Lecture 1: Introduction to IoT',
    'Lecture 2: Advanced Data Analysis',
    'Lecture 3: AI in IoT',
  ];
  List<String> _filteredLectures = [];

  @override
  void initState() {
    super.initState();
    _filteredLectures = _lectures; // Initially, show all lectures
  }

  void _filterLectures(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredLectures = _lectures; // Show all if search is empty
      });
    } else {
      setState(() {
        _filteredLectures = _lectures
            .where((lecture) => lecture.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Lectures"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _searchController,
              onChanged: _filterLectures,
              decoration: const InputDecoration(
                labelText: 'Search Lectures',
                filled: true,
                fillColor: Color(0xFFECECEC), // Light background color for the search box
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 16),
            // ListView for lectures
            Expanded(
              child: ListView.builder(
                itemCount: _filteredLectures.length,
                itemBuilder: (context, index) {
                  return _buildVideoLectureCard(
                    title: _filteredLectures[index],
                    channelName: 'Tech Channel', // Placeholder channel name
                    thumbnailUrl: 'assets/images/ds.jpg',
                    onCardTap: () {
                      // Navigate to full-screen video player
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullScreenVideoPlayer(
                            videoPath: 'assets/video/song.mp4',
                            title: 'Smile By Umair',
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build Video Lecture Cards
  Widget _buildVideoLectureCard({
    required String title,
    required String channelName,
    required String thumbnailUrl,
    required VoidCallback onCardTap,
  }) {
    return SizedBox(
      width: double.infinity, // Full width
      height: 200, // Set height
      child: InkWell(
        onTap: onCardTap,
        borderRadius: BorderRadius.circular(8),
        child: Card(
          elevation: 3,
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
                  height: 120, // Set the height of the thumbnail
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 16, // Adjusted font size
                        color: Color(0xFF193238),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4), // Space between title and channel name
                    Text(
                      channelName,
                      style: const TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 14,
                        color: Color(0xFF555555), // A softer color for the channel name
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
