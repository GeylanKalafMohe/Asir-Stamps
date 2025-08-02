import 'package:asir_stamps_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/popular_place.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';

class PlaceInfoCard extends StatefulWidget {
  final PopularPlace place;

  const PlaceInfoCard({super.key, required this.place});

  @override
  State<PlaceInfoCard> createState() => _PlaceInfoCardState();
}

class _PlaceInfoCardState extends State<PlaceInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      children: [
                        Text(
                          widget.place.title,
                          style: AppFonts.bodyLarge.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              ' (${widget.place.requiredStamps} ختم ',
                              style: AppFonts.bodyLarge.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SvgPicture.asset(AppIcons.stamp, width: 20),
                            Text(
                              ' )',
                              style: AppFonts.bodyLarge.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 4),
                    Text(
                      widget.place.location,
                      style: AppFonts.bodySmall.copyWith(
                        color: AppColors.textGrey,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => setState(
                  () => widget.place.isBookmarked = !widget.place.isBookmarked,
                ),
                icon: Icon(
                  widget.place.isBookmarked
                      ? Icons.bookmark
                      : Icons.bookmark_border,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            widget.place.description,
            style: AppFonts.bodyMedium.copyWith(color: AppColors.textGrey),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),
          Text(
            'ساعات العمل الرسمية:',
            style: AppFonts.bodyMedium.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            widget.place.workingHours,
            style: AppFonts.bodySmall.copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Text(
            'عدد الأختام المجمعة في المكان:',
            style: AppFonts.bodyMedium.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(AppIcons.stamp),
                  const SizedBox(width: 8),
                  Text(
                    '${widget.place.collectedStamps}/${widget.place.requiredStamps}',
                    style: AppFonts.bodyLarge.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
