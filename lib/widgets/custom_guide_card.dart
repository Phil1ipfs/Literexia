import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:literexia/widgets/customFont.dart';


class CustomGuideCard extends StatelessWidget {
  final String contentText;
  final bool showContentText;
  final String imageAsset;
  final String bottomText;
  final double imageWidth;
  final double imageHeight;

  const CustomGuideCard({
    super.key,
    required this.contentText,
    required this.showContentText,
    required this.imageAsset,
    required this.bottomText,
    this.imageWidth = 300,
    this.imageHeight = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(ScreenUtil().setSp(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (showContentText)
            Center(
              child: CustomFont(
                text: contentText,
                fontSize: ScreenUtil().setSp(25),
                color: const Color(0xFFFEECA4),
                fontWeight: FontWeight.w100,
                 fontStyle: FontStyle.normal,
              ),
            ),
          SizedBox(height: ScreenUtil().setHeight(40)),
          Center(
            child: Image.asset(
              imageAsset,
              width: ScreenUtil().setWidth(imageWidth),
              height: ScreenUtil().setHeight(imageHeight),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(10)),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(50)),
              child: CustomFont(
                text: bottomText,
                fontSize: ScreenUtil().setSp(14),
                color: Colors.white,
                fontWeight: FontWeight.w300, fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
