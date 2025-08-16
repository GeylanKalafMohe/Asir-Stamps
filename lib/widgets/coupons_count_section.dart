import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';

class CouponsCountSection extends StatelessWidget {
  final int couponsCount;
  final Function(int) onCountChanged;

  const CouponsCountSection({
    super.key,
    required this.couponsCount,
    required this.onCountChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'عدد القسائم:',
          style: AppFonts.bodyLarge.copyWith(
            color: AppColors.primary,
            fontWeight: AppFonts.bold,
          ),
        ),
        const SizedBox(height: 12),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                // Decrease by 1 Button
                IconButton(
                  onPressed: () {
                    if (couponsCount > 1) {
                      onCountChanged(couponsCount - 1);
                    }
                  },
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    shape: const CircleBorder(),
                  ),
                  icon: const Icon(Icons.remove, color: AppColors.primary),
                ),
                const SizedBox(height: 8),

                // Decrease by 10 Button
                ElevatedButton(
                  onPressed: () {
                    if (couponsCount > 10) {
                      onCountChanged(couponsCount - 10);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  child: Text(
                    '-10',
                    style: AppFonts.bodyMedium.copyWith(
                      fontWeight: AppFonts.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
            const SizedBox(width: 16),

            // Count Display
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '$couponsCount قسيمة',
                style: AppFonts.heading2.copyWith(
                  color: AppColors.primary,
                  fontWeight: AppFonts.bold,
                ),
              ),
            ),
            const SizedBox(width: 16),

            Column(
              children: [
                // Increase by 1 Button
                IconButton(
                  onPressed: () {
                    onCountChanged(couponsCount + 1);
                  },
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    shape: const CircleBorder(),
                  ),
                  icon: const Icon(Icons.add, color: AppColors.primary),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    onCountChanged(couponsCount + 10);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  child: Text(
                    '+10',
                    style: AppFonts.bodyMedium.copyWith(
                      color: Colors.white,
                      fontWeight: AppFonts.bold,
                    ),
                  ),
                ),
              ],
            ),

            // Increase by 10 Button
          ],
        ),
      ],
    );
  }
}
