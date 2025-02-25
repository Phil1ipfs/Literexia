import 'package:flutter/material.dart';
import 'package:literexia/screens/progress_screen.dart';
import 'package:literexia/widgets/progress_data.dart'; // Import data


class ProgressScreenData extends StatelessWidget {
  const ProgressScreenData({super.key});

  @override
  Widget build(BuildContext context) {
    return ProgressScreen(
      weeklyProgress: weeklyProgress,
      achievements: achievements,
    );
  }
}
