import 'package:flutter/material.dart';

class header_of_available_rewards extends StatelessWidget {
  const header_of_available_rewards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "الجوائز المتاحة",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () {},
          child: const Text(
            "استبدال",
            style: TextStyle(
              color: Color(0xFF00A86B),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
