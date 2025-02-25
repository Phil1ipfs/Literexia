import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  final Widget body;
  final int selectedIndex;
  final Function(int) onIndexChanged;
  final String studentName;
  final Function(String) onStudentChanged;
  final List<String> students;

  const BaseLayout({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onIndexChanged,
    required this.studentName,
    required this.onStudentChanged,
    required this.students,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: CustomAppBar(
            selectedStudent: studentName,
            onStudentChanged: onStudentChanged,
            students: students,
          ),
        ),
        body: body,
        bottomNavigationBar: CustomBottomNavBar(
          selectedIndex: selectedIndex,
          onTap: onIndexChanged,
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  final String selectedStudent;
  final Function(String) onStudentChanged;
  final List<String> students;

  const CustomAppBar({
    super.key,
    required this.selectedStudent,
    required this.onStudentChanged,
    required this.students,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color(0xFF6C7BA2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Hello Parent Phillip!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            "Student",
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
          const SizedBox(height: 8),
          Row(
            children: students.map((student) {
              bool isSelected = selectedStudent == student;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected ? Colors.white : Colors.white70,
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => onStudentChanged(student),
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (isSelected) ...[
                              const Icon(
                                Icons.check,
                                size: 16,
                                color: Colors.black,
                              ),
                              const SizedBox(width: 4),
                            ],
                            Text(
                              student,
                              style: TextStyle(
                                color: isSelected ? Colors.black : Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF6C7BA2),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Progress'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      onTap: onTap,
    );
  }
}
