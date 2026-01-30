import 'package:flutter/foundation.dart';
import '../models/mood.dart';

class MoodProvider extends ChangeNotifier {
  double _currentAngle = 200.0; // Default to Calm position
  Mood _currentMood = Mood.fromAngle(200.0);

  double get currentAngle => _currentAngle;
  Mood get currentMood => _currentMood;

  void updateAngle(double angle) {
    _currentAngle = angle % 360;
    _currentMood = Mood.fromAngle(_currentAngle);
    notifyListeners();
  }

  void saveMood() {
    // Here you would save to database or API
    // For now, just notify
    notifyListeners();
  }
}
