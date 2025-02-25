import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
 
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});
 
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}
 
class _LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
 
  @override
  void initState() {
    super.initState();
 
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
 
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
 
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
 
    _controller.forward();
    startLoading();
  }
 
  void startLoading() {
    Timer(
      const Duration(seconds: 10),
      () => Navigator.pushReplacementNamed(context, '/firstscreen'),
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
    body: Stack(
      children: [

        Positioned(
          left: -165.w, 
          top: 5.h, 
          right: 0, 
          bottom: 0,
          child: Lottie.asset(
            'assets/animation/Background.json',
            fit: BoxFit.cover, 
          ),
        ),
        Center(
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Image.asset(
                'assets/images/Bird.png',
                width: 100.w,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
}