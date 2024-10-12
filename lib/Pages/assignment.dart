import 'package:flutter/material.dart';

class Assignment {
  final String title;
  final String dueDate;

  Assignment(this.title, this.dueDate);
}

class AssignmentPage extends StatelessWidget {
  final List<Assignment> assignments = List.generate(
    15,
        (index) => Assignment('Assignment ${index + 1}', '2024-10-${20 + index}'),
  )..sort((a, b) => b.dueDate.compareTo(a.dueDate));

   AssignmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignments'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ListView.separated(
        itemCount: assignments.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16.0), // Space between list items
        itemBuilder: (context, index) {
          final assignment = assignments[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: const EdgeInsets.all(16.0), // Padding inside each tile (around the text and icon)
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Rounded Icon container
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEBEDED), // Light grey background
                      borderRadius: BorderRadius.circular(12), // Rounded corners
                    ),
                    child: const Icon(
                      Icons.assignment_outlined,
                      size: 28,
                      color: Color(0xFF193238), // Darker icon color
                    ),
                  ),
                  const SizedBox(width: 20), // Space between icon and text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Assignment title
                      Text(
                        assignment.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF193238), // Dark text color
                        ),
                      ),
                      const SizedBox(height: 4),
                      // Assignment due date
                      Text(
                        'Date: ${assignment.dueDate}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600], // Grey for secondary text
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
