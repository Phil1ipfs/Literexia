import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:literexia/screens/phonics_screen.dart';
import 'package:literexia/widgets/animation.dart';
import 'package:literexia/widgets/custom_wordimage.dart';

class Word extends StatefulWidget {
  @override
  _WordState createState() => _WordState();
}

class _WordState extends State<Word> {
  String? selectedImage; 

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
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 150.w,
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
                      children: "P I L I I N   A N G   T A M A N G     L A R A W A N."
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
            SizedBox(height: screenSize.height * 0.02),

            Row(
              children: [
                SizedBox(width: 10.w),
                Icon(Icons.volume_up, color: Colors.yellow, size: 24.sp),
                SizedBox(width: 10.w),
                RichText(
                  text: TextSpan(
                    children: "D O G"
                        .split("")
                        .map((char) => TextSpan(
                              text: char,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
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

            Wrap(
              spacing: screenSize.width * 0.05,
              runSpacing: screenSize.height * 0.02,
              children: [
                imageChoice("KAPE", 'assets/images/kape.png'),
                imageChoice("ASO", 'assets/images/aso.png'),
                imageChoice("GATAS", 'assets/images/gatas.png'),
                imageChoice("BAHAY", 'assets/images/bahay.png'),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: selectedImage != null
                  ? () {
                      navigateWithAnimation(context, Phonics());
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedImage != null ? Color(0xFFF8E8A0) : Colors.grey,
                padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * 0.2, vertical: screenSize.height * 0.02),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenSize.width * 0.03),
                ),
              ),
              child: Text(
                "MAG PATULOY",
                style: TextStyle(color: Colors.black, fontSize: 16.sp),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget imageChoice(String label, String imagePath) {
    bool isSelected = selectedImage == imagePath;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = isSelected ? null : imagePath;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.yellow : Colors.transparent,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ImageCard(label: label, imagePath: imagePath, screenSize: MediaQuery.of(context).size),
      ),
    );
  }
}
