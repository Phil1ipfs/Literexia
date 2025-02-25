import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:literexia/screens/first_screen.dart';
import 'package:literexia/screens/guide_screen.dart';
import 'package:literexia/screens/header_navbar.dart';
import 'package:literexia/screens/home_screen.dart';
import 'package:literexia/screens/loading_screen.dart';
import 'package:literexia/screens/login_screen.dart';
import 'package:literexia/screens/profile_screen.dart';
import 'package:literexia/screens/progress_screen.dart';
import 'package:literexia/screens/phonics_screen.dart';
import 'package:literexia/screens/emotion_screen.dart';
import 'package:literexia/screens/grammar_screen.dart';
import 'package:literexia/screens/register_screen.dart';
import 'package:literexia/screens/splash_screen.dart';
import '/screens/quest_screen.dart';
import 'screens/word_screen.dart';

void main() {
  runApp(const Literexia());
}

class Literexia extends StatelessWidget {
  const Literexia({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Literexia',
          initialRoute: '/splash',
          routes: {
            '/home': (context) => const HomePageScreen(),
            '/progress': (context) => ProgressScreen(
                 weeklyProgress: [], achievements: []),
            '/profile': (context) => const ProfileScreen(),
            '/quest': (context) => const Quest(),
            '/grammar': (context) => const Grammar(),
            '/word': (context) => Word(),
            '/phonics': (context) => Phonics(),
            '/emotion': (context) => Emotion(),
            '/navHead': (context) => const HeaderNavbar(weeklyProgress: [], achievements: [],),  
            '/login': (context) => LoginScreen(),  
            '/signUp': (context) => SignUpScreen(),  
            '/splash': (context) => SplashScreen(),  
            '/loading': (context) => LoadingScreen(),  
            '/firstscreen': (context) => FirstScreen(), 
            '/GuideScreen': (context) => GuideScreen(), 
             
            
          },
        );
      },
    );
  }
}
