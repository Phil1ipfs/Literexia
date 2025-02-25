import 'package:flutter/material.dart';
import 'package:literexia/screens/grammar_screen.dart'; 
import 'package:literexia/widgets/AnimatedTextContainer.dart';
import 'package:literexia/widgets/animation.dart';

class Quest extends StatelessWidget {
  const Quest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5F6A8A),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () {},
                ),
              ),
              const Spacer(),
     
              const AnimatedTextContainer(),
              const SizedBox(height: 40),

              Container(
                width: 156.14,
                height: 209,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              const SizedBox(height: 140),

 
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Grammar()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF8E8A0),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation: 8,
                  shadowColor: Colors.black.withOpacity(0.9),
                ),
                child: const Text(
                  "MAG PATULOY",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}