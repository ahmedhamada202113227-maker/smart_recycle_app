import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:smart_recycle_app/presentation/features/home_page/view/home_page_view.dart';


// صفحة Dashboard على نسق الصورة المرسلة - RTL وArabic
// انسخ هذا الملف كـ main.dart أو ضعه داخل مشروع Flutter جديد.

void main() {
  runApp(
    DevicePreview(
      isToolbarVisible: false,
      enabled: !false,
      builder: (context) => const SmartRecycleApp(),
    ),
    );
}

class SmartRecycleApp extends StatelessWidget {
  const SmartRecycleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Recycle Dashboard',
      home: const HomePageView(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF6F7F8),
        fontFamily: 'Roboto',
      ),
    );
  }
}


// عنصر الـ Nav
// class NavItem extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final bool active;

//   const NavItem({
//     super.key,
//     required this.icon,
//     required this.label,
//     this.active = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Icon(icon, color: active ? const Color(0xFF059669) : Colors.grey[500]),
//         const SizedBox(height: 6),
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 12,
//             color: active ? const Color(0xFF059669) : Colors.grey[600],
//           ),
//         ),
//       ],
//     );
//   }
// }



 //  Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: const BorderRadius.only(
            //       topLeft: Radius.circular(18),
            //       topRight: Radius.circular(18),
            //     ),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.black.withOpacity(0.05),
            //         blurRadius: 12,
            //         offset: const Offset(0, -2),
            //       ),
            //     ],
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [

            //       NavItem(icon: Icons.home, label: 'الرئيسية', active: true),
            //       NavItem(icon: Icons.card_giftcard, label: 'الجوائز'),
            //       SizedBox(width: 56), // space for center floating action
            //       NavItem(icon: Icons.person, label: 'الملف الشخصي'),
            //       NavItem(icon: Icons.more_horiz, label: 'المزيد'),
            //     ],
            //   ),
            // ),




































































































































































































// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:barcode_widget/barcode_widget.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// // ✅ مدير النقاط (Global State باستخدام ChangeNotifier)
// class PointsManager extends ChangeNotifier {
//   int _points = 1000;

//   int get points => _points;

//   void withdraw(int amount) {
//     if (amount <= _points) {
//       _points -= amount;
//       notifyListeners();
//     }
//   }

//   void redeem(int amount) {
//     if (amount <= _points) {
//       _points -= amount;
//       notifyListeners();
//     }
//   }

//   void addPoints(int amount) {
//     _points += amount;
//     notifyListeners();
//   }
// }

// void main() {
//   runApp(MyApp(pointsManager: PointsManager()));
// }

// class MyApp extends StatelessWidget {
//   final PointsManager pointsManager;
//   const MyApp({super.key, required this.pointsManager});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Rewards & Stats',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Cairo'),
//       home: RewardsPage(pointsManager: pointsManager),
//     );
//   }
// }

// class RewardsPage extends StatefulWidget {
//   final PointsManager pointsManager;
//   const RewardsPage({super.key, required this.pointsManager});

//   @override
//   State<RewardsPage> createState() => _RewardsPageState();
// }

// class _RewardsPageState extends State<RewardsPage> {
//   @override
//   Widget build(BuildContext context) {
//     int userPoints = widget.pointsManager.points;

//     return Scaffold(
//       appBar: AppBar(title: const Text("الجوائز والإحصائيات")),
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: const Color(0xFF00A86B),
//         unselectedItemColor: Colors.grey,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_outlined),
//             label: "الرئيسية",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.emoji_events_outlined),
//             label: "الجوائز",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_outline),
//             label: "الملف الشخصي",
//           ),
//         ],
//         currentIndex: 1,
//         onTap: (_) {},
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Align(
//               alignment: Alignment.centerRight,
//               child: Text(
//                 "الجوائز والإحصائيات",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//             ),
//             const SizedBox(height: 4),
//             const Align(
//               alignment: Alignment.centerRight,
//               child: Text(
//                 "اكسب النقاط واستبدلها بجوائز رائعة",
//                 style: TextStyle(color: Colors.grey),
//               ),
//             ),
//             const SizedBox(height: 16),

//             // 🟢 رصيد النقاط
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFEFFAF5),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Column(
//                 children: [
//                   const Icon(
//                     Icons.emoji_events,
//                     color: Color(0xFF00A86B),
//                     size: 40,
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     "${widget.pointsManager.points}",
//                     style: const TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF00A86B),
//                     ),
//                   ),
//                   const Text(
//                     "نقاط التدوير الحالية",
//                     style: TextStyle(color: Colors.black54),
//                   ),
//                   const SizedBox(height: 8),
//                   const Text(
//                     "253 نقطة متبقية نحو الجائزة التالية",
//                     style: TextStyle(color: Colors.black87),
//                   ),
//                   const SizedBox(height: 8),
//                   LinearProgressIndicator(
//                     value: 0.75,
//                     backgroundColor: Colors.grey.shade300,
//                     color: const Color(0xFF00A86B),
//                     minHeight: 6,
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 20),

//             const Align(
//               alignment: Alignment.centerRight,
//               child: Text(
//                 "الإنجازات",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//             ),
//             const SizedBox(height: 12),
//             _buildAchievementCard("صديق البيئة", "دور 10 عناصر", "50 نقطة"),
//             _buildAchievementCard(
//               "محارب البلاستيك",
//               "دور 25 عنصر بلاستيكي",
//               "100 نقطة",
//             ),
//             _buildAchievementCard(
//               "بطل التدوير",
//               "دور 50 عنصر",
//               "200 نقطة",
//               hasProgress: true,
//             ),

//             const SizedBox(height: 20),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   "الجوائز المتاحة",
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 GestureDetector(
//                   onTap: () {},
//                   child: const Text(
//                     "استبدال",
//                     style: TextStyle(
//                       color: Color(0xFF00A86B),
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 12),
//             _buildRewardCard(
//               context,
//               "٪10 نسبة خصم",
//               "في متاجر الأغذية العضوية",
//               500,
//               true,
//             ),
//             _buildRewardCard(
//               context,
//               "كوب قهوة مجاني",
//               "من مقاهي شريكة",
//               300,
//               true,
//             ),
//             _buildRewardCard(
//               context,
//               "شجرة مزروعة باسمك",
//               "في مشروع إعادة التشجير",
//               1500,
//               false,
//             ),

//             const SizedBox(height: 30),

//             const Align(
//               alignment: Alignment.centerRight,
//               child: Text(
//                 "طرق السحب",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//             ),
//             const SizedBox(height: 12),

//             _buildWithdrawCard(
//               context,
//               "فودافون كاش",
//               Icons.phone_iphone,
//               Colors.red,
//             ),
//             _buildWithdrawCard(
//               context,
//               "اتصالات كاش",
//               Icons.sim_card,
//               const Color(0xFF2E7D32),
//             ),
//             _buildWithdrawCard(
//               context,
//               "أورانج كاش",
//               Icons.wallet,
//               Colors.orange,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // 🟢 ويدجت إنجاز
//   Widget _buildAchievementCard(
//     String title,
//     String subtitle,
//     String points, {
//     bool hasProgress = false,
//   }) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey.shade300),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         children: [
//           const Icon(Icons.verified, color: Color(0xFF00A86B)),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(subtitle, style: const TextStyle(color: Colors.grey)),
//                 if (hasProgress)
//                   Padding(
//                     padding: const EdgeInsets.only(top: 6),
//                     child: LinearProgressIndicator(
//                       value: 0.4,
//                       backgroundColor: Colors.grey[300],
//                       color: const Color(0xFF00A86B),
//                       minHeight: 5,
//                     ),
//                   ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 12),
//           Text(
//             points,
//             style: const TextStyle(
//               color: Color(0xFF00A86B),
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // 🟢 ويدجت جائزة
//   Widget _buildRewardCard(
//     BuildContext ctx,
//     String title,
//     String subtitle,
//     int cost,
//     bool available,
//   ) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey.shade300),
//         borderRadius: BorderRadius.circular(12),
//         color: available ? Colors.white : Colors.grey.shade100,
//       ),
//       child: Row(
//         children: [
//           const Icon(Icons.card_giftcard, color: Color(0xFF9C27B0)),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: available ? Colors.black : Colors.grey,
//                   ),
//                 ),
//                 Text(
//                   subtitle,
//                   style: TextStyle(
//                     color: available ? Colors.black54 : Colors.grey,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Column(
//             children: [
//               Text(
//                 "$cost نقطة",
//                 style: const TextStyle(
//                   color: Color(0xFF00A86B),
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 6),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: available
//                       ? const Color(0xFF00A86B)
//                       : Colors.grey,
//                 ),
//                 onPressed: available
//                     ? () {
//                         if (widget.pointsManager.points >= cost) {
//                           widget.pointsManager.redeem(cost);
//                           setState(() {});
//                           ScaffoldMessenger.of(ctx).showSnackBar(
//                             SnackBar(
//                               content: Text(
//                                 "تم استبدال $title مقابل $cost نقطة",
//                               ),
//                               backgroundColor: const Color(0xFF00A86B),
//                             ),
//                           );
//                         } else {
//                           ScaffoldMessenger.of(ctx).showSnackBar(
//                             const SnackBar(
//                               content: Text("رصيدك من النقاط غير كافي"),
//                               backgroundColor: Colors.red,
//                             ),
//                           );
//                         }
//                       }
//                     : null,
//                 child: const Text("عرض"),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // 🟢 ويدجت بطاقة سحب
//   Widget _buildWithdrawCard(
//     BuildContext parentContext,
//     String title,
//     IconData icon,
//     Color color,
//   ) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey.shade300),
//         borderRadius: BorderRadius.circular(12),
//         color: Colors.white,
//       ),
//       child: Row(
//         children: [
//           Icon(icon, color: color, size: 32),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Text(
//               title,
//               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//           ),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(backgroundColor: color),
//             onPressed: () {
//               showModalBottomSheet(
//                 context: parentContext,
//                 isScrollControlled: true,
//                 shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//                 ),
//                 builder: (sheetCtx) {
//                   return WithdrawSheet(
//                     title: title,
//                     color: color,
//                     icon: icon,
//                     maxPoints: widget.pointsManager.points,
//                     onConfirmed: (phone, points, method) {
//                       widget.pointsManager.withdraw(points);
//                       setState(() {});
//                       ScaffoldMessenger.of(parentContext).showSnackBar(
//                         SnackBar(
//                           content: Text(
//                             "تم إرسال طلب السحب ($points نقطة) عبر $method",
//                           ),
//                           backgroundColor: color,
//                         ),
//                       );

