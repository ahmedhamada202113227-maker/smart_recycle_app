import 'package:flutter/material.dart';
import 'package:smart_recycle_app/presentation/features/achive_page/view/achive_page_view.dart';

class achive_user_points extends StatelessWidget {
  const achive_user_points({
    super.key,
    required this.widget,
  });

  final AchivePageView widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEFFAF5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.emoji_events,
            color: Color(0xFF00A86B),
            size: 40,
          ),
          const SizedBox(height: 8),
          Text(
            "${widget.pointsManager.points}",
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00A86B),
            ),
          ),
          const Text(
            "نقاط التدوير الحالية",
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 8),
    
          // 🟢 الحساب الجديد للجائزة القادمة
          Builder(
            builder: (context) {
              int points = widget.pointsManager.points;
              List<int> rewards = [300, 500, 1500];
              int? nextReward = rewards.firstWhere(
                (r) => r > points,
                orElse: () => rewards.last,
              );
    
              double progress = points / nextReward;
              int remaining = (nextReward - points).clamp(
                0,
                nextReward,
              );
    
              return Column(
                children: [
                  Text(
                    "$remaining نقطة متبقية نحو الجائزة التالية",
                    style: const TextStyle(color: Colors.black87),
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: progress.clamp(0, 1),
                    backgroundColor: Colors.grey.shade300,
                    color: const Color(0xFF00A86B),
                    minHeight: 6,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
