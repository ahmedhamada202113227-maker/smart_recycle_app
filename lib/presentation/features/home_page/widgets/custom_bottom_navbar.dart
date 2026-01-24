// import 'package:flutter/material.dart';
// import 'package:smart_recycle_app/main.dart';

// class custom_bottom_navbar extends StatelessWidget {
//   const custom_bottom_navbar({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(18),
//           topRight: Radius.circular(18),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 12,
//             offset: const Offset(0, -2),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           NavItem(icon: Icons.home, label: 'الرئيسية', active: true),
//           NavItem(icon: Icons.card_giftcard, label: 'الجوائز'),
//           SizedBox(width: 56), // space for center floating action
//           NavItem(icon: Icons.person, label: 'الملف الشخصي'),
//           NavItem(icon: Icons.more_horiz, label: 'المزيد'),
//         ],
//       ),
//     );
//   }
// }
