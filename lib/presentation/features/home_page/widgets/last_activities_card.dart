import 'package:flutter/material.dart';

import 'package:smart_recycle_app/presentation/features/home_page/widgets/activity_tile_item.dart';

class last_activities_card extends StatelessWidget {
  const last_activities_card({
    super.key,
    required this.cardWhite,
    required this.primaryGreen,
  });

  final Color cardWhite;
  final Color primaryGreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardWhite,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.recycling, color: primaryGreen),
                  const SizedBox(width: 8),
                  Text(
                    'آخر الأنشطة',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
              Text(
                'عرض الكل',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              children: [
                ActivityTile(
                  title: 'زجاجة بلاستيكية',
                  subtitle: 'بلاستيك رقم 1 · منذ ساعتين',
                  points: 5,
                  green: primaryGreen,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('تم اختيار زجاجة بلاستيكية'),
                      ),
                    );
                  },
                ),
                ActivityTile(
                  title: 'علبة ألمونيوم',
                  subtitle: 'معدن · امس',
                  points: 8,
                  green: primaryGreen,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('تم اختيار علبة ألمونيوم'),
                      ),
                    );
                  },
                ),
                ActivityTile(
                  title: 'كرتونة حليب',
                  subtitle: 'ورق مقوى · امس',
                  points: 3,
                  green: primaryGreen,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('تم اختيار كرتونة حليب'),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // تفاعل الزر: فتح مسح (مثال)
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('جارٍ مسح النفايات...'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryGreen,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    icon: const Icon(Icons.camera_alt),
                    label: const Text('مسح النفايات الآن'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:smart_recycle_app/presentation/features/home_page/widgets/custom_bottom_navbar.dart';
// import 'package:smart_recycle_app/presentation/features/home_page/widgets/hello_user.dart';
// import 'package:smart_recycle_app/presentation/features/home_page/widgets/last_activities_card.dart';
// import 'package:smart_recycle_app/presentation/features/home_page/widgets/progress_liner_indicator.dart';
// import 'package:smart_recycle_app/presentation/features/home_page/widgets/the_first_card.dart';
// import 'package:smart_recycle_app/presentation/features/home_page/widgets/the_second_card.dart';
// import 'package:smart_recycle_app/presentation/features/home_page/widgets/the_target_of_month.dart';

// class HomePageViewBody extends StatelessWidget {
//   const HomePageViewBody({
//     super.key,
//     required this.primaryGreen,
//     required Animation<double> progressAnim,
//     required this.lightGreenBg,
//     required this.cardWhite,
//   }) : _progressAnim = progressAnim;

//   final Color primaryGreen;
//   final Animation<double> _progressAnim;
//   final Color lightGreenBg;
//   final Color cardWhite;

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         // Bottom navigation with floating effect
//         // bottomNavigationBar: custom_bottom_navbar(),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         floatingActionButton: FloatingActionButton.extended(
//           onPressed: () {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('تم الضغط على زر المسح السريع')),
//             );
//           },
//           label: const Text('مسح سريع'),
//           icon: const Icon(Icons.qr_code_scanner),
//           backgroundColor: const Color(0xFF059669),
//         ),
//         body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             child: Column(
//               children: [
//                 // ---------------------------- Header ----------------------------
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Expanded(child: hello_user()),
//                     // ----------------- little rounded card (like profile icon) -----------------
//                     Container(
//                       width: 44,
//                       height: 44,
//                       decoration: BoxDecoration(
//                         color: primaryGreen,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: const Icon(Icons.person, color: Colors.white),
//                     ),
//                   ],
//                 ),
//                 // -------------------------
//                 const SizedBox(height: 14),
//                 // -------------------------

//                 // ---------------------- Main progress card ----------------------
//                 AnimatedBuilder(
//                   animation: _progressAnim,
//                   builder: (context, child) {
//                     // ------------------ the main container ------------------
//                     return Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         color: lightGreenBg,
//                         borderRadius: BorderRadius.circular(16),
//                         border: Border.all(
//                           color: primaryGreen.withOpacity(0.2),
//                         ),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // ------------------ the target of month ------------------
//                           the_target_of_month(primaryGreen: primaryGreen),
//                           // -------------------------
//                           const SizedBox(height: 12),
//                           // -------------------------
//                           // ------------------ progress line indicator ------------------
//                           progress_liner_indicator(
//                             progressAnim: _progressAnim,
//                             primaryGreen: primaryGreen,
//                           ),
//                           const SizedBox(height: 10),
//                           Text(
//                             'من 100 عنصر لهذا الشهر',
//                             style: TextStyle(color: Colors.grey[700]),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),

//                 // -------------------------
//                 const SizedBox(height: 12),
//                 // -------------------------
//                 // ------------------------- Two small  cards side by side -------------------------
//                 Row(
//                   children: [
//                     Expanded(child: the_first_card(cardWhite: cardWhite)),
//                     // -------------------------
//                     const SizedBox(width: 5),
//                     // -------------------------
//                     Expanded(child: the_second_card(cardWhite: cardWhite)),
//                   ],
//                 ),

//                 // -------------------------
//                 const SizedBox(height: 14),
//                 // -------------------------
//                 // ------------------------- Last activities card (expandable list) -------------------------
//                 Expanded(
//                   child: last_activities_card(
//                     cardWhite: cardWhite,
//                     primaryGreen: primaryGreen,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }




// SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//         child: Column(
//           children: [
//             // Header
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'لوحة التحكم اليومية',
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.grey[900],
//                         ),
//                       ),
//                       const SizedBox(height: 6),
//                       Row(
//                         children: [
//                           Text(
//                             'مرحباً أحمد',
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.grey[700],
//                             ),
//                           ),
//                           const SizedBox(width: 6),
//                           const Text('👋'),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 // little rounded card (like profile icon)
//                 Container(
//                   width: 44,
//                   height: 44,
//                   decoration: BoxDecoration(
//                     color: primaryGreen,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: const Icon(Icons.person, color: Colors.white),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 14),

//             // Main progress card
//             AnimatedBuilder(
//               animation: _progressAnim,
//               builder: (context, child) {
//                 return Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: lightGreenBg,
//                     borderRadius: BorderRadius.circular(16),
//                     border: Border.all(color: Colors.green.withOpacity(0.08)),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Icon(
//                                 Icons.trending_up,
//                                 color: primaryGreen,
//                                 size: 18,
//                               ),
//                               const SizedBox(width: 8),
//                               Text(
//                                 'التقدم الشهري',
//                                 style: TextStyle(
//                                   color: Colors.green[800],
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Container(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 10,
//                               vertical: 6,
//                             ),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: const Text(
//                               'هدف أكتوبر',
//                               style: TextStyle(fontSize: 12),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           Text(
//                             '${(_progressAnim.value * 100).toInt()}%',
//                             style: const TextStyle(
//                               fontSize: 28,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: Stack(
//                               alignment: Alignment.centerLeft,
//                               children: [
//                                 Container(
//                                   height: 12,
//                                   decoration: BoxDecoration(
//                                     color: Colors.grey[300],
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),
//                                 ),
//                                 FractionallySizedBox(
//                                   widthFactor: _progressAnim.value,
//                                   child: Container(
//                                     height: 12,
//                                     decoration: BoxDecoration(
//                                       color: primaryGreen,
//                                       borderRadius: BorderRadius.circular(20),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 10),
//                       Text(
//                         'من 100 عنصر لهذا الشهر',
//                         style: TextStyle(color: Colors.grey[700]),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),

//             const SizedBox(height: 12),
//             // Two small metric cards side by side
//             Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     padding: const EdgeInsets.all(12),
//                     margin: const EdgeInsets.only(right: 6),
//                     decoration: BoxDecoration(
//                       color: cardWhite,
//                       borderRadius: BorderRadius.circular(12),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.03),
//                           blurRadius: 6,
//                           offset: const Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'النقاط المكتسبة',
//                           style: TextStyle(color: Colors.grey[600]),
//                         ),
//                         const SizedBox(height: 6),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               '1,247',
//                               style: TextStyle(
//                                 color: Colors.orange[700],
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const Icon(
//                               Icons.emoji_events,
//                               color: Colors.orange,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     padding: const EdgeInsets.all(12),
//                     margin: const EdgeInsets.only(left: 6),
//                     decoration: BoxDecoration(
//                       color: cardWhite,
//                       borderRadius: BorderRadius.circular(12),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.03),
//                           blurRadius: 6,
//                           offset: const Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'موفر CO₂',
//                           style: TextStyle(color: Colors.grey[600]),
//                         ),
//                         const SizedBox(height: 6),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: const [
//                                 Text(
//                                   '12.5',
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text('كيلو'),
//                               ],
//                             ),
//                             const Icon(Icons.cloud, color: Colors.blue),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 14),
//             // Last activities card (expandable list)
//             Expanded(
//               child: Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(14),
//                 decoration: BoxDecoration(
//                   color: cardWhite,
//                   borderRadius: BorderRadius.circular(14),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.03),
//                       blurRadius: 6,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Icon(Icons.recycling, color: primaryGreen),
//                             const SizedBox(width: 8),
//                             Text(
//                               'آخر الأنشطة',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 color: Colors.grey[800],
//                               ),
//                             ),
//                           ],
//                         ),
//                         Text(
//                           'عرض الكل',
//                           style: TextStyle(color: Colors.grey[600]),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 12),
//                     Expanded(
//                       child: ListView(
//                         children: [
//                           ActivityTile(
//                             title: 'زجاجة بلاستيكية',
//                             subtitle: 'بلاستيك رقم 1 · منذ ساعتين',
//                             points: 5,
//                             green: primaryGreen,
//                             onTap: () {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text('تم اختيار زجاجة بلاستيكية'),
//                                 ),
//                               );
//                             },
//                           ),
//                           ActivityTile(
//                             title: 'علبة ألمونيوم',
//                             subtitle: 'معدن · امس',
//                             points: 8,
//                             green: primaryGreen,
//                             onTap: () {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text('تم اختيار علبة ألمونيوم'),
//                                 ),
//                               );
//                             },
//                           ),
//                           ActivityTile(
//                             title: 'كرتونة حليب',
//                             subtitle: 'ورق مقوى · امس',
//                             points: 3,
//                             green: primaryGreen,
//                             onTap: () {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text('تم اختيار كرتونة حليب'),
//                                 ),
//                               );
//                             },
//                           ),
//                           const SizedBox(height: 8),
//                           Center(
//                             child: ElevatedButton.icon(
//                               onPressed: () {
//                                 // تفاعل الزر: فتح مسح (مثال)
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                     content: Text('جارٍ مسح النفايات...'),
//                                   ),
//                                 );
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: primaryGreen,
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 22,
//                                   vertical: 12,
//                                 ),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                               ),
//                               icon: const Icon(Icons.camera_alt),
//                               label: const Text('مسح النفايات الآن'),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );