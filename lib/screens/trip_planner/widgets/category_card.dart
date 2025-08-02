import 'package:asir_stamps_app/models/category_item.dart';
import 'package:asir_stamps_app/utils/app_colors.dart';
import 'package:asir_stamps_app/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryCard extends StatelessWidget {
  final CategoryItem item;

  const CategoryCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(end: 32),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(item.icon),
          ),
          const SizedBox(height: 4),
          Text(
            item.title,
            style: AppFonts.bodyTiny.copyWith(color: AppColors.textGrey),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
