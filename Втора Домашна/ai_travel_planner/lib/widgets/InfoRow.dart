import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String imagePath;
  final String label;
  final String value;

  InfoRow({required this.imagePath, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(imagePath, width: 50, height: 50),
        SizedBox(width: 15.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            SizedBox(height: 5.0),
            Text(
              value,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14, // Slightly bigger font for better readability
              ),
            ),
          ],
        ),
      ],
    );
  }
}
