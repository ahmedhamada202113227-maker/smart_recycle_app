import 'package:flutter/material.dart';
import 'package:smart_recycle_app/presentation/features/profile_page/view/profile_2_tabs_views.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex == 2
          ? const Profile2TabsViews()
          : const Center(child: Text('صفحة الملف الشخصي')),
    );
  }
}
