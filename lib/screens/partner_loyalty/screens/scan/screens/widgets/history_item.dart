import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../../../models/voucher_record.dart';
import '../../../../../../utils/app_colors.dart';
import '../../../../../../utils/app_fonts.dart';

class HistoryItem extends StatelessWidget {
  final VoucherRecord record;
  final VoidCallback onDelete;

  const HistoryItem({super.key, required this.record, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final dateFormatter = intl.DateFormat('dd MMM yyyy', 'en_US');
    final timeFormatter = intl.DateFormat('hh:mm a', 'en');

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Right section with name and profile image
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.person),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              record.id,
              style: AppFonts.custom(color: Color(0xFF000643), fontSize: 20),
            ),
          ),

          // Middle section with discount and date/time
          Directionality(
            textDirection: TextDirection.ltr,
            child: Column(
              children: [
                Text(
                  '${record.discountPercentage.toInt()}%',
                  style: AppFonts.caption.copyWith(
                    color: AppColors.primary,
                    fontWeight: AppFonts.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  dateFormatter.format(record.date),
                  style: AppFonts.caption.copyWith(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                Text(
                  timeFormatter.format(record.date),
                  style: AppFonts.caption.copyWith(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          // Delete icon (left in RTL)
          IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete, color: AppColors.primary, size: 26),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}
