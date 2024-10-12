import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  final String subjectName;
  final String description;
  final String imageUrl;

  const SubjectCard({
    super.key,
    required this.subjectName,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.symmetric(horizontal: 9, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.asset(
              imageUrl,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subjectName,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF193238),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[700],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Function to generate subject cards
List<Widget> getSubjectCards() {
  return const [
    SubjectCard(
      subjectName: 'Data Science',
      description: 'Dr.Anil Mishra',
      imageUrl: 'assets/images/ds.jpg',
    ),
    SubjectCard(
      subjectName: 'E-Governance',
      description: 'Mr.Mahendra Patidar',
      imageUrl: 'assets/images/ds.jpg',
    ),
    SubjectCard(
      subjectName: 'I.O.T',
      description: 'Mr.Priyank suneriya',
      imageUrl: 'assets/images/ds.jpg',
    ),
  ];
}
