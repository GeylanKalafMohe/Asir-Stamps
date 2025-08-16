import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_fonts.dart';
import '../../../../../viewmodels/voucher_viewmodel.dart';
import 'widgets/history_item.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: AppColors.primary),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'التاريخ',
            style: AppFonts.heading3.copyWith(
              color: AppColors.primary,
              fontWeight: AppFonts.bold,
            ),
          ),
        ),
        body: Consumer<VoucherViewModel>(
          builder: (context, voucherViewModel, child) {
            if (voucherViewModel.voucherRecords.isEmpty) {
              return const Center(
                child: Text(
                  'لا توجد سجلات',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: voucherViewModel.voucherRecords.length,
              itemBuilder: (context, index) {
                final record = voucherViewModel.voucherRecords[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: HistoryItem(
                    record: record,
                    onDelete: () {
                      voucherViewModel.removeVoucherRecord(index);
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
