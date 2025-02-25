import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
 
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
 
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
 
class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
 
  @override
  void initState() {
    super.initState();
 
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
 
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
 
    _controller.forward();
    startLoading();
  }
 
  void startLoading() {
    Timer(
      const Duration(seconds: 15),
      () => Navigator.pushReplacementNamed(context, '/loading'),
    );
  }
 
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
 
@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xFF6174A1),
    body: Center( 
      child: Column(
        mainAxisSize: MainAxisSize.min, 
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Top animation
          Lottie.asset(
            'assets/animation/LoadingTop.json',
            width: 150.w,
            height: 150.h,
            fit: BoxFit.contain,
          ),

          SizedBox(height: 20.h),

          /// Fade-in Logo
          FadeTransition(
              opacity: _fadeAnimation,
              child: Image.asset(
                'assets/images/Literexia.png',
                width: 300.w, 
                height: 150.h, 
                fit: BoxFit.contain, 
              ),
            ),

          SizedBox(height: 100.h),

          /// Loading Indicator
          SizedBox(
            width: 30.w,
            height: 30.h,
            child: const CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2.0,
            ),
          ),
        ],
      ),
    ),
  );
}
}