import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:literexia/screens/grammar_screen.dart';
import 'package:literexia/screens/header_navbar.dart';
import 'package:literexia/screens/phonics_screen.dart';
import 'package:literexia/screens/progress_screen.dart';  // Import ProgressScreen
import 'package:literexia/widgets/constant.dart';
import 'package:literexia/widgets/homepage_widget.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for progress and achievements
    final List<Map<String, dynamic>> weeklyProgress = [
      {"title": "Reading Comprehension", "progress": 78},
      {"title": "Word Recognition", "progress": 87},
      {"title": "Grammar Skills", "progress": 60},
    ];

    final List<Map<String, dynamic>> achievements = [
      {
        "title": "First Lesson Completed!",
        "description": "You've completed your first lesson!",
        "iconPath": "assets/icons/trophy.png",
      },
      {
        "title": "50% Progress!",
        "description": "You're halfway through the module!",
        "iconPath": "assets/icons/medal.png",
      },
    ];

    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle("ON GOING", "assets/icons/ongoing-lock.png"),
            LessonCard(
              title: "Grammar Exercises",
              duration: "26 mins",
              level: "Level 1",
              rating: 3,
              imagePath: "assets/images/ABC IMAGE.png",
              isLocked: false,
              onPlayTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Grammar()),
                );
              },
            ),

            LessonCard(
              title: "Syllable Structure Practice",
              duration: "16 mins",
              level: "Level 2",
              rating: 4,
              imagePath: "assets/images/word image.png",
              isLocked: false,
              onPlayTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Phonics()),
                );
              },
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 0.5.h),
              child: Divider(
                color: PRIMARY_COLOR,
                thickness: 5,
                indent: 5.w,
                endIndent: 5.w,
              ),
            ),

            _sectionTitle("LOCKED", "assets/icons/padlock.png"),
            LessonCard(
              title: "Filipino Reading Exercise",
              duration: "35 mins",
              level: "Level 3",
              rating: 0,
              imagePath: "assets/images/reading image.png",
              isLocked: true,
              onPlayTap: () {},
            ),
            LessonCard(
              title: "Vocabulary Building - Animals",
              duration: "29 mins",
              level: "Level 4",
              rating: 0,
              imagePath: "assets/images/lion.png",
              isLocked: true,
              onPlayTap: () {},
            ),
            SizedBox(height: 10.h),

            _progressOverview(weeklyProgress),

            // Button to navigate to Progress Screen
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: PRIMARY_COLOR,
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProgressScreen(
                        weeklyProgress: weeklyProgress,
                        achievements: achievements,
                      ),
                    ),
                  );
                },
                child: Text(
                  "View Progress",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title, String iconPath) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w800,
              fontFamily: 'Bungee',
              color: PRIMARY_COLOR,
              letterSpacing: 4,
            ),
          ),
          SizedBox(width: 2.w),
          Image.asset(
            iconPath,
            width: 50.w,
            height: 50.h,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }

  Widget _progressOverview(List<Map<String, dynamic>> weeklyProgress) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Progress Overview",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
              color: Colors.black,
              letterSpacing: 2,
            ),
          ),
          Text(
            "Track your learning journey",
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black.withOpacity(0.6),
              fontFamily: 'OpenSans',
              letterSpacing: 2,
            ),
          ),
          SizedBox(height: 10.h),

          ...weeklyProgress.map((data) => ProgressBar(
                title: data["title"],
                progress: data["progress"],
              )),
        ],
      ),
    );
  }
}
