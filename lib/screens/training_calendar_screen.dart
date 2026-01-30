import 'package:flutter/material.dart';

class TrainingCalendarScreen extends StatelessWidget {
  const TrainingCalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Training Calendar',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(color: Color.fromARGB(255, 46, 40, 227), height: 8),
            // Week Header 1
            _buildWeekHeader('Week 2/8', 'December 8-14', 'Total: 60min'),

            // Daily Schedule
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildDayRow(
                    context,
                    day: 'Mon',
                    date: '8',
                    workout: _WorkoutData(
                      title: 'Arm Blaster',
                      duration: '25m - 30m',
                      tag: 'Arms Workout',
                      tagColor: const Color(0xFF2D5A4C),
                      tagTextColor: const Color(0xFF4ECDC4),
                      tagIcon: Icons.fitness_center,
                    ),
                  ),
                  _buildDayRow(context, day: 'Tue', date: '9'),
                  _buildDayRow(context, day: 'Wed', date: '10'),
                  _buildDayRow(
                    context,
                    day: 'Thu',
                    date: '11',
                    workout: _WorkoutData(
                      title: 'Leg Day Blitz',
                      duration: '25m - 30m',
                      tag: 'Leg Workout',
                      tagColor: const Color(0xFF3D348B).withValues(alpha: 0.3),
                      tagTextColor: const Color(0xFF9E7AFF),
                      tagIcon: Icons.directions_run,
                    ),
                  ),
                  _buildDayRow(context, day: 'Fri', date: '12'),
                  _buildDayRow(context, day: 'Sat', date: '13'),
                  _buildDayRow(context, day: 'Sun', date: '14'),
                ],
              ),
            ),

            const SizedBox(height: 24),
            const Divider(color: Color(0xFF4ECDC4), height: 2, thickness: 2),

            // Week Header 2
            _buildWeekHeader('Week 2', 'December 14-22', 'Total: 60min'),

            const SizedBox(height: 100), // Space for bottom nav
          ],
        ),
      ),
    );
  }

  Widget _buildWeekHeader(String week, String dates, String total) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                week,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                dates,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
          Text(total, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildDayRow(
    BuildContext context, {
    required String day,
    required String date,
    _WorkoutData? workout,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Day/Date Column
              SizedBox(
                width: 45,
                child: Column(
                  children: [
                    Text(
                      day,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      date,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),

              // Workout Card or Empty Space
              Expanded(
                child: workout != null
                    ? _buildWorkoutCard(workout)
                    : const SizedBox(height: 60),
              ),
            ],
          ),
        ),
        const Divider(color: Color(0xFF1A1A1A), height: 1),
      ],
    );
  }

  Widget _buildWorkoutCard(_WorkoutData workout) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF121212),
        borderRadius: BorderRadius.circular(12),
        border: const Border(left: BorderSide(color: Colors.white, width: 4)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          children: [
            // Handle Icon
            const Icon(Icons.drag_indicator, color: Colors.grey, size: 20),
            const SizedBox(width: 12),

            // Workout Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tag
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: workout.tagColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          workout.tagIcon,
                          size: 12,
                          color: workout.tagTextColor,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          workout.tag,
                          style: TextStyle(
                            color: workout.tagTextColor,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Title
                  Text(
                    workout.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            // Duration
            Text(
              workout.duration,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class _WorkoutData {
  final String title;
  final String duration;
  final String tag;
  final Color tagColor;
  final Color tagTextColor;
  final IconData tagIcon;

  _WorkoutData({
    required this.title,
    required this.duration,
    required this.tag,
    required this.tagColor,
    required this.tagTextColor,
    required this.tagIcon,
  });
}
