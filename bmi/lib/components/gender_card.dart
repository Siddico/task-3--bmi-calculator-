import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  final String gender;
  final String image;
  final Color backgroundColor;

  final Color textColor;
  final Function() ontap;

  GenderCard(
      {required this.gender,
      required this.image,
      required this.backgroundColor,
      required this.textColor,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 180,
        width: 370,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              gender,
              style: TextStyle(
                color: textColor,
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            Image.asset('$image', height: 150, width: 150)
          ],
        ),
      ),
    );
  }
}
