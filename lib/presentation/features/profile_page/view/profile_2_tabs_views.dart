import 'package:flutter/material.dart';
import 'package:smart_recycle_app/presentation/features/profile_page/view/profile_settings_tab_view.dart';
import 'package:smart_recycle_app/presentation/features/profile_page/view/profile_tab_view.dart';

class Profile2TabsViews extends StatelessWidget {
  const Profile2TabsViews({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          bottom: const TabBar(
            indicatorColor: Color(0xFF16A34A),
            labelColor: Color(0xFF16A34A),
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: "الملف الشخصي"),
              Tab(text: "الإعدادات"),
            ],
          ),
        ),
        body: const TabBarView(children: [ProfileTab(), SettingsTab()]),
      ),
    );
  }
}
