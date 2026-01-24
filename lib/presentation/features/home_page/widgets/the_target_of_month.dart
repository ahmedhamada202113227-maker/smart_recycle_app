import 'package:flutter/material.dart';

class the_target_of_month extends StatelessWidget {
  const the_target_of_month({
    super.key,
    required this.primaryGreen,
  });

  final Color primaryGreen;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.trending_up,
              color: primaryGreen,
              size: 18,
            ),
            const SizedBox(width: 8),
            Text(
              'التقدم الشهري',
              style: TextStyle(
                color: Colors.green[800],
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: primaryGreen,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            'هدف أكتوبر',
            style: TextStyle(fontSize: 12 , color: Colors.white  , fontWeight: FontWeight.w800),
          ),
        ),
      ],
    );
  }
}
