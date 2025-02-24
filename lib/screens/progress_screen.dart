import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:literexia/widgets/constant.dart';
import 'package:literexia/widgets/homepage_widget.dart';

class ProgressScreen extends StatelessWidget {
  final List<Map<String, dynamic>> weeklyProgress;
  final List<Map<String, dynamic>> achievements;

  const ProgressScreen({
    Key? key,
    required this.weeklyProgress,
    required this.achievements,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.h),
            _buildProgressCard("Oras ng Pag-aaral", "24.5 HOURS", Colors.purple, "assets/icons/ALARM.png"),
            _buildProgressCard("Nakumpleto ang Aralin", "47", Colors.red, "assets/icons/MIND.png"),
            _buildProgressCard("Katumpakan", "62%", Colors.orange, "assets/icons/DART.png"),
            SizedBox(height: 15.h),
            _progressOverview(), // Add the progress overview section
            SizedBox(height: 15.h),
             _buildRecentAchievements(),
          ],
        ),  
      ),
    );
  }

  Widget _buildProgressCard(String title, String value, Color color, String iconPath) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                value,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Image.asset(
            iconPath,
            width: 40.w,
            height: 40.h,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }

  Widget _progressOverview() {
    return Container(
       constraints: BoxConstraints(maxWidth: 400.w),
      margin: EdgeInsets.symmetric(vertical: 9.h, horizontal: 2.w),
      padding: EdgeInsets.all(25.w),
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(5.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Skills",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
              color: Colors.black,
              letterSpacing: 2, 
            ),
          ),
          Text(
            "your progress in different learning area",
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black.withOpacity(0.6),
              fontFamily: 'OpenSans',
              letterSpacing: 2
            ),
          ),
          SizedBox(height: 10.h),

          // Use the ProgressBar widget here
          const ProgressBar(title: "Reading Comprehension", progress: 78),
          const ProgressBar(title: "Word Recognition", progress: 87),
          const ProgressBar(title: "Grammar Skills", progress: 60),
        ],
      ),
    );
  }
  Widget _buildRecentAchievements() {
    return Container(
      constraints: BoxConstraints(maxWidth: 400.w),
      margin: EdgeInsets.symmetric(vertical: 9.h, horizontal: 2.w),
      padding: EdgeInsets.all(25.w),
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(5.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Mga Kamakailang Nakamit",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
              color: Colors.black,
              letterSpacing: 2, 
            ),
          ),
          SizedBox(height: 10.h),
          _buildAchievementItem("7 Day Streak", "Completed exercises for 7 days in a row",'assets/icons/progressStar.png'),
          _buildAchievementItem("Speed Reader", "Read 19 passages in record time",'assets/icons/boyprogress.png'),
          _buildAchievementItem("Vocabulary Master", "Learned 199 new words",'assets/icons/book.png'),
        ],
      ),
    );
  }

  Widget _buildAchievementItem(String title, String description, String iconPath) {
  return Padding(
    padding: EdgeInsets.only(bottom: 10.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          iconPath,
          width: 24.w,  // Adjust the size to match your design
          height: 24.h,
          fit: BoxFit.contain,
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
  }
}