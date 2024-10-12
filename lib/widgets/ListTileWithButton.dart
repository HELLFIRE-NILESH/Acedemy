import 'package:acedemy/theme/themeData.dart';
import 'package:flutter/material.dart';

class ListTileWithButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  const ListTileWithButton({
    required this.icon,
    required this.title,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: MyTheme.primaryColor, // Use primary color from theme
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: "Nunito", // Use font from theme
          fontSize: 16, // Font size for title
          fontWeight: FontWeight.w600, // Semi-bold for better readability
        ),
      ),
      trailing: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(

          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Adjusted padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Reduced corner radius for a sleeker look
          ),
          elevation: 2, // Reduced elevation for a subtler shadow effect
        ),
        child: const Text(
          'View',
          style: TextStyle(
            fontSize: 14, // Slightly smaller font size for button text
            fontWeight: FontWeight.bold, // Bold text for emphasis
          ),
        ),
      ),
    );
  }
}
