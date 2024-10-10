import 'package:flutter/material.dart';

class AssignmentCard extends StatelessWidget {
  final String title;
  final String dueDate;
  final int Total;

  const AssignmentCard({
    Key? key,
    required this.title,
    required this.dueDate,
    required this.Total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon or image on the left
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
          // Text section
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
                "Total: $Total  Due: $dueDate",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Function to get a list of AssignmentCard widgets
List<Widget> getAssignmentCards() {
  return const [
    AssignmentCard(
      title: "Data Science",
      dueDate: "2023-10-15",
      Total: 28,
    ),
    AssignmentCard(
      title: "Renewable Energy",
      Total: 31,
      dueDate: "2023-10-20",
    ),
    AssignmentCard(
      title: "I.O.T",
      dueDate: "2023-10-25",
      Total: 32,
    ),
  ];
}
