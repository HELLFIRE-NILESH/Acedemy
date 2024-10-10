import 'package:flutter/material.dart';

class ClassTimeCard extends StatelessWidget {
  final String courseName;
  final String time;
  final String room;

  const ClassTimeCard({
    Key? key,
    required this.courseName,
    required this.time,
    required this.room,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              courseName,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF193238),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              time,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              room,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
List<Widget> getClassTimeCards() {
  return const [
    ClassTimeCard(
      courseName: 'Mathematics',
      time: '08:00 AM - 09:00 AM',
      room: 'Room 101',
    ),
    ClassTimeCard(
      courseName: 'Physics',
      time: '09:15 AM - 10:15 AM',
      room: 'Room 102',
    ),
    ClassTimeCard(
      courseName: 'History',
      time: '10:30 AM - 11:30 AM',
      room: 'Room 103',
    ),
    ClassTimeCard(
      courseName: 'Chemistry',
      time: '11:45 AM - 12:45 PM',
      room: 'Room 104',
    ),
    ClassTimeCard(
      courseName: 'Biology',
      time: '01:00 PM - 02:00 PM',
      room: 'Room 105',
    ),
  ];
}
