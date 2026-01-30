import 'package:vibration/vibration.dart';
import 'package:flutter/services.dart';

class HapticService {
  static Future<void> light() async {
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(duration: 30);
    } else {
      HapticFeedback.lightImpact();
    }
  }

  static Future<void> medium() async {
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(duration: 50);
    } else {
      HapticFeedback.mediumImpact();
    }
  }

  static Future<void> heavy() async {
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(duration: 100);
    } else {
      HapticFeedback.heavyImpact();
    }
  }

  static Future<void> selection() async {
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(duration: 20);
    } else {
      HapticFeedback.selectionClick();
    }
  }

  static Future<void> success() async {
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(pattern: [0, 50, 50, 50]);
    } else {
      HapticFeedback.mediumImpact();
    }
  }

  static Future<void> pattern() async {
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(pattern: [0, 500, 100, 500]);
    } else {
      HapticFeedback.heavyImpact();
    }
  }
}
