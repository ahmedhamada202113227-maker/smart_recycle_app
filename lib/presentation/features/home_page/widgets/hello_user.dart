import 'package:flutter/material.dart';

class hello_user extends StatelessWidget {
  const hello_user({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'التدوير الذكى',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: Colors.grey[900],
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Text(
              'مرحباً أحمد',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(width: 6),
            const Text('👋'),
          ],
        ),
      ],
    );
  }
}
