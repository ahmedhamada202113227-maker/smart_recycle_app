import 'package:flutter/material.dart';

class progress_liner_indicator extends StatelessWidget {
  const progress_liner_indicator({
    super.key,
    required Animation<double> progressAnim,
    required this.primaryGreen,
  }) : _progressAnim = progressAnim;

  final Animation<double> _progressAnim;
  final Color primaryGreen;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '${(_progressAnim.value * 100).toInt()}%',
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              FractionallySizedBox(
                widthFactor: _progressAnim.value,
                child: Container(
                  height: 12,
                  decoration: BoxDecoration(
                    color: primaryGreen,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
