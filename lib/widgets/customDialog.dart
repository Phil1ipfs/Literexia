  // ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:literexia/widgets/constant.dart';

class CustomDialog {
  static void showEmotionDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: PRIMARY_COLOR,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.close, color: Colors.white, size: 24.w),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "KUMUSTA ANG IYONG NARARAMDAMAN NGAYONG ARAW?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _emotionItem(context, "😡", "Galit", Colors.red),
                _emotionItem(context, "😢", "Malungkot", Colors.blue),
                _emotionItem(context, "😐", "Neutral", Colors.grey),
                _emotionItem(context, "😊", "Masaya", Colors.yellow),
              ],
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    ),
  );
}

  static Widget _emotionItem(BuildContext context, String emoji, String label, Color hoverColor) {
    return StatefulBuilder(
      builder: (context, setState) {
        bool isHovered = false;

        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context); 
              _handleEmotionClick(context, label); 
            },
            child: AnimatedScale(
              // ignore: dead_code
              scale: isHovered ? 1.2 : 1.0, 
              duration: const Duration(milliseconds: 200),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // ignore: dead_code
                      color: isHovered ? hoverColor.withOpacity(0.3) : Colors.transparent,
                    ),
                    padding: EdgeInsets.all(8.w),
                    child: Text(emoji, style: TextStyle(fontSize: 40.sp)), // Emoji
                  ),
                  SizedBox(height: 5.h),
                  Text(label,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static void _handleEmotionClick(BuildContext context, String selectedEmotion) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Pinili mong pakiramdam: $selectedEmotion",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
        backgroundColor: PRIMARY_COLOR,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
