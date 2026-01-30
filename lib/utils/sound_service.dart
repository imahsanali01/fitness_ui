import 'package:audioplayers/audioplayers.dart';

class SoundService {
  static final AudioPlayer _player = AudioPlayer();

  static Future<void> playTap() async {
    try {
      await _player.play(AssetSource('sounds/tap.mp3'), volume: 0.3);
    } catch (e) {
      // Silently fail if sound not available
    }
  }

  static Future<void> playSwipe() async {
    try {
      await _player.play(AssetSource('sounds/swipe.mp3'), volume: 0.3);
    } catch (e) {
      // Silently fail if sound not available
    }
  }

  static Future<void> playSuccess() async {
    try {
      await _player.play(AssetSource('sounds/success.mp3'), volume: 0.4);
    } catch (e) {
      // Silently fail if sound not available
    }
  }

  static Future<void> dispose() async {
    await _player.dispose();
  }
}
