import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:literexia/screens/word_screen.dart';
import 'package:literexia/widgets/animation.dart';

class Grammar extends StatefulWidget {
  const Grammar({super.key});

  @override
  State<Grammar> createState() => _GrammarState();
}

class _GrammarState extends State<Grammar> {
  String? selectedChoice;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF5D6C94),
      body: Padding(
        padding: EdgeInsets.all(screenSize.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),

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
                      width: 70.w,
                      height: 15.h,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.h),

            
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: "P U N A N     N A T I N      A N G             B L A N K O."
                          .split("")
                          .map((char) => TextSpan(
                                text: char,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.sp,
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
            SizedBox(height: 10.h),
            Image.asset('assets/images/person.png', height: 175.h),
            SizedBox(height: 20.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "NAKITA KO _ _ _ MATANDANG",
                  style: TextStyle(color: Colors.white, fontSize: 20.sp),
                ),
                SizedBox(width: 5.w),
                Icon(Icons.volume_up, color: Colors.yellow, size: 28.sp),
              ],
            ),
            Text(
              "LALAKI NA NAG-IISIP.",
              style: TextStyle(color: Colors.white, fontSize: 20.sp),
            ),
            SizedBox(height: 23.h),

            
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 5.h,
              crossAxisSpacing: 7.w,
              childAspectRatio: 3.5,
              children: [
                choiceButton("ANG"),
                choiceButton("SI"),
                choiceButton("YUNG"),
                choiceButton("AKING"),
                choiceButton("SIYA"),
                choiceButton("SILA"),
              ],
            ),
            SizedBox(height: 15.h),

            
            ElevatedButton(
              onPressed: selectedChoice != null
                  ? () {
                      navigateWithAnimation(context, Word());
                    }
                  : null, 
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedChoice != null
                    ? const Color(0xFFF8E8A0)
                    : Colors.grey, 
                padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 15.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "MAG PATULOY",
                style: TextStyle(color: Colors.black, fontSize: 16.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget choiceButton(String text) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedChoice = (selectedChoice == text) ? null : text;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        side: BorderSide(
          color: selectedChoice == text ? Colors.yellow : Colors.white,
          width: 2,
        ),
        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 13.sp,
          fontWeight: selectedChoice == text ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
