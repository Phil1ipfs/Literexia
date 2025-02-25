
import 'package:flutter/material.dart';

class LearningCard extends StatelessWidget {
  final String title;
  final String time;
  final int rating;
  final bool locked;

  LearningCard({required this.title, required this.time, required this.rating, this.locked = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: locked ? Colors.grey[300] : Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: locked ? Colors.black54 : Colors.white)),
            SizedBox(height: 5),
            Text(time, style: TextStyle(color: locked ? Colors.black54 : Colors.white70)),
            SizedBox(height: 5),
            Row(
              children: List.generate(5, (index) => Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: locked ? Colors.black26 : Colors.yellow,
              )),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: locked ? null : () {},
              style: ElevatedButton.styleFrom(backgroundColor: locked ? Colors.grey : Colors.white),
              child: Text("PLAY", style: TextStyle(color: locked ? Colors.black54 : Colors.blueGrey)),
            )
          ],
        ),
      ),
    );
  }
}
