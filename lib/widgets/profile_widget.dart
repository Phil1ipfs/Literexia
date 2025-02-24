import 'package:carousel_slider/carousel_slider.dart';
import 'package:literexia/widgets/customDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/constant.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String role;
  final String profileImage;
  final String flagImage;
  final int level;
  final bool isEnrolled;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.role,
    required this.profileImage,
    required this.flagImage,
    required this.level,
    required this.isEnrolled,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 20.h),
          child: CircleAvatar(
            radius: 65.r,
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Image.asset(
                profileImage,
                fit: BoxFit.cover,
                width: 130.w,
                height: 130.h,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.person, size: 90.w, color: Colors.grey);
                },
              ),
            ),
          ),
        ),
        Container(
          color: PRIMARY_COLOR,
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      name.toUpperCase(),
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontFamily: 'Bubblegum',
                        color: Colors.white,
                        letterSpacing: 4,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Image.asset(flagImage, width: 40.w, height: 50.h),
                ],
              ),
              Text(
                role,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'Bubblegum',
                  color: Colors.white.withOpacity(0.8),
                  letterSpacing: 3,
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/icons/medal.png',
                          width: 40.w, height: 40.h),
                      SizedBox(width: 10.w),
                      if (isEnrolled)
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 14.w, vertical: 6.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Text(
                            "ENROLLED",
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white,
                                fontFamily: 'Bubblegum',
                                letterSpacing: 2),
                          ),
                        ),
                    ],
                  ),
                  Text(
                    "LEVEL $level",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Bubblegum',
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AchievementsWidget extends StatelessWidget {
  final List<String> achievementIcons;

  const AchievementsWidget({super.key, required this.achievementIcons});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BACKGROUND_COLOR,
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: PRIMARY_COLOR,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              "ACHIEVEMENTS",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Atkinson',
                letterSpacing: 5,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: 1,
            ),
            itemCount: achievementIcons.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: PROGRESS_BG_COLOR,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Image.asset(achievementIcons[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}

class FeedbackCarousel extends StatefulWidget {
  final List<Map<String, dynamic>> feedbackList;

  const FeedbackCarousel({super.key, required this.feedbackList});

  @override
  State<FeedbackCarousel> createState() => _FeedbackCarouselState();
}

class _FeedbackCarouselState extends State<FeedbackCarousel> {
  late List<bool> isLikedList;

  @override
  void initState() {
    super.initState();
    isLikedList = List<bool>.filled(widget.feedbackList.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BACKGROUND_COLOR,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: PRIMARY_COLOR,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Text(
              "FEEDBACK",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          CarouselSlider.builder(
            options: CarouselOptions(
              height: 170.h,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
            ),
            itemCount: widget.feedbackList.length,
            itemBuilder: (context, index, realIndex) {
              final feedback = widget.feedbackList[index];
              final isLiked = isLikedList[index];

              return Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: PRIMARY_COLOR,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(feedback["avatar"]),
                          radius: 20.r,
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Text(
                            feedback["teacher"].toUpperCase(),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 2,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Image.asset(feedback["sticker"],
                            width: 40.w, height: 30.h),
                       ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      feedback["comment"],
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        letterSpacing: 1.5,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: List.generate(
                            feedback["stars"] ?? 0,
                            (index) => Icon(Icons.star,
                                color: Colors.yellow, size: 20.w),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isLikedList[index] = !isLikedList[index];
                            });
                            CustomDialog.showEmotionDialog(context);
                          },
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: Icon(
                              isLiked ? Icons.favorite : Icons.favorite_border,
                              color: isLiked ? Colors.red : Colors.white,
                              size: 22.w,
                              key: ValueKey<bool>(isLiked),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
