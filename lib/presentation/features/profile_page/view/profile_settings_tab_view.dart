// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SwitchListTile(
          value: true,
          onChanged: (_) {},
          title: const Text("الإشعارات"),
          subtitle: const Text("إشعارات التذكير والجوائز"),
          secondary: const Icon(
            Icons.notifications_outlined,
            color: Color(0xFFF97316),
          ), // برتقالي
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.language, color: Color(0xFF0EA5E9)), // أزرق
          title: const Text("اللغة"),
          subtitle: const Text("العربية"),
          onTap: () {},
        ),
        SwitchListTile(
          value: false,
          onChanged: (_) {},
          title: const Text("المسح التلقائي"),
          subtitle: const Text("مسح العناصر تلقائيًا"),
          secondary: const Icon(
            Icons.qr_code_scanner,
            color: Color(0xFF8B5CF6),
          ), // بنفسجي
        ),
        ListTile(
          leading: const Icon(Icons.security, color: Color(0xFF16A34A)), // أخضر
          title: const Text("الخصوصية والأمان"),
          subtitle: const Text("إدارة بياناتك الشخصية"),
          onTap: () {},
        ),
        const SizedBox(height: 20),
        ListTile(
          leading: const Icon(
            Icons.help_outline,
            color: Color(0xFF0D9488),
          ), // أخضر مائل للأزرق
          title: const Text("المساعدة والدعم"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(
            Icons.settings,
            color: Color(0xFF6B7280),
          ), // رمادي
          title: const Text("إعدادات التطبيق"),
          onTap: () {},
        ),
        const SizedBox(height: 20),
        const Center(child: Text("عضو منذ يناير 2024")),
        const SizedBox(height: 20),
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.red,
            side: const BorderSide(color: Colors.red),
          ),
          onPressed: () {},
          icon: const Icon(Icons.logout),
          label: const Text("تسجيل الخروج"),
        ),
      ],
    );
  }
}
