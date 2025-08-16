import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_fonts.dart';

class PlanCreatedBanner extends StatelessWidget {
  final String title;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  const PlanCreatedBanner({
    super.key,
    this.title = 'تم إنشاء الخطة السياحية',
    required this.onAccept,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Semantics(
            label: 'تم إنشاء الخطة السياحية. اختر قبول أو رفض.',
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppFonts.heading3.copyWith(
                    color: const Color(0xFF0F2B56),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),

                // Buttons Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Accept Button
                    Flexible(
                      child: _ActionButton(
                        text: 'قبول',
                        icon: Icons.check,
                        backgroundColor: const Color(0xFF64DD57),
                        foregroundColor: Colors.white,
                        semanticLabel: 'قبول الخطة',
                        onPressed: () {
                          HapticFeedback.lightImpact();
                          onAccept();
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Reject Button
                    Flexible(
                      child: _ActionButton(
                        text: 'رفض',
                        icon: Icons.close,
                        backgroundColor: const Color(0xFFE53935),
                        foregroundColor: Colors.white,
                        semanticLabel: 'رفض الخطة',
                        onPressed: () {
                          HapticFeedback.lightImpact();
                          onReject();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color backgroundColor;
  final Color foregroundColor;
  final String semanticLabel;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.text,
    required this.icon,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.semanticLabel,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      button: true,
      child: SizedBox(
        height: 44,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            shape: const StadiumBorder(),
            minimumSize: const Size(48, 44),
          ),
          icon: Icon(icon, size: 22),
          label: Text(
            text,
            style: AppFonts.bodyLarge.copyWith(
              fontWeight: FontWeight.bold,
              color: foregroundColor,
            ),
          ),
        ),
      ),
    );
  }
}
