// list_tile_with_button.dart
import 'package:flutter/material.dart';

class ListTileWithButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  const ListTileWithButton({
    required this.icon,
    required this.title,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: const Color(0xFF193238),
      ),
      title: Text(title),
      trailing: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        ),
        child: const Text('View'),
      ),
    );
  }
}
