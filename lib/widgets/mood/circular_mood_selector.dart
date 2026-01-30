import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import '../../providers/mood_provider.dart';
import '../../utils/haptic_service.dart';
import '../../utils/sound_service.dart';

class CircularMoodSelector extends StatefulWidget {
  const CircularMoodSelector({Key? key}) : super(key: key);

  @override
  State<CircularMoodSelector> createState() => _CircularMoodSelectorState();
}

class _CircularMoodSelectorState extends State<CircularMoodSelector>
    with SingleTickerProviderStateMixin {
  late AnimationController _emojiController;
  String? _lastMoodType;

  @override
  void initState() {
    super.initState();
    _emojiController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _emojiController.dispose();
    super.dispose();
  }

  void _updateAngle(Offset localPosition, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final dx = localPosition.dx - center.dx;
    final dy = localPosition.dy - center.dy;

    // Calculate angle in radians, then convert to degrees
    double angle = math.atan2(dy, dx) * 180 / math.pi;
    // Normalize to 0-360
    angle = (angle + 360) % 360;

    final moodProvider = Provider.of<MoodProvider>(context, listen: false);
    final currentMoodLabel = moodProvider.currentMood.label;

    moodProvider.updateAngle(angle);

    // Trigger haptic and animation if mood changed
    if (_lastMoodType != currentMoodLabel) {
      HapticService.light();
      SoundService.playTap();
      _emojiController.forward(from: 0);
      _lastMoodType = currentMoodLabel;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MoodProvider>(
      builder: (context, moodProvider, child) {
        final mood = moodProvider.currentMood;
        final angle = moodProvider.currentAngle;

        return GestureDetector(
          onPanUpdate: (details) {
            final RenderBox box = context.findRenderObject() as RenderBox;
            _updateAngle(details.localPosition, box.size);
          },
          onTapDown: (details) {
            final RenderBox box = context.findRenderObject() as RenderBox;
            _updateAngle(details.localPosition, box.size);
          },
          child: SizedBox(
            width: 320,
            height: 320,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Gradient Ring
                CustomPaint(
                  size: Size(320, 320),
                  painter: _GradientRingPainter(),
                ),

                // Draggable Ball
                CustomPaint(
                  size: Size(320, 320),
                  painter: _DraggableBallPainter(angle: angle),
                ),

                // Center Emoji with Animation
                AnimatedBuilder(
                  animation: _emojiController,
                  builder: (context, child) {
                    final scale = 1.0 + (_emojiController.value * 0.2);
                    return Transform.scale(
                      scale: scale,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          mood.imagePath,
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _GradientRingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final ringWidth = 30.0;

    // Create gradient colors
    final colors = [
      Color(0xFFFF6B9D), // Pink
      Color(0xFFFF9B71), // Orange
      Color(0xFFFFC859), // Yellow
      Color(0xFF71E9D9), // Cyan
      Color(0xFF71B8FF), // Blue
      Color(0xFFB794F6), // Purple
      Color(0xFFFF6B9D), // Back to Pink
    ];

    final sweepGradient = SweepGradient(
      colors: colors,
      startAngle: 0,
      endAngle: math.pi * 2,
    );

    final paint = Paint()
      ..shader = sweepGradient.createShader(
        Rect.fromCircle(center: center, radius: radius),
      )
      ..style = PaintingStyle.stroke
      ..strokeWidth = ringWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius - ringWidth / 2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _DraggableBallPainter extends CustomPainter {
  final double angle;

  _DraggableBallPainter({required this.angle});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 15; // Position on the ring

    // Convert angle to radians
    final angleInRadians = angle * math.pi / 180;

    // Calculate ball position
    final ballX = center.dx + radius * math.cos(angleInRadians);
    final ballY = center.dy + radius * math.sin(angleInRadians);
    final ballPosition = Offset(ballX, ballY);

    // Draw outer glow
    final glowPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.3)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 8);
    canvas.drawCircle(ballPosition, 20, glowPaint);

    // Draw main ball
    final ballPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(ballPosition, 16, ballPaint);

    // Draw inner shadow for depth
    final innerPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.5)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 4);
    canvas.drawCircle(ballPosition, 12, innerPaint);
  }

  @override
  bool shouldRepaint(_DraggableBallPainter oldDelegate) {
    return oldDelegate.angle != angle;
  }
}
