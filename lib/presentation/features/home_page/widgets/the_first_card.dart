import 'package:flutter/material.dart';

class the_first_card extends StatelessWidget {
  const the_first_card({
    super.key,
    required this.cardWhite,
  });

  final Color cardWhite;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: 100,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
         gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFFF9E5), // Soft yellow
            Color(0xFFFFFEFA), // Almost white
          ],
        ),
        color: cardWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.09),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'النقاط المكتسبة',
            style: TextStyle(color: Colors.grey[600]),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '1,247',
                style: TextStyle(
                  color: Colors.orange[700],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(
                Icons.emoji_events,
                color: Colors.orange,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
