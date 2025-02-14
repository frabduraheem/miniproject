import 'package:flutter/material.dart';

class Squarefile extends StatelessWidget {
  final String imagePath;
  const Squarefile({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(16),
            color: Colors.black),
        child: Image.asset(
          imagePath,
          height: 72,
        ));
  }
}
