import 'package:flutter/material.dart';
import 'package:smart_recycle_app/presentation/features/home_page/widgets/hello_user.dart';
import 'package:smart_recycle_app/presentation/features/home_page/widgets/last_activities_card.dart';
import 'package:smart_recycle_app/presentation/features/home_page/widgets/progress_liner_indicator.dart';
import 'package:smart_recycle_app/presentation/features/home_page/widgets/the_first_card.dart';
import 'package:smart_recycle_app/presentation/features/home_page/widgets/the_second_card.dart';
import 'package:smart_recycle_app/presentation/features/home_page/widgets/the_target_of_month.dart';

class HomePageViewBody extends StatefulWidget {
  const HomePageViewBody({super.key});

  @override
  State<HomePageViewBody> createState() => _HomePageViewBodyState();
}

class _HomePageViewBodyState extends State<HomePageViewBody>
    with SingleTickerProviderStateMixin {
  double progress = 0.75; // 75%
  late AnimationController _animController;
  late Animation<double> _progressAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _progressAnim = Tween<double>(begin: 0, end: progress).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeOutCubic),
    );
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ألوان مشابهة للصورة
    const primaryGreen = Color(0xFF10B981); // emerald
    const lightGreenBg = Color(0xFFE8FDF4);
    // ignore: unused_local_variable
    const softYellow = Color(0xFFFFF6E6);
    const softBlue = Color(0xFFEFF6FF);
    const cardWhite = Colors.white;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            // ---------------------------- Header ----------------------------
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: hello_user()),
                // ----------------- little rounded card (like profile icon) -----------------
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: primaryGreen,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.person, color: Colors.white),
                ),
              ],
            ),
            // -------------------------
            const SizedBox(height: 14),
            // -------------------------

            // ---------------------- Main progress card ----------------------
            AnimatedBuilder(
              animation: _progressAnim,
              builder: (context, child) {
                // ------------------ the main container ------------------
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFE3FAF0), // Mint Green
                        Color(0xFFF5FFFB), // Very light green/white
                      ],
                    ),
                    color: lightGreenBg,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: primaryGreen.withOpacity(0.2)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ------------------ the target of month ------------------
                      the_target_of_month(primaryGreen: primaryGreen),
                      // -------------------------
                      const SizedBox(height: 12),
                      // -------------------------
                      // ------------------ progress line indicator ------------------
                      progress_liner_indicator(
                        progressAnim: _progressAnim,
                        primaryGreen: primaryGreen,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'من 100 عنصر لهذا الشهر',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                );
              },
            ),

            // -------------------------
            const SizedBox(height: 12),
            // -------------------------
            // ------------------------- Two small  cards side by side -------------------------
            Row(
              children: [
                Expanded(child: the_first_card(cardWhite: cardWhite)),
                // -------------------------
                const SizedBox(width: 5),
                // -------------------------
                Expanded(child: the_second_card(cardWhite: cardWhite)),
              ],
            ),

            // -------------------------
            const SizedBox(height: 14),
            // -------------------------
            // ------------------------- Last activities card (expandable list) -------------------------
            
            Expanded(
              child: last_activities_card(cardWhite: cardWhite, primaryGreen: primaryGreen),
            ),
          ],
        ),
      ),
    );
  }
}
