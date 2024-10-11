import 'package:acedemy/Pages/assignment.dart';
import 'package:flutter/material.dart';

class AssignmentCard extends StatelessWidget {
  final String title;
  final String dueDate;
  final int total;
  final VoidCallback onTap;

  const AssignmentCard({
    Key? key,
    required this.title,
    required this.dueDate,
    required this.total,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFEBEDED),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.assignment_outlined,
                size: 28,
                color: Color(0xFF193238),
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF193238),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "Total: $total  Submit date: $dueDate",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Function to get a list of AssignmentCard widgets
List<Widget> getAssignmentCards(BuildContext context) {
  return [
    AssignmentCard(
      title: "Data Science",
      dueDate: "2023-10-15",
      total: 28,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AssignmentPage(), // Navigate to AssignmentPage
          ),
        );
      },
    ),
    AssignmentCard(
      title: "Renewable Energy",
      dueDate: "2023-10-20",
      total: 31,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AssignmentPage(), // Navigate to AssignmentPage
          ),
        );
      },
    ),
    AssignmentCard(
      title: "I.O.T",
      dueDate: "2023-10-25",
      total: 32,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AssignmentPage(), // Navigate to AssignmentPage
          ),
        );
      },
    ),
  ];
}
