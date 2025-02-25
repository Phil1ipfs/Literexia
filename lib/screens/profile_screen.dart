import 'package:flutter/material.dart';
import 'package:literexia/widgets/profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileHeader(
              name: "Phillip Casingal",
              role: "STUDENT",
              profileImage: "assets/images/profileimg.png",
              flagImage: "assets/icons/ph.png",
              level: 999,
              isEnrolled: true,
            ),
            const AchievementsWidget(
              achievementIcons: [
                'assets/images/badge1.png',
                'assets/images/badge2.png',
                'assets/images/badge3.png',
                'assets/images/badge4.png',
                'assets/images/badge5.png',
                'assets/images/badge6.png',
              ],
            ),
            FeedbackCarousel(
              feedbackList: [
                {
                  "avatar": 'assets/images/teacher.png',
                  "teacher": "TEACHER KIT",
                  "comment": "MAHUSAY!",
                  "sticker": 'assets/icons/greatjob.png',
                  "stars": 4,
                },
                {
                  "avatar": 'assets/images/teacher.png',
                  "teacher": "TEACHER KIT",
                  "comment": "KEEP GOING!",
                  "sticker": 'assets/icons/greatjob.png',
                  "stars": 5,
                },
              ],
            ),
          ],
        ),
      ),
    );
  }
}