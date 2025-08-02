import 'package:flutter/material.dart';

import '../../../models/user_info.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';

class AccountHeader extends StatelessWidget {
  final UserInfo userInfo;

  const AccountHeader({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'الحساب',
                style: AppFonts.heading2.copyWith(
                  color: AppColors.accountBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings, color: AppColors.accountBlue),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey[200],
                child: Image.asset(userInfo.profileImage, width: 100),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userInfo.name,
                      style: AppFonts.bodyLarge.copyWith(
                        color: AppColors.accountGreen,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'bakeraldabbik@gmail.com',
                      style: AppFonts.bodySmall.copyWith(
                        color: AppColors.accountGray,
                      ),
                    ),
                    SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accountBlue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                      ),
                      child: Text(
                        'تعديل الحساب',
                        style: AppFonts.caption.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
