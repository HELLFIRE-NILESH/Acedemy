import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  static const Color primaryColor = Color(0xFF193238); // Define primaryColor
  bool isExpanded = false; // For tracking image size

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView( // Added SingleChildScrollView to handle overflow
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Section for the image and profile data
              _buildProfileSection(),

              const SizedBox(height: 16), // Decreased space between cards

              // Bio section with Card-like design
              _buildBioCard(),

              const SizedBox(height: 16), // Decreased space between cards

              // SGPA and CGPA section
              _buildSGPACGPASection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    final double cardWidth = MediaQuery.of(context).size.width - 40; // Remaining width after 20px left and right

    return SizedBox( // Wrap the Card in a SizedBox
      width: cardWidth, // Set the width for the card
      child: Card(
        elevation: 2, // Adjusted elevation for subtle shadow
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding inside the card
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded; // Toggle expansion state
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut, // Smooth animation
                  width: isExpanded ? 250 : 120, // Enlarged and collapsed sizes
                  height: isExpanded ? 250 : 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(isExpanded ? 20 : 60), // Circular to square
                    image: const DecorationImage(
                      image: AssetImage('assets/images/profilepic.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Profile Details: Name, Phone Number, Semester, Roll Number
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Name
                  const Text(
                    "Suraj Verma",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: 'Nunito',
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 5),

                  // Phone Number
                  const Text(
                    "9340236043",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 5),

                  // Semester and Branch
                  const Text(
                    "CSE, 5th Semester",
                    style: TextStyle(
                      fontSize: 18,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 5),

                  // Roll Number
                  const Text(
                    "Roll No: 22113C04033",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build the bio section in a Card
  Widget _buildBioCard() {
    final double cardWidth = MediaQuery.of(context).size.width - 40; // Remaining width after 20px left and right

    return SizedBox( // Wrap the Card in a SizedBox
      width: cardWidth, // Set the width for the card
      child: Card(
        elevation: 2, // Adjusted elevation for subtle shadow
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding inside the card
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              // Bio Title
              Text(
                "Bio",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Nunito',
                  color: primaryColor,
                ),
              ),
              SizedBox(height: 8), // Space between title and content

              // Bio Description
              Text(
                "I can do anything, but I often show that I can’t—embracing life's challenges with a smile.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to build SGPA and CGPA section
  Widget _buildSGPACGPASection() {
    final double cardWidth = MediaQuery.of(context).size.width - 40; // Remaining width after 20px left and right

    return SizedBox( // Wrap the Card in a SizedBox
      width: cardWidth, // Set the width for the card
      child: Card(
        elevation: 2, // Adjusted elevation for subtle shadow
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding inside the card
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SGPA Title
              const Text(
                "SGPA",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Nunito',
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 8), // Space between title and content

              // SGPA Data
              _buildSemesterResult("Semester 1", "7.8"),
              const Divider(height: 16, thickness: 1), // Divider
              _buildSemesterResult("Semester 2", "8.0"),
              const Divider(height: 16, thickness: 1), // Divider
              _buildSemesterResult("Semester 3", "8.4"),
              const Divider(height: 16, thickness: 1), // Divider
              _buildSemesterResult("Semester 4", "8.5"),
              const Divider(height: 16, thickness: 1), // Divider
              _buildSemesterResult("Semester 5", "--"),
              const Divider(height: 16, thickness: 1), // Divider
              _buildSemesterResult("Semester 6", "--"),
            ],
          ),
        ),
      ),
    );
  }

  // Method to build a single semester result with alignment
  Widget _buildSemesterResult(String semester, String result) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          semester,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        Text(
          result,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
