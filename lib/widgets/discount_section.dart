import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';

class DiscountSection extends StatelessWidget {
  final int discountValue;
  final Function(int) onDiscountChanged;

  const DiscountSection({
    super.key,
    required this.discountValue,
    required this.onDiscountChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'قيمة الخصم الحالية:',
          style: AppFonts.bodyLarge.copyWith(
            color: AppColors.primary,
            fontWeight: AppFonts.bold,
          ),
        ),
        const SizedBox(height: 12),

        Row(
          children: [
            // Decrease Button
            IconButton(
              onPressed: () {
                if (discountValue > 5) {
                  onDiscountChanged(discountValue - 5);
                }
              },
              style: IconButton.styleFrom(
                backgroundColor: Colors.grey[200],
                shape: const CircleBorder(),
              ),
              icon: const Icon(Icons.remove, color: AppColors.primary),
            ),
            const SizedBox(width: 16),

            // Discount Display
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '$discountValue%',
                style: AppFonts.heading1.copyWith(
                  color: AppColors.primary,
                  fontWeight: AppFonts.bold,
                ),
              ),
            ),
            const SizedBox(width: 16),

            // Increase Button
            IconButton(
              onPressed: () {
                if (discountValue < 50) {
                  onDiscountChanged(discountValue + 5);
                }
              },
              style: IconButton.styleFrom(
                backgroundColor: Colors.grey[200],
                shape: const CircleBorder(),
              ),
              icon: const Icon(Icons.add, color: AppColors.primary),
            ),
          ],
        ),

        const SizedBox(height: 8),

        Text(
          'أو:',
          style: AppFonts.bodyMedium.copyWith(
            color: AppColors.primary,
            fontWeight: AppFonts.bold,
          ),
        ),
        const SizedBox(height: 4),

        // Input Field
        TextField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'اكتب قيمة الخصم الجديدة',
            hintStyle: AppFonts.bodySmall.copyWith(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
          ),
          onSubmitted: (value) {
            final newValue = int.tryParse(value);
            if (newValue != null && newValue >= 5 && newValue <= 50) {
              onDiscountChanged(newValue);
            }
          },
        ),
      ],
    );
  }
}