//                       Future.delayed(const Duration(seconds: 10), () {
//                         Navigator.of(parentContext).push(
//                           MaterialPageRoute(
//                             builder: (_) => InvoicePage(
//                               phone: phone,
//                               points: points,
//                               method: method,
//                             ),
//                           ),
//                         );
//                       });
//                     },
//                   );
//                 },
//               );
//             },
//             child: const Text("سحب"),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ---------------- WithdrawSheet ----------------
// class WithdrawSheet extends StatefulWidget {
//   final String title;
//   final Color color;
//   final IconData icon;
//   final int maxPoints;
//   final void Function(String phone, int points, String method) onConfirmed;

//   const WithdrawSheet({
//     super.key,
//     required this.title,
//     required this.color,
//     required this.icon,
//     required this.maxPoints,
//     required this.onConfirmed,
//   });

//   @override
//   State<WithdrawSheet> createState() => _WithdrawSheetState();
// }

// class _WithdrawSheetState extends State<WithdrawSheet> {
//   final TextEditingController phoneController = TextEditingController();
//   double selectedPoints = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//         bottom: MediaQuery.of(context).viewInsets.bottom,
//       ),
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(16, 20, 16, 30),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Icon(widget.icon, color: widget.color, size: 40),
//               const SizedBox(height: 10),
//               Text(
//                 "سحب عبر ${widget.title}",
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 20),

