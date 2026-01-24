import 'package:flutter/material.dart';

class header_of_withdraw_types extends StatelessWidget {
  const header_of_withdraw_types({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerRight,
      child: Text(
        "طرق السحب",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
