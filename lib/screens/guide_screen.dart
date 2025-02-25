import 'package:flutter/material.dart'; 
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import 'package:carousel_slider/carousel_slider.dart';
import 'package:literexia/widgets/carouselItems.dart'; 

class GuideScreen extends StatefulWidget { 
  const GuideScreen({super.key}); 

  @override 
  _GuideScreenState createState() => _GuideScreenState(); 
}

class _GuideScreenState extends State<GuideScreen> { 
  int _currentIndex = 0; 
  double carouselWidth = 1; 

  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      backgroundColor: const Color(0xFF6174A1), 
      body: Column( 
        children: [ 
          SizedBox(height: ScreenUtil().setHeight(1)),  
          Expanded( 
            child: Center( 
              child: CarouselSlider( 
                options: CarouselOptions( 
                  enableInfiniteScroll: false, 
                  height: 350.h, 
                  viewportFraction: carouselWidth, 
                  padEnds: false, 
                  onPageChanged: (index, reason) { 
                    setState(() { 
                      _currentIndex = index; 
                    }); 
                  }, 
                ), 
                items: carouselItems(), 
              ), 
            ), 
          ), 
          buildIndicator(),
          SizedBox(height: ScreenUtil().setHeight(80)), 
          Padding( 
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)), 
            child: ElevatedButton( 
              style: ElevatedButton.styleFrom( 
                backgroundColor: const Color(0xFFFEECA4), 
                foregroundColor: Colors.black, 
                minimumSize: Size(ScreenUtil().screenWidth, ScreenUtil().setHeight(40)), 
                shadowColor: Colors.black, 
                elevation: 10, 
                shape: RoundedRectangleBorder( 
                  borderRadius: BorderRadius.circular(8), 
                ), 
              ), 
              onPressed: () { 
                Navigator.pushNamed(context, '/login'); 
              }, 
              child: Text( 
                'MAY ACCOUNT NA AKO', 
                style: TextStyle( 
                  fontSize: ScreenUtil().setSp(14), 
                  fontWeight: FontWeight.bold, 
                ), 
              ), 
            ), 
          ), 
          SizedBox(height: ScreenUtil().setHeight(50)), 
        ], 
      ), 
    ); 
  } 

  Widget buildIndicator() { 
    int itemCount = carouselItems().length; 
    return Row( 
      mainAxisAlignment: MainAxisAlignment.center, 
      children: List.generate(itemCount, (index) { 
        bool isActive = index == _currentIndex; 
        return AnimatedContainer( 
          duration: const Duration(milliseconds: 300), 
          margin: EdgeInsets.symmetric(horizontal: 4.w), 
          width: isActive ? 30.w : 10.w, 
          height: 8.h, 
          decoration: BoxDecoration( 
            color: isActive ? const Color(0xFFFEECA4) : const Color(0xFFD9D9D9), 
            borderRadius: BorderRadius.circular(4), 
          ), 
        ); 
      }), 
    ); 
  } 

}
