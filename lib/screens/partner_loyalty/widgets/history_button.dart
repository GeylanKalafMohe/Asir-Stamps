import 'package:flutter/material.dart';

import '../../../utils/app_fonts.dart';

class HistoryButton extends StatelessWidget {
  final VoidCallback onPressed;

  const HistoryButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF122F5B),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: const Color(0xFF000643),
            backgroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 8),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          icon: const Icon(Icons.history, size: 30),
          iconAlignment: IconAlignment.end,
          label: Text('عرض التاريخ', style: AppFonts.heading3),
        ),
      ),
    );
  }
}
