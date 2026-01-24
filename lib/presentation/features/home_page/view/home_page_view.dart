import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_recycle_app/presentation/features/achive_page/view/achive_page_view.dart';
import 'package:smart_recycle_app/presentation/features/home_page/widgets/home_page_view_body.dart';
import 'package:smart_recycle_app/presentation/features/profile_page/view/profile_screen.dart';
import 'package:smart_recycle_app/presentation/features/scanner_page/view/camera_scanner_screen.dart';

// صفحة Dashboard على نسق الصورة المرسلة - RTL وArabic
// انسخ هذا الملف كـ main.dart أو ضعه داخل مشروع Flutter جديد.

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  int _selectedIndex = 0;

  // Pages you want to show
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomePageViewBody(),
      AchivePageView(pointsManager: PointsManager()),
      ProfileScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // // ألوان مشابهة للصورة
    // const primaryGreen = Color(0xFF10B981); // emerald
    // const lightGreenBg = Color(0xFFE8FDF4);
    // const softYellow = Color(0xFFFFF6E6);
    // const softBlue = Color(0xFFEFF6FF);
    // const cardWhite = Colors.white;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // Bottom navigation with floating effect
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.house),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.gifts),
              label: "Rewards",
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.idBadge),
              label: "Profile",
            ),
          ],
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // كود التنقل الذي يجعل الزر فعالاً
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CameraScannerScreen(),
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('تم الضغط على زر المسح السريع')),
            );
          },
          label: const Text('مسح سريع'),
          icon: const Icon(Icons.qr_code_scanner),
          backgroundColor: const Color(0xFF059669),
        ),
        body: _pages[_selectedIndex],
      ),
    );
  }
}

// // عنصر الـ Nav
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
