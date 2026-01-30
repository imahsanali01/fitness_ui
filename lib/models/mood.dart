import 'package:flutter/material.dart';

enum MoodType { calm, content, peaceful, happy }

class Mood {
  final MoodType type;
  final String imagePath;
  final String label;
  final double angle; // Position on circular slider (0-360)

  Mood({
    required this.type,
    required this.imagePath,
    required this.label,
    required this.angle,
  });

  // Get mood based on angle
  static Mood fromAngle(double angle) {
    // Normalize angle to 0-360
    final normalizedAngle = angle % 360;

    if (normalizedAngle >= 0 && normalizedAngle < 90) {
      return Mood(
        type: MoodType.happy,
        imagePath: 'assets/images/happy.png',
        label: 'Happy',
        angle: normalizedAngle,
      );
    } else if (normalizedAngle >= 90 && normalizedAngle < 180) {
      return Mood(
        type: MoodType.content,
        imagePath: 'assets/images/content.png',
        label: 'Content',
        angle: normalizedAngle,
      );
    } else if (normalizedAngle >= 180 && normalizedAngle < 270) {
      return Mood(
        type: MoodType.peaceful,
        imagePath: 'assets/images/peaceful.png',
        label: 'Peaceful',
        angle: normalizedAngle,
      );
    } else {
      return Mood(
        type: MoodType.calm,
        imagePath: 'assets/images/calm.png',
        label: 'Calm',
        angle: normalizedAngle,
      );
    }
  }

  // Get gradient colors for this mood based on angle
  List<Color> getGradientColors() {
    // Create a smooth gradient around the circle
    return [
      const Color(0xFFFF6B9D), // Pink
      const Color(0xFFFF9B71), // Orange
      const Color(0xFF71E9D9), // Cyan
      const Color(0xFFB794F6), // Purple
      const Color(0xFFFF6B9D), // Back to Pink
    ];
  }
}
