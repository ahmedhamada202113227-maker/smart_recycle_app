import 'package:flutter/material.dart';

class CameraScannerScreen extends StatelessWidget {
  const CameraScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // تحديد حجم الشاشة لتصميم متجاوب
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'ماسح النفايات', // Waste Scanner
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // 1. Placeholder لمنظر الكاميرا
          Container(
            color: Colors.black, // Placeholder for camera feed
            alignment: Alignment.center,
            child: const Icon(
              Icons.videocam_off,
              color: Colors.white54,
              size: 100,
            ),
          ),

          // 2. Overlay مع "حفرة" (منطقة المسح) باستخدام ColorFiltered
          ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Color.fromRGBO(0, 0, 0, 0.6), // غطاء داكن
              BlendMode.srcOut, // لتكوين دائرة شفافة
            ),
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    backgroundBlendMode: BlendMode.dstOut,
                  ),
                ),
                Center(
                  child: Container(
                    width: size.width * 0.7,
                    height: size.width * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(size.width * 0.35),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 3. مؤشرات المسح (داخل الدائرة)
          Center(
            child: Container(
              width: size.width * 0.7,
              height: size.width * 0.7,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green,
                  width: 3,
                ), // حدود الماسح
                borderRadius: BorderRadius.circular(size.width * 0.35),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt, color: Colors.white, size: 40),
                  SizedBox(height: 8),
                  Text(
                    'ضع النفايات داخل الدائرة', // Place waste inside the circle
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),

          // 4. لوحة التحكم السفلية
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFF27AE60), // خلفية خضراء
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _ControlPanelButton(icon: Icons.flash_on, label: 'فلاش'),
                  _ControlPanelButton(
                    icon: Icons.switch_camera,
                    label: 'تغيير',
                  ),
                  _ControlPanelButton(icon: Icons.image, label: 'صور'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ويدجت لأزرار لوحة التحكم
class _ControlPanelButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ControlPanelButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(icon, color: const Color(0xFF27AE60)),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}
