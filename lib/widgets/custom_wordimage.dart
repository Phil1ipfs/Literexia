

import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String label;
  final String imagePath;
  final Size screenSize;

  ImageCard({required this.label, required this.imagePath, required this.screenSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize.width * 0.4,
      height: screenSize.height * 0.2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screenSize.width * 0.03),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: screenSize.height * 0.1),
          SizedBox(height: screenSize.height * 0.01),
          Text(
            label,
            style: TextStyle(
              fontSize: screenSize.width * 0.045,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
