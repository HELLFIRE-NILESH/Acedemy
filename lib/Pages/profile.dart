import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String username;

  const ProfilePage({super.key, required this.username});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF193238)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30), // Add space at the top of the picture
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded; // Toggle between circle and square
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut, // Smoother transition curve
              width: isExpanded ? 300 : 120,
              height: isExpanded ? 300 : 120,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(isExpanded ? 20 : 60), // Circular to square transition
                image: const DecorationImage(
                  image: AssetImage('assets/images/profilepic.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            widget.username,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              fontFamily: 'Nunito',
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "9340236043",
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Nunito',
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add side padding
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Bio",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nunito',
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8), // Space between title and content
                    Text(
                      "This is the bio section where the user’s description will appear. It can include interests, hobbies, or any additional information the user wishes to share.",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Nunito',
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
