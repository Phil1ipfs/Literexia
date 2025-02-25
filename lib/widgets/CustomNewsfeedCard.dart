  import 'package:flutter/material.dart';

  class CustomNewsfeedCard extends StatelessWidget {
    final String contentText;
    final bool showContentText;
    final String imageAsset;
    final String bottomText;

    const CustomNewsfeedCard({
      Key? key,
      required this.contentText,
      required this.showContentText,
      required this.imageAsset,
      required this.bottomText,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Image.asset(imageAsset, fit: BoxFit.cover),
            if (showContentText)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(contentText, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(bottomText, textAlign: TextAlign.center),
            ),
          ],
        ),
      );
    }
  }
