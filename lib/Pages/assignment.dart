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
        separatorBuilder: (context, index) => const SizedBox(height: 8.0),
        itemBuilder: (context, index) {
          final assignment = assignments[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(
                assignment.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              subtitle: Text(
                'Due Date: ${assignment.dueDate}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              onTap: () {
                // Navigate to the assignment details page if needed
              },
            ),
          );
        },
      ),
    );
  }
}
