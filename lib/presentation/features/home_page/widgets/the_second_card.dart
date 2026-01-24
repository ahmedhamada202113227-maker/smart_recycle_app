import 'package:flutter/material.dart';

class the_second_card extends StatelessWidget {
  const the_second_card({super.key, required this.cardWhite});

  final Color cardWhite;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(left: 6),
      decoration: BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFE9F3FF), // Pale blue
            Color(0xFFFAFDFF), // White-blue
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
          Text('موفر CO₂', style: TextStyle(color: Colors.grey[600])),
          const SizedBox(height: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '12.5',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.cloud, color: Colors.blue),
                ],
              ),
            ],
          ),
          Text('كيلو'),
        ],
      ),
    );
  }
}
