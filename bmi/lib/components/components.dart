import 'package:flutter/material.dart';

Widget buildInfoColumn(String value, String label) {
  return Column(
    children: [
      Text(
        value,
        style: TextStyle(
          color: Colors.grey[700],
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 4.0),
      Text(
        label,
        style: TextStyle(
          color: Colors.grey[500],
          fontSize: 12.0,
        ),
      ),
    ],
  );
}