//               TextField(
//                 controller: phoneController,
//                 keyboardType: TextInputType.phone,
//                 decoration: const InputDecoration(
//                   labelText: "رقم الموبايل",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               Align(
//                 alignment: Alignment.centerRight,
//                 child: Text(
//                   "رصيدك الحالي: ${widget.maxPoints} نقطة",
//                   style: const TextStyle(color: Colors.grey),
//                 ),
//               ),
//               const SizedBox(height: 10),

//               Align(
//                 alignment: Alignment.centerRight,
//                 child: Text(
//                   "عدد النقاط المطلوب سحبها: ${selectedPoints.toInt()}",
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Slider(
//                 value: selectedPoints,
//                 min: 0,
//                 max: widget.maxPoints.toDouble(),
//                 divisions: widget.maxPoints > 0 ? widget.maxPoints : 1,
//                 label: selectedPoints.toInt().toString(),
//                 activeColor: widget.color,
//                 onChanged: (val) => setState(() => selectedPoints = val),
//               ),

//               const SizedBox(height: 20),

//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: widget.color,
//                   minimumSize: const Size.fromHeight(45),
//                 ),
//                 onPressed: selectedPoints.toInt() > 0
//                     ? () {
//                         final phone = phoneController.text.trim();
//                         final pointsInt = selectedPoints.toInt();

//                         if (phone.isEmpty) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(
//                               content: Text("من فضلك ادخل رقم الموبايل"),
//                               backgroundColor: Colors.red,
//                             ),
//                           );
//                           return;
//                         }

//                         Navigator.of(context).pop();
//                         widget.onConfirmed(phone, pointsInt, widget.title);
//                       }
//                     : null,
//                 child: const Text("تأكيد السحب"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ---------------- Invoice Page ----------------
// class InvoicePage extends StatelessWidget {
//   final String phone;
//   final int points;
//   final String method;

//   const InvoicePage({
//     super.key,
//     required this.phone,
//     required this.points,
//     required this.method,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final now = DateTime.now();
//     final formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
//     final int amountInCurrency = points;

//     return Scaffold(
//       appBar: AppBar(title: const Text("فاتورة السحب")),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Card(
//           elevation: 5,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Center(
//                   child: Text(
//                     "🧾 إيصال عملية السحب",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.green,
//                     ),
//                   ),
//                 ),
//                 const Divider(),
//                 const SizedBox(height: 10),
//                 Text(
//                   "رقم الهاتف: $phone",
//                   style: const TextStyle(fontSize: 16),
//                 ),
//                 Text(
//                   "طريقة السحب: $method",
//                   style: const TextStyle(fontSize: 16),
//                 ),
//                 Text(
//                   "النقاط المسحوبة: $points",
//                   style: const TextStyle(fontSize: 16),
//                 ),
//                 Text(
//                   "القيمة بالجنيه: $amountInCurrency جنيه",
//                   style: const TextStyle(fontSize: 16),
//                 ),
//                 Text(
//                   "التاريخ والوقت: $formattedDate",
//                   style: const TextStyle(fontSize: 16),
//                 ),
//                 const SizedBox(height: 20),

//                 Center(
//                   child: BarcodeWidget(
//                     barcode: Barcode.qrCode(),
//                     data: "Phone:$phone | Points:$points | Date:$formattedDate",
//                     width: 150,
//                     height: 150,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 const Center(
//                   child: Text(
//                     "رمز تحقق للعملية",
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                 ),
//                 const SizedBox(height: 30),

