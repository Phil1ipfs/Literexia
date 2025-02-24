import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:literexia/screens/header_navbar.dart';
import 'package:literexia/screens/home_screen.dart';
import 'package:literexia/widgets/animation.dart';

class Emotion extends StatefulWidget {
  @override
  _EmotionState createState() => _EmotionState();
}

class _EmotionState extends State<Emotion> {
  String? selectedEmotion; 

  void toggleSelection(String emotion) {
    setState(() {
      if (selectedEmotion == emotion) {
        selectedEmotion = null; 
      } else {
        selectedEmotion = emotion; 
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF6C7A9C),
      body: Padding(
        padding: EdgeInsets.all(screenSize.width * 0.05),
        child: Column(
          children: [
            SizedBox(height: 40), 

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.close, color: Colors.white, size: 24.sp),
                Container(
                  width: 250.w,
                  height: 15.h,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 250.w,
                      height: 15.h,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 50), 

            
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "KUMUSTA ANG IYONG NARARAMDAMAN NGAYONG ARAW?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),
                  
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      emotionIcon("Galit", Icons.sentiment_dissatisfied, Colors.red),
                      SizedBox(width: 15),
                      emotionIcon("Malungkot", Icons.sentiment_very_dissatisfied, Colors.yellow[700]!),
                      SizedBox(width: 15),
                      emotionIcon("Neutral", Icons.sentiment_neutral, Colors.yellow[500]!),
                      SizedBox(width: 15),
                      emotionIcon("Masaya", Icons.sentiment_very_satisfied, Colors.yellow[300]!),
                    ],
                  ),
                ],
              ),
            ),

            
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedEmotion != null ? Color(0xFFF8E8A0) : Colors.grey,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: selectedEmotion != null
                  ? () {
                      navigateWithAnimation(context, HeaderNavbar(weeklyProgress: [], achievements: [],)); // DITO PAPUNTA SA HOME NA GAWA NI KIT PALITAN NALANG NG CLASSNAME
                    }
                  : null,
              child: Text(
                "MAG PATULOY",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                ),
              ),
            ),
            SizedBox(height: 40), 
          ],
        ),
      ),
    );
  }

  Widget emotionIcon(String emotion, IconData icon, Color color) {
    bool isSelected = selectedEmotion == emotion;
    return GestureDetector(
      onTap: () => toggleSelection(emotion),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: isSelected ? Border.all(color: Colors.white, width: 3) : null,
            ),
            child: Icon(icon, size: 40, color: color),
          ),
          SizedBox(height: 8),
          Text(
            emotion,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
