import 'package:flutter/material.dart';
import 'package:literexia/screens/message_screen.dart';
import 'package:literexia/screens/profile_parent_screen.dart';
import 'package:literexia/widgets/ui_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String selectedStudent = "Mark Caram";

  final List<String> students = ["Mark Caram", "Nicholas Caram"];

  final Map<String, Map<String, dynamic>> studentData = {
    "Mark Caram": {
      "progress": "78%",
      "streak": "5 Days",
      "exercises": 12,
      "achievements": 99,
      "activities": [
        {
          "title": "Reading Comprehension",
          "subtitle": "exercises 15 hours ago",
          "percentage": 23
        },
        {
          "title": "Vocabulary Test",
          "subtitle": "assessment 15 hours ago",
          "percentage": 35
        },
        {
          "title": "Phonics Training",
          "subtitle": "practice, yesterday",
          "percentage": 85
        },
      ],
    },
    "Nicholas Caram": {
      "progress": "85%",
      "streak": "10 Days",
      "exercises": 15,
      "achievements": 120,
      "activities": [
        {
          "title": "Grammar Test",
          "subtitle": "assessment 10 hours ago",
          "percentage": 40
        },
        {
          "title": "Spelling Drill",
          "subtitle": "practice 12 hours ago",
          "percentage": 50
        },
        {
          "title": "Comprehension Quiz",
          "subtitle": "quiz, yesterday",
          "percentage": 90
        },
      ],
    },
  };

  @override
  Widget build(BuildContext context) {
    Widget currentPage;
    switch (_selectedIndex) {
      case 0:
        currentPage = ProgressPage(
          studentName: selectedStudent,
          progressData: studentData[selectedStudent]!,
        );
        break;
      case 1:
        currentPage = const MessagesPage();
        break;
      case 2:
        currentPage = const ProfileParentPage();
        break;
      default:
        currentPage = const SizedBox.shrink();
    }

    return BaseLayout(
      body: currentPage,
      selectedIndex: _selectedIndex,
      onIndexChanged: (index) => setState(() => _selectedIndex = index),
      studentName: selectedStudent,
      onStudentChanged: (student) => setState(() => selectedStudent = student),
      students: students,
    );
  }
}

class ProgressPage extends StatelessWidget {
  final String studentName;
  final Map<String, dynamic> progressData;

  const ProgressPage({
    super.key,
    required this.studentName,
    required this.progressData,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProgressCard(),
            const SizedBox(height: 20),
            _buildRecentActivities(),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressCard() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF5E9),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$studentName's Progress",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "3rd Grade",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Text(
                  "${progressData["progress"]} Overall",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          LinearProgressIndicator(
            value:
                double.parse(progressData["progress"].replaceAll("%", "")) / 100,
            backgroundColor: Colors.grey[300],
            color: const Color(0xFF6C7BA2),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMetricItem(
                  Icons.calendar_today, progressData["streak"], "Streak"),
              _buildMetricItem(Icons.menu_book,
                  "${progressData["exercises"]}", "Exercises"),
              _buildMetricItem(Icons.star, "${progressData["achievements"]}",
                  "Achievements"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricItem(IconData icon, String value, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              spreadRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.black, size: 28),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivities() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF5E9),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Recent Activities",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ...progressData["activities"].map<Widget>((activity) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 4,
                      spreadRadius: 1,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          activity["title"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          activity["subtitle"],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "${activity["percentage"]}%",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