//                 Center(
//                   child: ElevatedButton.icon(
//                     icon: const Icon(Icons.picture_as_pdf),
//                     label: const Text("حفظ كـ PDF"),
//                     onPressed: () async {
//                       final pdf = pw.Document();
//                       pdf.addPage(
//                         pw.Page(
//                           pageFormat: PdfPageFormat.a4,
//                           build: (pw.Context ctx) {
//                             return pw.Padding(
//                               padding: const pw.EdgeInsets.all(20),
//                               child: pw.Column(
//                                 crossAxisAlignment: pw.CrossAxisAlignment.start,
//                                 children: [
//                                   pw.Center(
//                                     child: pw.Text(
//                                       "🧾 إيصال عملية السحب",
//                                       style: pw.TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: pw.FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                   pw.SizedBox(height: 20),
//                                   pw.Text("رقم الهاتف: $phone"),
//                                   pw.Text("طريقة السحب: $method"),
//                                   pw.Text("النقاط المسحوبة: $points"),
//                                   pw.Text(
//                                     "القيمة بالجنيه: $amountInCurrency جنيه",
//                                   ),
//                                   pw.Text("التاريخ والوقت: $formattedDate"),
//                                   pw.SizedBox(height: 20),
//                                   pw.Center(
//                                     child: pw.BarcodeWidget(
//                                       barcode: pw.Barcode.qrCode(),
//                                       data:
//                                           "Phone:$phone | Points:$points | Date:$formattedDate",
//                                       width: 150,
//                                       height: 150,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       );

//                       await Printing.layoutPdf(
//                         onLayout: (format) async => pdf.save(),
//                       );
//                     },
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











































// // import 'package:flutter/material.dart';
// // import 'package:smart_recycle_app/presentation/features/achive_page/view/achive_page_view.dart';
// // import 'package:smart_recycle_app/presentation/features/home_page/view/home_page_view.dart';


// // // صفحة Dashboard على نسق الصورة المرسلة - RTL وArabic
// // // انسخ هذا الملف كـ main.dart أو ضعه داخل مشروع Flutter جديد.

// // void main() {
// //   runApp(const SmartRecycleApp());
// // }

// // class SmartRecycleApp extends StatelessWidget {
// //   const SmartRecycleApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       title: 'Smart Recycle Dashboard',
// //       home:  HomePageView(),
// //       theme: ThemeData(
// //         scaffoldBackgroundColor: const Color(0xFFF6F7F8),
// //         fontFamily: 'Roboto',
// //       ),
// //     );
// //   }
// // }

// // // عنصر الـ Nav
// // class NavItem extends StatelessWidget {
// //   final IconData icon;
// //   final String label;
// //   final bool active;

// //   const NavItem({
// //     Key? key,
// //     required this.icon,
// //     required this.label,
// //     this.active = false,
// //   }) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       mainAxisSize: MainAxisSize.min,
// //       children: [
// //         Icon(icon, color: active ? const Color(0xFF059669) : Colors.grey[500]),
// //         const SizedBox(height: 6),
// //         Text(
// //           label,
// //           style: TextStyle(
// //             fontSize: 12,
// //             color: active ? const Color(0xFF059669) : Colors.grey[600],
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }
