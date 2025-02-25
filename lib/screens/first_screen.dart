import 'package:flutter/material.dart'; 
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import 'package:animated_text_kit/animated_text_kit.dart'; 

class FirstScreen extends StatefulWidget { 
  const FirstScreen({super.key}); 

  @override 
  State<FirstScreen> createState() => _FirstScreenState(); 
} 

class _FirstScreenState extends State<FirstScreen> { 
  bool _isImageVisible = false; 
  bool _isTextVisible = false; 
  bool _isFirstButtonVisible = false; 
  bool _isSecondButtonVisible = false; 

  @override 
  void initState() { 
    super.initState(); 

    Future.delayed(const Duration(seconds: 1), () { 
      setState(() { 
        _isImageVisible = true;  
      }); 
    }); 

    Future.delayed(const Duration(seconds: 3), () { 
      setState(() { 
        _isTextVisible = true; 
      }); 
    }); 

    Future.delayed(const Duration(seconds: 12), () { 
      setState(() { 
        _isFirstButtonVisible = true;  
      }); 
    }); 

    Future.delayed(const Duration(seconds: 13), () { 
      setState(() { 
        _isSecondButtonVisible = true; 
      }); 
    }); 
  } 

  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      backgroundColor: Color(0xFF6174A1), 
      body: SingleChildScrollView( 
        child: Container( 
          height: ScreenUtil().screenHeight, 
          width: ScreenUtil().screenWidth, 
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [ 
              Padding( 
                padding: EdgeInsets.symmetric( 
                  horizontal: ScreenUtil().setWidth(25), 
                ), 
                child: Column( 
                  children: [  
                    AnimatedOpacity( 
                      opacity: _isImageVisible ? 1.0 : 0.0, 
                      duration: const Duration(seconds: 3), 
                      child: Image.asset( 
                        'assets/images/Bird.png', 
                        height: ScreenUtil().setHeight(200), 
                        width: ScreenUtil().setWidth(150), 
                      ), 
                    ), 
                    
                    SizedBox(height: ScreenUtil().setHeight(1)), 
                    
                    _isTextVisible 
                      ? AnimatedTextKit( 
                          animatedTexts: [ 
                            TypewriterAnimatedText( 
                              'SAMAHAN KAMI SA ISANG MASAYANG PAKIKIPAGSAPALARAN PARA MAS MAPADALI ANG PAGBABASA!', 
                              speed: const Duration(milliseconds: 100), 
                              textStyle: TextStyle( 
                                fontSize: ScreenUtil().setSp(11), 
                                color: Color(0xFFFEECA4), 
                                fontWeight: FontWeight.bold, 
                              ), 
                              textAlign: TextAlign.center, 
                            ), 
                          ], 
                          totalRepeatCount: 1, 
                          pause: const Duration(milliseconds: 500), 
                        ) 
                      : Container(), 
                    
                    SizedBox(height: ScreenUtil().setHeight(70)), 
                    
                    _isFirstButtonVisible 
                      ? ElevatedButton( 
                          style: ElevatedButton.styleFrom( 
                            backgroundColor: Color(0xFFFEECA4), 
                            foregroundColor: Colors.black, 
                            minimumSize: Size( 
                              ScreenUtil().screenWidth, 
                              ScreenUtil().setHeight(40), 
                            ), 
                            shadowColor: Colors.black, 
                            elevation: 10, 
                            shape: RoundedRectangleBorder( 
                              borderRadius: BorderRadius.circular(8), 
                            ), 
                          ), 
                          onPressed: () { 
                            Navigator.pushNamed(context, '/GuideScreen'); 
                          }, 
                          child: Text( 
                            'MAG SIMULA', 
                            style: TextStyle( 
                              fontSize: ScreenUtil().setSp(15), 
                              fontWeight: FontWeight.bold, 
                            ), 
                          ), 
                        ) 
                      : Container(), 
                    
                    SizedBox(height: ScreenUtil().setHeight(20)), 
                    
                    _isSecondButtonVisible 
                      ? ElevatedButton( 
                          style: ElevatedButton.styleFrom( 
                            backgroundColor: Colors.white, 
                            foregroundColor: Color(0xFF6174A1), 
                            minimumSize: Size( 
                              ScreenUtil().screenWidth, 
                              ScreenUtil().setHeight(40), 
                            ), 
                            shadowColor: Colors.black, 
                            elevation: 10, 
                            shape: RoundedRectangleBorder( 
                              borderRadius: BorderRadius.circular(8), 
                            ), 
                          ), 
                          onPressed: () { 
                            Navigator.pushNamed(context, '/learn_more'); 
                          }, 
                          child: Text( 
                            'MATUTO PA', 
                            style: TextStyle( 
                              fontSize: ScreenUtil().setSp(15), 
                              fontWeight: FontWeight.bold, 
                            ), 
                          ), 
                        ) 
                      : Container(), 
                  ], 
                ), 
              ), 
            ], 
          ), 
        ), 
      ), 
    ); 
  } 
}