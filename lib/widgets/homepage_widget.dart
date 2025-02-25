import 'package:literexia/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonCard extends StatelessWidget {
  final String title;
  final String duration;
  final int rating;
  final String imagePath;
  final String level;
  final bool isLocked;
  final VoidCallback onPlayTap; 

  const LessonCard({
    super.key,
    required this.title,
    required this.duration,
    required this.rating,
    required this.imagePath,
    required this.isLocked,
    required this.onPlayTap, required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(3, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Card(
        color: isLocked ? LOCKED_CARD_COLOR.withOpacity(0.85) : CARD_COLOR,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'OpenSans',
                        color: WHITE,
                        letterSpacing: 5,
                      ),
                    ),

                        SizedBox(height: 8.h),

                    Text(
                      
                      level, 
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        
                        color: WHITE.withOpacity(0.9),
                        letterSpacing: 2
                      ),
                    ),


                    SizedBox(height: 7.h),

                    Row(
                      children: [
                        Text(
                          duration,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'OpenSans',
                            color: WHITE.withOpacity(0.8),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Row(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              index < rating ? Icons.star : Icons.star_border,
                              color: isLocked
                                  ? WHITE.withOpacity(0.6)
                                  : (index < rating ? Colors.yellow : Colors.grey),
                              size: 16.w,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 12.h),

                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: isLocked
                              ? null
                              : () {
                                  onPlayTap(); // Navigate when Play is tapped
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isLocked
                                ? BTN_BG_COLOR.withOpacity(0.5)
                                : BTN_BG_COLOR,
                            foregroundColor: BTN_TEXT_COLOR,
                            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            minimumSize: Size(130.w, 45.h),
                          ),
                          child: Text(
                            "PLAY",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'OpenSans',
                              color: isLocked ? WHITE.withOpacity(0.6) : BTN_TEXT_COLOR,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        if (isLocked) const Icon(Icons.lock, color: WHITE, size: 22),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(
                width: 100.w,
                height: 100.h,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Image.asset(imagePath),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  final String title;
  final int progress;

  const ProgressBar({super.key, required this.title, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w), 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                    color: Colors.black,
                    letterSpacing: 1.5,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                "$progress%",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                  color: Colors.black,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),

          Container(
            height: 14.h, 
            width: double.infinity, 
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.r),
              color: Colors.grey[300],
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(1, 2),
                ),
              ],
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 14.h, 
                width: (progress / 100) * 270.w, 
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.r),
                  color: CARD_COLOR,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
