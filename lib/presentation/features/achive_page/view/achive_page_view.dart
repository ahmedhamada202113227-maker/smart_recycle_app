import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:smart_recycle_app/presentation/features/achive_page/widgets/Withdraw_bottom_sheet.dart';
import 'package:smart_recycle_app/presentation/features/achive_page/widgets/achive_user_points.dart';
import 'package:smart_recycle_app/presentation/features/achive_page/widgets/header_of_available_rewards.dart';
import 'package:smart_recycle_app/presentation/features/achive_page/widgets/header_of_withdraw_types.dart';

// ✅ مدير النقاط (Global State باستخدام ChangeNotifier)
class PointsManager extends ChangeNotifier {
  int _points = 1500;

  int get points => _points;

  void withdraw(int amount) {
    if (amount <= _points) {
      _points -= amount;
      notifyListeners();
    }
  }

  void redeem(int amount) {
    if (amount <= _points) {
      _points -= amount;
      notifyListeners();
    }
  }

  void addPoints(int amount) {
    _points += amount;
    notifyListeners();
  }
}

// void main() {
//   runApp(MyApp(pointsManager: PointsManager()));
// }

// class MyApp extends StatelessWidget {
//   final PointsManager pointsManager;
//   const MyApp({super.key, required this.pointsManager});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Cairo'),
//       home: AchivePageView(pointsManager: pointsManager),
//     );
//   }
// }

class AchivePageView extends StatefulWidget {
  final PointsManager pointsManager;
  const AchivePageView({super.key, required this.pointsManager});

  @override
  State<AchivePageView> createState() => _AchivePageViewState();
}

