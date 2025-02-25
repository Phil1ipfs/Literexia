import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> teacherMessages = [
      {
        "teacherName": "Teacher Nicholas",
        "messageSnippet": "have great day ahead!",
        "imageUrl": "assets/images/image1.png"
      },
      {
        "teacherName": "Teacher Mark",
        "messageSnippet": "Good day po!",
        "imageUrl": "assets/images/image2.png"
      },
      {
        "teacherName": "Teacher Rainer",
        "messageSnippet": "have great day ahead!",
        "imageUrl": "assets/images/image3.png"
      },
      {
        "teacherName": "Teacher Rainer",
        "messageSnippet": "have great day ahead!",
        "imageUrl": "assets/images/image1.png"
      },
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search message",
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: teacherMessages.map((msg) {
                return _buildMessageCard(
                  teacherName: msg["teacherName"]!,
                  messageSnippet: msg["messageSnippet"]!,
                  imageUrl: msg["imageUrl"]!,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageCard({
    required String teacherName,
    required String messageSnippet,
    required String imageUrl,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imageUrl),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  teacherName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'Atkinson',
                  ),
                ),
                Text(
                  messageSnippet,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontFamily: 'Atkinson',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          TextButton(
            onPressed: () {
              // Handle button action
            },
            child: const Text(
              "New Message",
              style: TextStyle(
                fontFamily: 'Atkinson',
                fontSize: 16, 
                color:  Color(0xFF6C7BA2),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
