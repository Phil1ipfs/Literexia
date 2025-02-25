import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:literexia/screens/emotion_screen.dart';
import 'package:literexia/widgets/animation.dart';

class Phonics extends StatefulWidget {
  @override
  _PhonicsState createState() => _PhonicsState();
}

class _PhonicsState extends State<Phonics> {
  List<String> selectedWords = [];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF5F6A8A),
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
                      width: 210.w,
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

            
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: "I S A L I N   N A T I N   A N G          P A N G U N G U S A P   N A  I T O"
                          .split("")
                          .map((char) => TextSpan(
                                text: char,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  decoration: char.trim().isEmpty
                                      ? TextDecoration.none
                                      : TextDecoration.underline,
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Icon(Icons.volume_up, color: Colors.yellow, size: 30.sp),
              ],
            ),
            SizedBox(height: screenSize.height * 0.02),

            
            Row(
              children: [
                Image.asset('assets/images/hanap.png', width: 80.w),
                SizedBox(width: 10.w),
                Icon(Icons.volume_up, color: Colors.yellow, size: 24.sp),
                SizedBox(width: 10.w),
                RichText(
                  text: TextSpan(
                    children: "N A G   H A H A N A P  \n S A   M A L A Y O"
                        .split("")
                        .map((char) => TextSpan(
                              text: char,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                decoration: char.trim().isEmpty
                                    ? TextDecoration.none
                                    : TextDecoration.underline,
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenSize.height * 0.03),

            
            Column(
              children: List.generate(
                4,
                (index) => Container(
                  margin: EdgeInsets.symmetric(vertical: 30.h),
                  padding: EdgeInsets.all(45),
                  width: screenSize.width * 0.8,
                  height: 2.h,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.03),

            // Word Options
            Wrap(
              spacing: 10.w,
              runSpacing: 10.h,
              alignment: WrapAlignment.center,
              children: [
                'NAG HAHANAP',
                'SA MALAYO',
                'MALAPIT',
                'NAG KAKAPE',
                'NAG AANO',
                'LOLO'
              ].map((word) => wordChoice(word)).toList(),
            ),
            Spacer(),

            
            ElevatedButton(
              onPressed: selectedWords.length == 2
                  ? () {
                    navigateWithAnimation(context, Emotion());
                      
                    }
                  : null, 
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedWords.length == 2 ? Color(0xFFF8E8A0) : Colors.grey,
                padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * 0.2,
                  vertical: screenSize.height * 0.02,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenSize.width * 0.03),
                ),
              ),
              child: Text(
                "MAGPATULOY",
                style: TextStyle(color: Colors.black, fontSize: 16.sp),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget wordChoice(String word) {
  bool isSelected = selectedWords.contains(word);

  return ElevatedButton(
    onPressed: () {
      setState(() {
        if (isSelected) {
          selectedWords.remove(word);
        } else if (selectedWords.length < 2) {
          selectedWords.add(word);
        }
      });
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isSelected ? Colors.yellow : Colors.white,
          width: 2,
        ),
      ),
    ),
    child: Text(
      word,
      style: TextStyle(
        color: Colors.white,
        fontSize: 14.sp,
      ),
    ),
  );
}
}