class _AchivePageViewState extends State<AchivePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ------------------- 🟢 header -------------------
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "الجوائز والإحصائيات",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 4),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "اكسب النقاط واستبدلها بجوائز رائعة",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            // ----------------------------
            const SizedBox(height: 16),
            // ----------------------------

            // ------------------- 🟢 رصيد النقاط -------------------
            achive_user_points(widget: widget),

            // ----------------------------
            const SizedBox(height: 20),
            // ----------------------------

            // ------------------- 🟢 للجوائز المتاحة -------------------
            header_of_available_rewards(),

            // ----------------------------
            const SizedBox(height: 12),
            // ----------------------------

            // ------------------- 🟢 العروض المتاحة -------------------
            _buildRewardIcon(
              context,
              "٪10 نسبة خصم",
              "في متاجر الأغذية العضوية",
              500,
              widget.pointsManager.points >= 500, // ✅ شرط التفعيل
            ),
            _buildRewardIcon(
              context,
              "كوب قهوة مجاني",
              "من مقاهي شريكة",
              300,
              widget.pointsManager.points >= 300, // ✅ شرط التفعيل
            ),
            _buildRewardIcon(
              context,
              "شجرة مزروعة باسمك",
              "في مشروع إعادة التشجير",
              1500,
              widget.pointsManager.points >= 1500, // ✅ شرط التفعيل
            ),

            // ----------------------------
            const SizedBox(height: 30),
            // ----------------------------

            // ------------------- 🟢 طرق السحب -------------------
            header_of_withdraw_types(),

            // ----------------------------
            const SizedBox(height: 12),
            // ----------------------------

            // ------------------- 🟢 بطاقات السحب (3 methods) -------------------
            _buildWithdrawCard(
              context,
              "فودافون كاش",
              Icons.phone_iphone,
              Colors.red,
            ),
            _buildWithdrawCard(
              context,
              "اتصالات كاش",
              Icons.sim_card,
              const Color(0xFF2E7D32),
            ),
            _buildWithdrawCard(
              context,
              "أورانج كاش",
              Icons.wallet,
              Colors.orange,
            ),
          ],
        ),
      ),
    );
  }

  // 🟢 ويدجت إنجاز
  Widget _buildAchievementCard(
    String title,
    String subtitle,
    String points, {
    bool hasProgress = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.verified, color: Color(0xFF00A86B)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(subtitle, style: const TextStyle(color: Colors.grey)),
                if (hasProgress)
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: LinearProgressIndicator(
                      value: 0.4,
                      backgroundColor: Colors.grey[300],
                      color: const Color(0xFF00A86B),
                      minHeight: 5,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            points,
            style: const TextStyle(
              color: Color(0xFF00A86B),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // 🟢 ويدجت جائزة
  Widget _buildRewardIcon(
    BuildContext ctx,
    String title,
    String subtitle,
    int cost,
    bool available,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        color: available ? Colors.white : Colors.grey.shade100,
      ),
      child: Row(
        children: [
          const Icon(Icons.card_giftcard, color: Color(0xFF9C27B0)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: available ? Colors.black : Colors.grey,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: available ? Colors.black54 : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                "$cost نقطة",
                style: const TextStyle(
                  color: Color(0xFF00A86B),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: available
                      ? const Color(0xFF00A86B)
                      : Colors.grey,
                ),
                onPressed: available
                    ? () {
                        if (widget.pointsManager.points >= cost) {
                          widget.pointsManager.redeem(cost);
                          setState(() {});
                          ScaffoldMessenger.of(ctx).showSnackBar(
                            SnackBar(
                              content: Text(
                                "تم استبدال $title مقابل $cost نقطة",
                              ),
                              backgroundColor: const Color(0xFF00A86B),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(ctx).showSnackBar(
                            const SnackBar(
                              content: Text("رصيدك من النقاط غير كافي"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    : null,
                child: const Text("استبدال"  , style: TextStyle( color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 🟢 ويدجت بطاقة سحب
  Widget _buildWithdrawCard(
    BuildContext parentContext,
    String title,
    IconData icon,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: color),
            onPressed: () {
              showModalBottomSheet(
                context: parentContext,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (sheetCtx) {
                  return WithdrawBottomSheet(
                    title: title,
                    color: color,
                    icon: icon,
                    maxPoints: widget.pointsManager.points,
                    onConfirmed: (phone, points, method) {
                      widget.pointsManager.withdraw(points);
                      setState(() {});
                      ScaffoldMessenger.of(parentContext).showSnackBar(
                        SnackBar(
                          content: Text(
                            "تم إرسال طلب السحب ($points نقطة) عبر $method",
                          ),
                          backgroundColor: color,
                        ),
                      );

                      Future.delayed(const Duration(seconds: 10), () {
                        Navigator.of(parentContext).push(
                          MaterialPageRoute(
                            builder: (_) => FatoraPage(
                              phone: phone,
                              points: points,
                              method: method,
                            ),
                          ),
                        );
                      });
                    },
                  );
                },
              );
            },
            child: const Text("سحب"),
          ),
        ],
      ),
    );
  }
}

// ---------------- فواتير Page ----------------
class FatoraPage extends StatelessWidget {
  final String phone;
  final int points;
  final String method;

  const FatoraPage({
    super.key,
    required this.phone,
    required this.points,
    required this.method,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    final int amountInCurrency = points;

    return Scaffold(
      appBar: AppBar(title: const Text("فاتورة السحب")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "🧾 إيصال عملية السحب",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
                const Divider(),
                const SizedBox(height: 10),
                Text(
                  "رقم الهاتف: $phone",
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  "طريقة السحب: $method",
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  "النقاط المسحوبة: $points",
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  "القيمة بالجنيه: $amountInCurrency جنيه",
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  "التاريخ والوقت: $formattedDate",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),

                Center(
                  child: BarcodeWidget(
                    barcode: Barcode.qrCode(),
                    data: "Phone:$phone | Points:$points | Date:$formattedDate",
                    width: 150,
                    height: 150,
                  ),
                ),
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    "رمز تحقق للعملية",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 30),

                Center(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.picture_as_pdf),
                    label: const Text("حفظ كـ PDF"),
                    onPressed: () async {
                      final pdf = pw.Document();
                      pdf.addPage(
                        pw.Page(
                          pageFormat: PdfPageFormat.a4,
                          build: (pw.Context ctx) {
                            return pw.Padding(
                              padding: const pw.EdgeInsets.all(20),
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Center(
                                    child: pw.Text(
                                      "🧾 إيصال عملية السحب",
                                      style: pw.TextStyle(
                                        fontSize: 20,
                                        fontWeight: pw.FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  pw.SizedBox(height: 20),
                                  pw.Text("رقم الهاتف: $phone"),
                                  pw.Text("طريقة السحب: $method"),
                                  pw.Text("النقاط المسحوبة: $points"),
                                  pw.Text(
                                    "القيمة بالجنيه: $amountInCurrency جنيه",
                                  ),
                                  pw.Text("التاريخ والوقت: $formattedDate"),
                                  pw.SizedBox(height: 20),
                                  pw.Center(
                                    child: pw.BarcodeWidget(
                                      barcode: pw.Barcode.qrCode(),
                                      data:
                                          "Phone:$phone | Points:$points | Date:$formattedDate",
                                      width: 150,
                                      height: 150,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );

                      await Printing.layoutPdf(
                        onLayout: (format) async => pdf.save(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
