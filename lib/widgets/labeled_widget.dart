import 'package:flutter/material.dart';

import '../utils/app_fonts.dart';

class LabeledWidget extends StatelessWidget {
  final String label;
  final Widget child;

  const LabeledWidget({super.key, required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppFonts.caption.copyWith(
            color: Colors.grey[700],
            fontWeight: AppFonts.medium,
          ),
        ),
        const SizedBox(height: 4),
        child,
      ],
    );
  }
}
