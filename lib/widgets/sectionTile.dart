
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
