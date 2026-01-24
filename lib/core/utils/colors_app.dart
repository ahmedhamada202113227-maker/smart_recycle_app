import 'package:flutter/material.dart';

class AppColors {
  // التدرج الأخضر في الهيدر
  static const LinearGradient headerGradient = LinearGradient(
    colors: [Color(0xFF00966C), Color(0xFF00B383)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // الألوان الأساسية
  static const Color primaryGreen = Color(0xFF00966C);
  static const Color lightGreen = Color(0xFF00B383);
  static const Color cardBackground = Color(0xFFF8FAFC);
  static const Color greyText = Color(0xFF6B7280);

  // ألوان الكروت الثلاثة
  static const Color statGreen = Color(0xFFD1FAE5);
  static const Color statYellow = Color(0xFFFFF7ED);
  static const Color statBlue = Color(0xFFE0F2FE);

  // ألوان الإنجازات
  static const Color badgeGold = Color(0xFFF59E0B);
  static const Color badgePurple = Color(0xFF8B5CF6);
  static const Color badgeGreen = Color(0xFF16A34A);
  static const Color badgeBlue = Color(0xFF0EA5E9);
}
