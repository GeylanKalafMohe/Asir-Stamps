import 'package:flutter/material.dart';

import '../../../utils/app_fonts.dart';

class SectionWidget extends StatelessWidget {
  final String title;
  final Widget? action;
  final Widget content;
  final EdgeInsets? padding;

  const SectionWidget({
    super.key,
    required this.title,
    required this.content,
    this.action,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: AppFonts.bodyLarge),
              if (action != null) action!,
            ],
          ),
        ),
        const SizedBox(height: 7),
        content,
      ],
    );
  }
}
