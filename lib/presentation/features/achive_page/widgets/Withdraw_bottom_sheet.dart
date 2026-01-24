// ---------------- WithdrawSheet ----------------
import 'package:flutter/material.dart';

class WithdrawBottomSheet extends StatefulWidget {
  final String title;
  final Color color;
  final IconData icon;
  final int maxPoints;
  final void Function(String phone, int points, String method) onConfirmed;

  const WithdrawBottomSheet({
    super.key,
    required this.title,
    required this.color,
    required this.icon,
    required this.maxPoints,
    required this.onConfirmed,
  });

  @override
  State<WithdrawBottomSheet> createState() => _WithdrawBottomSheetState();
}

class _WithdrawBottomSheetState extends State<WithdrawBottomSheet> {
  final TextEditingController phoneController = TextEditingController();
  double selectedPoints = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, color: widget.color, size: 40),
              const SizedBox(height: 10),
              Text(
                "سحب عبر ${widget.title}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "رقم الموبايل",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "رصيدك الحالي: ${widget.maxPoints} نقطة",
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 10),

              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "عدد النقاط المطلوب سحبها: ${selectedPoints.toInt()}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Slider(
                value: selectedPoints,
                min: 0,
                max: widget.maxPoints.toDouble(),
                divisions: widget.maxPoints > 0 ? widget.maxPoints : 1,
                label: selectedPoints.toInt().toString(),
                activeColor: widget.color,
                onChanged: (val) => setState(() => selectedPoints = val),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.color,
                  minimumSize: const Size.fromHeight(45),
                ),
                onPressed: selectedPoints.toInt() > 0
                    ? () {
                        final phone = phoneController.text.trim();
                        final pointsInt = selectedPoints.toInt();

                        if (phone.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("من فضلك ادخل رقم الموبايل"),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }

                        Navigator.of(context).pop();
                        widget.onConfirmed(phone, pointsInt, widget.title);
                      }
                    : null,
                child: const Text("تأكيد السحب"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
